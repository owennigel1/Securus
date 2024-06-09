import yfinance as yf
import pandas as pd

# Define the list of tickers and the period of data to collect
tickers = ['AAPL', 'MSFT', 'GOOGL', 'AMZN']
start_date = '2010-01-01'
end_date = '2023-01-01'

# Fetch the data
data = yf.download(tickers, start=start_date, end=end_date)

# Calculate daily returns
returns = data['Adj Close'].pct_change().dropna()

# Feature engineering (e.g., moving averages, momentum indicators)
features = pd.DataFrame(index=returns.index)

# Example features: moving averages
for window in [5, 10, 20]:
    features[f'ma_{window}'] = returns.rolling(window=window).mean()

# Drop missing values
features = features.dropna()
returns = returns.loc[features.index]

import torch
import torch.nn as nn
import torch.optim as optim
from sklearn.model_selection import train_test_split

# Define the neural network
class StockPredictor(nn.Module):
    def __init__(self, input_dim):
        super(StockPredictor, self).__init__()
        self.fc1 = nn.Linear(input_dim, 128)
        self.fc2 = nn.Linear(128, 64)
        self.fc3 = nn.Linear(64, returns.shape[1])  # Predicting returns for each asset
    
    def forward(self, x):
        x = torch.relu(self.fc1(x))
        x = torch.relu(self.fc2(x))
        x = self.fc3(x)
        return x

# Prepare data for training
X = torch.tensor(features.values, dtype=torch.float32)
y = torch.tensor(returns.values, dtype=torch.float32)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Create the model, define the loss function and the optimizer
input_dim = X_train.shape[1]
model = StockPredictor(input_dim)
criterion = nn.MSELoss()
optimizer = optim.Adam(model.parameters(), lr=0.001)

# Training loop
num_epochs = 100
for epoch in range(num_epochs):
    model.train()
    optimizer.zero_grad()
    outputs = model(X_train)
    loss = criterion(outputs, y_train)
    loss.backward()
    optimizer.step()
    if (epoch + 1) % 10 == 0:
        print(f'Epoch [{epoch+1}/{num_epochs}], Loss: {loss.item():.4f}')

# Evaluate the model
model.eval()
with torch.no_grad():
    predictions = model(X_test)
    test_loss = criterion(predictions, y_test)
print(f'Test Loss: {test_loss.item():.4f}')

# Get predicted returns for the entire dataset
model.eval()
with torch.no_grad():
    predicted_returns = model(torch.tensor(features.values, dtype=torch.float32))

# Convert to numpy array
predicted_returns = predicted_returns.numpy()

# Define portfolio optimization function
def optimize_portfolio(predicted_returns):
    num_assets = predicted_returns.shape[1]
    weights = torch.randn(num_assets, requires_grad=True)
    optimizer = optim.Adam([weights], lr=0.01)
    
    def portfolio_return(weights):
        return torch.sum(torch.mean(predicted_returns, axis=0) * weights)
    
    def portfolio_volatility(weights):
        return torch.sqrt(torch.matmul(weights.T, torch.matmul(torch.tensor(returns.cov().values, dtype=torch.float32), weights)))
    
    def sharpe_ratio(weights):
        return -portfolio_return(weights) / portfolio_volatility(weights)  # Negate to maximize

    for _ in range(1000):
        optimizer.zero_grad()
        loss = sharpe_ratio(weights)
        loss.backward()
        optimizer.step()

    return torch.nn.functional.softmax(weights, dim=0).detach().numpy()

# Optimize portfolio
optimized_weights = optimize_portfolio(predicted_returns)
