# 📚 Bookly App

A modern Flutter application for discovering and browsing free programming books powered by the Google Books API. Built with clean architecture principles and BLoC state management.

## ✨ Features

- **📖 Featured Books**: Browse curated collection of free programming books with an elegant carousel
- **🆕 Newest Books**: Discover the latest computer science and programming books
- **🔍 Search**: Find books by keywords, topics, or titles
- **📱 Book Details**: View comprehensive book information including ratings, descriptions, and authors
- **🔗 Direct Access**: Open books directly via URL links
- **💡 Similar Books**: Discover related books based on categories
- **⚡ Smooth UI**: Loading skeletons with shimmer effects for better user experience
- **🖼️ Image Caching**: Optimized network image loading and caching

## 🏗️ Architecture

This project follows **Clean Architecture** principles combined with **BLoC pattern** for state management:

```
lib/
├── Features/                  # Feature-based modules
│   ├── home/
│   │   ├── data/             # Data layer (models, repositories)
│   │   │   ├── models/       # Data models (BookModel, VolumeInfo, etc.)
│   │   │   └── repos/        # Repository interface & implementation
│   │   └── presentation/
│   │       ├── manager/      # BLoC/Cubit state management
│   │       │   ├── featured_books_cubit/
│   │       │   ├── newest_books_cubit/
│   │       │   └── similar_books_cubit/
│   │       └── views/        # UI screens & widgets
│   ├── search/               # Search feature module
│   └── Splash/              # Splash screen
│
├── Core/                     # Shared utilities & resources
│   ├── utils/
│   │   ├── api_service.dart         # Dio-based API client
│   │   ├── app_router.dart          # Go Router navigation
│   │   ├── service_locator.dart     # GetIt dependency injection
│   │   ├── assets.dart              # Asset paths
│   │   └── styles.dart              # App styling
│   ├── widgets/                      # Reusable widgets
│   └── errors/                       # Error handling (Failures)
│
├── main.dart                 # App entry point
└── constants.dart           # App-wide constants
```

### Design Patterns Used

- **Clean Architecture**: Separation of concerns with clear layer boundaries
- **BLoC Pattern**: State management using Cubits from flutter_bloc
- **Repository Pattern**: Abstract data access through repository interfaces
- **Dependency Injection**: GetIt service locator for loose coupling
- **Functional Programming**: Dartz for error handling with Either type

## 🛠️ Tech Stack

### Core Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| [flutter_bloc](https://pub.dev/packages/flutter_bloc) | ^8.1.6 | State management with BLoC/Cubit |
| [go_router](https://pub.dev/packages/go_router) | 14.2.3 | Declarative routing & navigation |
| [dio](https://pub.dev/packages/dio) | ^5.7.0 | HTTP client for API requests |
| [get_it](https://pub.dev/packages/get_it) | ^8.0.3 | Service locator / dependency injection |
| [dartz](https://pub.dev/packages/dartz) | ^0.10.1 | Functional programming utilities |
| [cached_network_image](https://pub.dev/packages/cached_network_image) | 3.3.1 | Network image loading & caching |
| [shimmer](https://pub.dev/packages/shimmer) | ^3.0.0 | Loading skeleton animations |
| [google_fonts](https://pub.dev/packages/google_fonts) | 6.1.0 | Typography (Montserrat) |
| [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter) | ^10.8.0 | Icon library |
| [url_launcher](https://pub.dev/packages/url_launcher) | 6.3.0 | Launch external URLs |
| [equatable](https://pub.dev/packages/equatable) | ^2.0.7 | Value equality for models |

### API Integration

**Google Books API v1**
- Base URL: `https://www.googleapis.com/books/v1/`
- Endpoints:
  - Featured Books: `volumes?Filtering=free-ebooks&q=subject:Programming`
  - Newest Books: `volumes?Filtering=free-ebooks&Sorting=newest&q=computer science`
  - Search: `volumes?q={query}`

## 🚀 Getting Started

### Prerequisites

- Flutter SDK: `>=3.2.2 <4.0.0`
- Dart SDK (included with Flutter)
- Android Studio / VS Code with Flutter extensions
- iOS development: Xcode (Mac only)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/aya-hamoudeh1/bookly_app.git
   cd bookly_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # Development mode
   flutter run

   # Release mode
   flutter run --release
   ```

### Platform-Specific Setup

#### Android
```bash
flutter run -d android
```

#### iOS (Mac only)
```bash
cd ios
pod install
cd ..
flutter run -d ios
```

#### Web
```bash
flutter run -d chrome
```

#### Desktop (Windows/Linux/macOS)
```bash
# Windows
flutter run -d windows

# Linux
flutter run -d linux

# macOS
flutter run -d macos
```

## 📦 Build

### Android APK
```bash
flutter build apk --release
```

### iOS (Mac only)
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

## 📁 Project Structure

### Key Components

**State Management (Cubits)**
- `FeaturedBooksCubit`: Manages featured books state
- `NewestBooksCubit`: Manages newest books state
- `SimilarBooksCubit`: Manages similar books recommendations

**Repositories**
- `HomeRepo`: Abstract repository interface
- `HomeRepoImpl`: Concrete implementation using Google Books API

**Models**
- `BookModel`: Main book data model
- `VolumeInfo`: Book metadata (title, authors, description, etc.)
- `ImageLinks`: Book cover images
- `SaleInfo`: Pricing information

**Services**
- `ApiService`: Centralized Dio HTTP client configuration
- Service Locator: Dependency injection setup

## 🎨 UI/UX Features

- **Dark Theme**: Beautiful dark mode with custom color scheme
- **Custom Fonts**: Agu Display for branding, Montserrat for content
- **Responsive Design**: Adapts to different screen sizes
- **Smooth Animations**: Shimmer loading effects
- **Optimized Images**: Cached network images for better performance

## 🌐 API Response Handling

The app uses **functional programming** with Dartz's `Either` type for robust error handling:

```dart
Either<Failure, List<BookModel>> result = await homeRepo.fetchBooks();

result.fold(
  (failure) => // Handle error,
  (books) => // Handle success
);
```

## 🔧 Configuration

### Custom Fonts
Located in `assets/fonts/`:
- Agu Display (Variable Font)

### Images
Located in `assets/images/`:
- App logo
- Placeholder images

## 📄 License

This project is a Flutter learning project. Feel free to use it for educational purposes.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the issues page.

## 👨‍💻 Author

**Aya Hamoudeh**
- GitHub: [@aya-hamoudeh1](https://github.com/aya-hamoudeh1)

## 📚 Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Google Books API](https://developers.google.com/books)
- [BLoC Library](https://bloclibrary.dev/)
- [Clean Architecture by Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

---

**Note**: This app uses the free Google Books API and only displays books marked as free e-books. No API key is required for basic usage.
