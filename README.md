
### This project was made during the 24-hour hacksingapore 2024 hackathon organised by AngelHack ✨

# Securus - Retirement Planning Mobile App Targeted at the Ageing Population

  

Securus is a mobile application designed to assist the ageing population in planning their retirement effectively. The app leverages CVXPY, an open source Python-embedded modelling language for convex optimization problems to optimise our portfolio management system. Based on inputs such as desired retirement age and choice of lifestyle, we also provide personalised retirement planning advice, helping users secure a financially stable future.

  

## Table of Contents

- [Introduction](#introduction)

- [Tech Stack](#tech-stack)

- [Features](#features)

- [Installation](#installation)

- [Usage](#usage)

- [Contributing](#contributing)

  

## Introduction

Securus aims to simplify retirement planning for the elderly by providing an intuitive and user-friendly mobile application. Utilizing AI and machine learning, the app offers tailored retirement plans based on individual financial data and goals.

  

## Tech Stack

-  **Frontend**: Flutter and XCode (iOS environment)

-  **Backend**: Python Django

-  **Database**: Firestore Firebase

-  **Open Source Library**: CVXPY, an open source Python-embedded modeling language for convex optimization problems

  

## Features

- Personalized retirement planning

- Financial data analysis

- Secure and user-friendly interface

- Integration with reputable financial data sources

- Customizable retirement goals and timelines

  

## Installation

  

### Prerequisites

Ensure you have the following installed:

- Flutter

- XCode (for iOS development)

- Python

- Django

- Firebase account and Firestore setup

- CVXPY

  

### Steps

  

#### Frontend

1. Clone the repository:

```sh

git clone https://github.com/owennigel1/Securus.git

```

2. Navigate to the frontend directory:

```sh

cd securus/frontend

```

3. Install dependencies:

```sh

flutter pub get

```

  

#### Backend

1. Navigate to the backend directory:

```sh

cd securus/backend

```

2. Create a virtual environment:

```sh

python -m venv venv

```

3. Activate the virtual environment:

```sh

# On Windows

venv\Scripts\activate

  

# On macOS/Linux

source venv/bin/activate

```

4. Install dependencies:

```sh

pip install -r requirements.txt

```

  

5. Set up Firebase credentials:

- Create a `firebase_credentials.json` file in the backend directory and add your Firebase project credentials.

  

6. Run database migrations:

```sh

python manage.py migrate

```

  

7. Start the Django server:

```sh

python manage.py runserver

```

  

## Usage

  

### Running the Frontend

1. Ensure your emulator or physical device is set up and running.

2. In the `frontend` directory, run the Flutter application:

```sh

flutter run

```

  

### Running the Backend

1. Ensure the virtual environment is activated.

2. Navigate to the backend directory and run the Django server:

```sh

python manage.py runserver

```

  

### Accessing the App

- Open the app on your emulator or physical device.

- Follow the on-screen instructions to set up your profile and start planning your retirement.

  

## Contributing

We welcome contributions to enhance Securus. To contribute:

  

1. Fork the repository.

2. Create a new branch: `git checkout -b feature-branch`

3. Commit your changes: `git commit -m 'Add some feature'`

4. Push to the branch: `git push origin feature-branch`

5. Open a pull request.

  

Please ensure your code adheres to the project's coding standards and includes appropriate tests.

  

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.