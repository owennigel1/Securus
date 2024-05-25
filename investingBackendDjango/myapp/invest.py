import yfinance as yf
import numpy as np
import pandas as pd
import cvxpy as cp

# List of ETF tickers
etfs = ['SPY', 'EFA', 'IEMG', 'AGG', 'LQD', 'GLD']

# Download historical price data
data = yf.download(etfs, start='2020-01-01', end='2023-01-01')['Adj Close']

# Calculate daily returns
returns = data.pct_change().dropna()

# Calculate mean returns and covariance matrix
mean_returns = returns.mean()
cov_matrix = returns.cov()

# Number of assets
num_assets = len(etfs)

# Define the optimization problem
weights = cp.Variable(num_assets)
expected_return = mean_returns.values @ weights
risk = cp.quad_form(weights, cov_matrix.values)
risk_aversion = 1  # Adjust this parameter to change the trade-off between risk and return

# Objective function: maximize the Sharpe ratio
objective = cp.Maximize(expected_return - risk_aversion * cp.norm(risk, 2))
constraints = [cp.sum(weights) == 1, weights >= 0]

# Solve the problem
problem = cp.Problem(objective, constraints)
problem.solve()

# Get the optimal weights
optimal_weights = weights.value

# Create a DataFrame to display the results
portfolio = pd.DataFrame({
    'ETF': etfs,
    'Weight': optimal_weights
})

print(portfolio)

# Calculate the expected return and risk of the optimized portfolio
optimized_return = mean_returns.values @ optimal_weights
optimized_risk = np.sqrt(optimal_weights.T @ cov_matrix.values @ optimal_weights)

print(f"Expected return: {optimized_return:.2%}")
print(f"Portfolio risk (standard deviation): {optimized_risk:.2%}")
