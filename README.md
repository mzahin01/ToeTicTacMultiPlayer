# Tic Tac Toe Multiplayer

A multiplayer Tic Tac Toe game built with Flutter and Firebase.

## Deployment URL

The project is deployed on Firebase Hosting. You can access the live version here:
[https://toe-tic-tac-zahin.web.app/](https://toe-tic-tac-zahin.web.app/)

## Features

-   **User Authentication**: Secure sign-up and login using Firebase Authentication.
-   **Real-time Online Gameplay**: Play Tic Tac Toe with another player online, with real-time updates using Cloud Firestore.
-   **Offline Mode**: Play with a friend on the same device.
-   **User List**: View a list of registered users.

## Tech Stack

-   **Frontend**: Flutter
-   **State Management**: GetX
-   **Backend & Database**: Firebase
    -   Firebase Authentication
    -   Cloud Firestore

## Project Structure

The project is structured in a modular way using GetX conventions.

```
lib/
├── app/
│   ├── data/
│   ├── modules/
│   │   ├── log_in_page/
│   │   ├── main_page/
│   │   ├── registration_page/
│   │   ├── tictactoe_offline/
│   │   ├── tictactoe_online/
│   │   └── user_list/
│   └── routes/
├── firebase_options.dart
└── main.dart
```

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

-   Flutter SDK: Make sure you have the Flutter SDK installed.
-   Firebase Account: You will need a Firebase account to set up the backend.

### Installation

1.  **Clone the repo**
    ```sh
    git clone https://github.com/mzahin01/ToeTicTacMultiPlayer.git
    ```
2.  **Install Flutter packages**
    ```sh
    flutter pub get
    ```
3.  **Setup Firebase**
    -   Create a project on [Firebase](https://firebase.google.com/).
    -   Add an Android and/or iOS app to your Firebase project.
    -   Follow the Firebase setup instructions and place your `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files in the correct locations.
    -   Enable Email/Password sign-in method in Firebase Authentication.
    -   Set up Firestore rules to allow read/write access.

4.  **Run the app**
    ```sh
    flutter run
    ```
