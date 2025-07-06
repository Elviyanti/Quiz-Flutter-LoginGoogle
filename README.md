# quiz

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
=======
# 🔐 Flutter Google Sign-In with Dark/Light Theme

This Flutter application demonstrates how to implement **Google Sign-In authentication**, with **light/dark theme switching** and **logout functionality**. Once a user successfully logs in using their Google account, they are redirected to the Home screen. Users can also toggle between light and dark modes and securely log out of their session.

---

## ✨ Features

- 🔒 Login with Google account using Firebase Authentication
- 🏠 Redirect to Home page upon successful sign-in
- 🌗 Toggle between **Light Mode** and **Dark Mode**
- 🚪 Secure Logout functionality

---

## 📱 Screens

- `LoginScreen` – User signs in with Google
- `HomeScreen` – Displayed after successful login
- Theme toggle is available from the app bar or settings
- `Logout` button signs the user out and returns to login screen

---

## 🛠️ Technologies Used

| Technology     | Description                              |
|----------------|------------------------------------------|
| Flutter        | Mobile UI framework                      |
| Dart           | Programming language                     |
| Firebase Auth  | Authentication using Google Sign-In      |
| Provider / Bloc / GetX (optional) | State management for theme and user auth |
| Google Sign-In | OAuth sign-in flow                       |
| SharedPreferences (optional) | Store selected theme mode persistently |

