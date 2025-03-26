# 📘 School Management System (Flutter)

A modern and scalable School Management System built using Flutter & Firebase with MVVM architecture and Riverpod for state management.

## 🚀 Features

✅ Multi-Role Authentication (Admin, Teacher, Student)<br>
✅ Firebase Integration (Auth, Firestore, Storage)<br>
✅ MVVM Architecture with Riverpod<br>
✅ Localization Support (English, Bengali, Hindi)<br>
✅ Modern UI/UX with Light & Dark Themes<br>
✅ Secure Firestore Rules<br>
✅ Push Notifications<br>
✅ Reusable UI Components & Clean Code Structure

## 📂 Project Structure
```
lib/
│── main.dart                  # Entry point of the app
│── app.dart                   # Manages app-wide themes & routes
│── config/                    # App configuration (themes, constants, etc.)
│   ├── app_theme.dart         # Theme settings
│   ├── app_strings.dart       # App-wide strings
│   ├── firebase_options.dart  # Firebase configuration
│── core/                      # Core functionalities
│   ├── services/              # Firebase/Auth/Storage/Notification Services
│   │   ├── auth_service.dart
│   │   ├── firestore_service.dart
│   │   ├── notification_service.dart
│   ├── utils/                 # Helper functions (formatters, validators, etc.)
│   │   ├── date_formatter.dart
│   │   ├── validators.dart
│   ├── error_handling/        # Custom error handling
│   │   ├── firebase_exceptions.dart
│   │   ├── network_exceptions.dart
│── data/                      # Data Layer (Models, Repositories)
│   ├── models/                # Data models
│   │   ├── user_model.dart
│   │   ├── attendance_model.dart
│   │   ├── assignment_model.dart
│   ├── repositories/          # Handles interactions with Firestore
│   │   ├── auth_repository.dart
│   │   ├── user_repository.dart
│   │   ├── attendance_repository.dart
│── providers/                 # Riverpod providers
│   ├── auth_provider.dart
│   ├── user_provider.dart
│   ├── attendance_provider.dart
│── routes/                    # Navigation and Page Routing
│   ├── app_routes.dart        # Route names
│   ├── app_pages.dart         # Route management
│── assets/              # Multi-language support
│   ├── en.json     # English
│   ├── bn.json     # Bengali
│   ├── hn.json     # Hindi
│── features/                  # Organized by feature (MVVM pattern)
│   ├── auth/                  # Authentication module
│   │   ├── view/              # UI Screens
│   │   │   ├── login_screen.dart
│   │   │   ├── register_screen.dart
│   │   ├── viewmodel/         # Business Logic
│   │   │   ├── auth_viewmodel.dart
│   │   ├── widgets/           # Reusable widgets
│   │   │   ├── login_form.dart
│   │   │   ├── register_form.dart
│   │   │   ├── forgot_password_dialog.dart
│   ├── tour/               # App Launching Screens
│   │   ├── splash_screen.dart
│   │   ├── navigation_card_screen.dart     # For Admin/Teacher/Student
│   ├── admin/                 # Admin Module
│   │   ├── view/              # UI Screens
│   │   │   ├── admin_dashboard.dart
│   │   │   ├── approve_users_screen.dart
│   │   ├── viewmodel/         # Business Logic
│   │   │   ├── admin_viewmodel.dart
│   │   ├── widgets/           # Reusable widgets
│   │   │   ├── user_list_tile.dart
│   ├── teacher/               # Teacher Module
│   │   ├── view/
│   │   │   ├── teacher_dashboard.dart
│   │   │   ├── mark_attendance_screen.dart
│   │   ├── viewmodel/
│   │   │   ├── teacher_viewmodel.dart
│   │   ├── widgets/
│   │   │   ├── attendance_list_tile.dart
│   ├── student/               # Student Module
│   │   ├── view/
│   │   │   ├── student_dashboard.dart
│   │   │   ├── submit_assignment_screen.dart
│   │   ├── viewmodel/
│   │   │   ├── student_viewmodel.dart
│   │   ├── widgets/
│   │   │   ├── assignment_card.dart
│── widgets/                   # Global Reusable Widgets
│   ├── custom_button.dart
│   ├── custom_textfield.dart
│   ├── loading_indicator.dart
│── themes/                    # Global UI themes
│   ├── light_theme.dart
│   ├── dark_theme.dart
├── pubspec.yaml
├── README.md
```
## 🛠️ Installation
### 1️⃣ Clone the Repository
```
git clone https://github.com/Surajit-Roy/edusmart.git
cd school-management-system
```
### 2️⃣ Install Dependencies
```
flutter pub get
```
### 3️⃣ Setup Firebase
1. Create a Firebase Project at Firebase Console

2. Add Android & iOS apps

3. Download and place the google-services.json (Android) and GoogleService-Info.plist (iOS) in the appropriate directories

4. Enable Firestore, Authentication, and Cloud Messaging

### 4️⃣ Run the Project
```
flutter run
```

💡 Have suggestions or improvements? Feel free to contribute! 🚀