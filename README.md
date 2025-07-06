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
