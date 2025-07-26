# 🚗 Car Rental App

A cross-platform mobile application for renting cars, built with **Flutter** and integrated with **Firebase** for backend services. This app allows users to browse available vehicles, book rentals, and manage bookings conveniently.

---

## 📱 Features

- 🔐 User authentication with Firebase Auth
- 🚘 Browse and view details of available cars
- 📅 Book and manage car rentals
- 💼 Admin panel for car listings and bookings (if implemented)
- 📦 Firebase integration for real-time database and cloud storage
- 🔔 Push notifications (if enabled)
- 🌐 Web support (Flutter Web)

---

## 📁 Project Structure

```
lib/
├── data/               # Data sources and repositories
├── domain/             # Entities and use cases
├── presentation/       # UI components and screens
├── firebase_options.dart
├── injection_container.dart
├── main.dart
```

---

## ⚙️ Installation

### 1. Clone the Repository

```bash
git clone https://github.com/fayastm03/car-rental-app.git
cd car-rental-app
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Firebase Setup

- Create a project in [Firebase Console](https://console.firebase.google.com/)
- Add Android/iOS/Web platforms
- Download and place the configuration files:
  - `google-services.json` (for Android) in `android/app/`
  - `GoogleService-Info.plist` (for iOS) in `ios/Runner/`
- Use `flutterfire configure` if needed to generate `firebase_options.dart`

---

## ▶️ Run the App

```bash
flutter run
```

---

## 🧱 Architecture

Follows the **Clean Architecture** approach:

- **Presentation Layer** – UI and State Management
- **Domain Layer** – Entities and Business Logic
- **Data Layer** – Firebase and local storage interaction

---

## 📦 Dependencies

Includes (but not limited to):

- `firebase_core`
- `firebase_auth`
- `cloud_firestore`
- `get_it` – Dependency Injection
- `flutter_bloc` / `provider` – State Management
- Check `pubspec.yaml` for full list

---

## 🧪 Testing

```bash
flutter test
```

---

## 🙌 Contributing

Pull requests are welcome! For major changes, open an issue first to discuss what you’d like to change.

---

## 📄 License

This project is licensed under the **MIT License**.

---

## 📬 Contact

**Fayas T M**  
📧 fayastm03@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/fayas-tm-098467322)  
💻 [GitHub](https://github.com/fayastm03)

