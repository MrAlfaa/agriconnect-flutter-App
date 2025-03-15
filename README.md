# AgriConnect

![AgriConnect Logo](https://via.placeholder.com/150x50/4CAF50/FFFFFF?text=AgriConnect)

A Flutter application designed to connect farmers with suppliers, provide market insights, and offer agricultural tips.

## Features

- User registration and profile management
- Bank account integration
- Crop selection and management
- Real-time market prices
- Weather forecasts for farming regions
- Agricultural tips and best practices
- Supplier directory and connections

## Getting Started

### Prerequisites

- Flutter SDK (version 3.7.2 or higher)
- Dart SDK (compatible with Flutter version)
- Android Studio / VS Code with Flutter extensions
- Git

### Installation

1. **Clone the repository**

```bash
git clone https://github.com/yourusername/agriconnect.git
```

2. **Navigate to the project directory**

```bash
cd agriconnect
```

3. **Install dependencies**

```bash
flutter pub get
```

4. **Run the application**

For debug mode:
```bash
flutter run
```

For release mode:
```bash
flutter run --release
```

## Project Structure

```
agriconnect/
├── android/                    # Android-specific files
├── ios/                        # iOS-specific files
├── lib/                        # Dart source code
│   ├── main.dart               # Application entry point
│   ├── welcome_screen.dart     # User registration screen
│   ├── bank_details_screen.dart # Bank information screen
│   ├── select_fruits_screen.dart # Crop selection screen
│   ├── success_screen.dart     # Confirmation screen
│   ├── suppliers_screen.dart   # Main dashboard screen
│   └── glitter_webview_screen.dart # WebView integration
├── assets/                     # Application assets
│   └── web/                    # Web assets for dashboard
│       ├── glitter.html        # Dashboard HTML
│       └── glitter.js          # Dashboard JavaScript
└── pubspec.yaml                # Project configuration
```

## Building for Production

### Android

Build an APK:
```bash
flutter build apk
```

Build an App Bundle:
```bash
flutter build appbundle
```

### iOS

Build for iOS:
```bash
flutter build ios
```

## Dependencies

- `flutter_inappwebview`: For embedded web content
- `webview_flutter`: Alternative WebView implementation
- `cupertino_icons`: iOS-style icons

## Troubleshooting

### Common Issues

1. **WebView not loading**
   - Ensure internet permissions are enabled in AndroidManifest.xml
   - Verify assets are correctly defined in pubspec.yaml

2. **Form validation errors**
   - Check input formats (especially for IFSC codes and account numbers)

3. **Build failures**
   - Run `flutter clean` followed by `flutter pub get`
   - Update Flutter: `flutter upgrade`

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements

- Flutter team for the amazing framework
- All contributors who have helped shape this project

---

For support or questions, please open an issue on the GitHub repository.

##Examples of valid IFSC codes according to this pattern:

SBIN0123456
HDFC0BRANCH
ICIC0001234
PUNB0987654