# StepSync iOS

**Track your daily steps. Achieve your fitness goals. Built with Flutter & Codemagic.**

## 📱 Features

- ✅ **Daily Step Counter** - Real-time step tracking
- ✅ **Dashboard** - View stats, goals, history
- ✅ **Settings** - Customize daily goals
- ✅ **Profile** - Track achievements
- ✅ **iOS Native UI** - Cupertino design
- ✅ **Auto Builds** - Codemagic CI/CD
- ✅ **Free iOS Builds** - No Mac needed

## 🚀 Quick Start

### Clone & Setup
```bash
git clone https://github.com/stepssync-jpg/StepSyncIOS.git
cd StepSyncIOS
flutter pub get
```

### Run on Windows
```bash
flutter run -d windows
```

### Push to GitHub (Auto-triggers iOS build)
```bash
git add .
git commit -m "Your feature"
git push origin main
```

## 📋 Project Structure
```
lib/
├── main.dart           # App entry point
├── screens/            # UI screens
│   ├── home_screen.dart
│   ├── settings_screen.dart
│   └── profile_screen.dart
├── models/             # Data models
│   ├── step_data.dart
│   └── user_stats.dart
└── services/           # Business logic
    └── step_counter.dart
pubspec.yaml           # Dependencies
codemagic.yaml         # iOS build config
```

## 🔧 Build & Deploy

1. **Local Test** - `flutter run -d windows`
2. **Push to GitHub** - Codemagic triggers automatically
3. **iOS Build** - Codemagic generates .ipa (10-20 min)
4. **Download** - Get .ipa from Codemagic dashboard
5. **Install on iPhone** - Use Apple Configurator or TestFlight

## 📚 Documentation
- [Setup Guide](SETUP.md) - Complete setup instructions
- [Git Commands](TERMINAL_COMMANDS.md) - Terminal commands
- [Development Plan](PLAN_iOS.md) - Development roadmap
- [Codemagic Config](codemagic.yaml) - CI/CD pipeline

## 🎯 Tech Stack
- **Framework**: Flutter
- **Language**: Dart
- **UI**: Cupertino (iOS native)
- **CI/CD**: Codemagic
- **VCS**: GitHub
- **Platform**: iOS (iPhone/iPad)

## 📈 Roadmap
- [ ] Apple HealthKit integration
- [ ] Push notifications
- [ ] Cloud sync (Firebase)
- [ ] Weekly/Monthly reports
- [ ] Leaderboards
- [ ] Social sharing

## 🤝 Contributing
Fork → Create branch → Commit → Push → Pull Request

## 📄 License
MIT License - See LICENSE file

## 👤 Author
**stepssync-jpg**
- GitHub: [@stepssync-jpg](https://github.com/stepssync-jpg)

---

**Download StepSync on your iPhone today!** 📥
