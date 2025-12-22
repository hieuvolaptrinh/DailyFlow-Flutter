# 📋 DailyFlow - Personal Task Management App

<p align="center">
  <img src="assets/images/checkIcon.png" alt="DailyFlow Logo" width="120"/>
</p>

<p align="center">
  <strong>A modern, offline-first task management application built with Flutter</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-3.x-blue?logo=dart" alt="Dart"/>
  <img src="https://img.shields.io/badge/Realm-MongoDB-green?logo=mongodb" alt="Realm"/>
  <img src="https://img.shields.io/badge/Firebase-Cloud-orange?logo=firebase" alt="Firebase"/>
  <img src="https://img.shields.io/badge/BLoC-State%20Management-purple" alt="BLoC"/>
</p>

---

## 📖 Table of Contents

- [About](#-about)
- [Features](#-features)
- [Screenshots](#-screenshots)
- [Tech Stack](#-tech-stack)
- [Architecture](#-architecture)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Configuration](#-configuration)
- [Localization](#-localization)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🎯 About

**DailyFlow** is a cross-platform personal task management mobile application designed to help users organize their daily tasks efficiently. Built with Flutter, it features modern state management patterns (BLoC/Cubit & Provider), offline-first architecture using Realm database, and cloud synchronization with Firebase.

### Why DailyFlow?
- 📱 **Cross-platform**: Works on both iOS and Android
- 🔒 **Offline-first**: All data stored locally with Realm
- ☁️ **Cloud Sync**: Firebase integration for data backup
- 🌐 **Multi-language**: Vietnamese & English support
- 🎨 **Modern UI**: Beautiful dark theme with smooth animations

---

## ✨ Features

### Core Features
| Feature | Description |
|---------|-------------|
| 📝 **Task Management** | Create, edit, and organize your daily tasks |
| 📂 **Category System** | Organize tasks with customizable categories |
| ⚡ **Priority Levels** | Set Low, Medium, or High priority for tasks |
| 📅 **Scheduling** | Schedule tasks with date and time picker |
| 🏷️ **Custom Icons** | Choose icons for categories from Material Icons library |
| 🎨 **Color Picker** | Customize category colors with full color palette |

### User Experience
| Feature | Description |
|---------|-------------|
| 🌙 **Dark Theme** | Eye-friendly dark mode design |
| 📱 **Onboarding** | Guided introduction for new users |
| 🔐 **Authentication** | Login/Register with form validation |
| 🌍 **i18n Support** | Vietnamese and English languages |
| ⚡ **Fast & Smooth** | Optimized performance with BLoC pattern |

---

## 📱 Screenshots

<!-- Add your screenshots here -->
```
Coming soon...
```

---

## 🛠️ Tech Stack

### Frontend
| Technology | Purpose |
|------------|---------|
| **Flutter 3.x** | Cross-platform UI framework |
| **Dart** | Programming language |
| **Material Design** | UI components |

### State Management
| Technology | Purpose |
|------------|---------|
| **flutter_bloc** | BLoC/Cubit for authentication |
| **Provider** | Dependency injection & simple state |
| **Equatable** | Value equality for state comparison |

### Database & Backend
| Technology | Purpose |
|------------|---------|
| **Realm** | Local NoSQL database (MongoDB) |
| **Firebase Core** | Firebase initialization |
| **Cloud Firestore** | Cloud database sync |

### UI/UX Libraries
| Library | Purpose |
|---------|---------|
| **google_fonts** | Custom typography (Lato) |
| **flutter_iconpicker** | Material icons selection |
| **flutter_colorpicker** | Color selection dialogs |
| **easy_localization** | Multi-language support |

---

## 🏗️ Architecture

DailyFlow follows **Clean Architecture** principles with clear separation of concerns:

```
┌─────────────────────────────────────────────────────────────┐
│                        UI Layer                              │
│  (Widgets, Pages, Dialogs)                                  │
├─────────────────────────────────────────────────────────────┤
│                    ViewModel Layer                           │
│  (BLoC/Cubit, Provider)                                     │
├─────────────────────────────────────────────────────────────┤
│                      Data Layer                              │
│  (Models, Realm Entities, Repositories)                     │
├─────────────────────────────────────────────────────────────┤
│                    External Services                         │
│  (Realm Database, Firebase, SharedPreferences)              │
└─────────────────────────────────────────────────────────────┘
```

### State Management Patterns

#### BLoC/Cubit (Authentication)
```dart
// LoginCubit handles authentication state
class LoginCubit extends Cubit<LoginState> {
  Future<void> login(email, password) async {
    emit(state.copyWith(status: LoginStatus.loading));
    // Authentication logic...
    emit(state.copyWith(status: LoginStatus.success));
  }
}
```

#### Provider (Category Management)
```dart
// CategoryProvider manages category CRUD operations
class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categories = [];
  
  Future<void> loadCategories() async {
    // Load from Realm...
    notifyListeners();
  }
}
```

---

## 📁 Project Structure

```
lib/
├── core/                          # Core utilities & shared components
│   ├── theme/                     # App theme configuration
│   ├── utils/                     # Utilities & extensions
│   │   ├── color_extension.dart   # HexColor conversion
│   │   └── enum/                  # Enums (OnboardingPagePosition)
│   └── widget/                    # Reusable widgets
│       ├── auth_input.dart        # Custom text input for auth
│       ├── category_preview.dart  # Category preview widget
│       └── field_title.dart       # Form field title
│
├── data/                          # Data layer
│   ├── model/                     # Data models
│   │   ├── category_model.dart    # Category UI model
│   │   └── realm/                 # Realm entities
│   │       ├── category_realm_entity.dart
│   │       └── category_realm_entity.realm.dart (generated)
│   └── repository/                # Repository pattern (WIP)
│
├── viewmodel/                     # Business logic layer
│   ├── cubit/                     # BLoC/Cubit classes
│   │   ├── login_cubit.dart       # Login business logic
│   │   └── login_state.dart       # Login states
│   └── category_provider.dart     # Category state management
│
├── ui/                            # Presentation layer
│   ├── splash/                    # Splash screen
│   ├── onboarding/                # Onboarding flow (3 pages)
│   ├── welcome/                   # Welcome page
│   ├── login/                     # Login page
│   ├── register/                  # Register page
│   ├── main/                      # Main page with BottomNav
│   ├── task/                      # Task creation
│   ├── category/                  # Category management
│   │   ├── category_list_dialog.dart
│   │   ├── create_edit_category_page.dart
│   │   └── widget/                # Category-specific widgets
│   └── task_priority/             # Priority selection
│
├── routes/                        # Navigation
│   ├── routes.dart                # Route constants
│   └── app_router.dart            # Route generator
│
├── firebase_options.dart          # Firebase configuration
└── main.dart                      # App entry point
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK >= 3.8.1
- Dart SDK >= 3.8.1
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/dailyflow.git
   cd dailyflow
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Realm models** (if needed)
   ```bash
   dart run build_runner build
   ```

4. **Configure Firebase**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Place them in the appropriate directories

5. **Run the app**
   ```bash
   flutter run
   ```

---

## ⚙️ Configuration

### Environment Variables

Create a `.env` file in the root directory:

```env
# Firebase Configuration (optional, can use firebase_options.dart)
FIREBASE_API_KEY=your_api_key
FIREBASE_PROJECT_ID=your_project_id
```

### Firebase Setup

The app uses FlutterFire CLI for Firebase configuration. The `firebase_options.dart` file is auto-generated.

```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure Firebase
flutterfire configure
```

---

## 🌍 Localization

DailyFlow supports multiple languages:

| Language | Code | File |
|----------|------|------|
| Vietnamese | `vi` | `assets/translations/vi.json` |
| English | `en` | `assets/translations/en.json` |

### Adding a new language

1. Create a new JSON file in `assets/translations/`
2. Add the locale in `main.dart`:
   ```dart
   supportedLocales: [
     Locale("vi"),
     Locale("en"),
     Locale("new_lang"), // Add here
   ],
   ```

### Using translations in code

```dart
// In widgets
context.tr('login_page.username_hint')

// With parameters
context.tr('greeting', args: ['John'])
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # UI Components
  cupertino_icons: ^1.0.8
  google_fonts: ^6.2.1
  flutter_iconpicker: 3.2.4
  flutter_colorpicker: ^1.1.0
  
  # State Management
  provider: ^6.1.2
  flutter_bloc: ^8.1.4
  equatable: ^2.0.5
  
  # Database
  realm: ^20.2.0
  shared_preferences: ^2.5.3
  
  # Firebase
  firebase_core: ^3.8.0
  cloud_firestore: ^5.4.4
  
  # Localization
  easy_localization: ^3.0.8
  intl: any

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  build_runner: ^2.4.15
```

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Style

- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use meaningful variable and function names
- Write comments for complex logic
- Keep widgets small and focused

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Your Name**
- GitHub: [@yourusername](https://github.com/yourusername)
- LinkedIn: [Your LinkedIn](https://linkedin.com/in/yourprofile)

---

## 🙏 Acknowledgments

- [Flutter](https://flutter.dev/) - UI framework
- [Realm](https://realm.io/) - Mobile database
- [Firebase](https://firebase.google.com/) - Backend services
- [BLoC Library](https://bloclibrary.dev/) - State management

---

<p align="center">
  Made with ❤️ using Flutter
</p>
