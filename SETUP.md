# Flutter + Codemagic Setup Guide

## Project Overview
This Flutter project is configured to use Codemagic for CI/CD to automatically build iOS .ipa files when you push to GitHub.

## Prerequisites
- Flutter SDK installed on Windows
- GitHub account
- Codemagic account (free tier supports iOS builds)
- Git installed on Windows

## Step 1: Local Development (Windows)

### 1.1 Initialize the Flutter project
```bash
flutter pub get
```

### 1.2 Test the app locally
```bash
flutter run
```

This validates that your Flutter setup works correctly.

## Step 2: GitHub Setup

### 2.1 Create a GitHub Repository

1. Go to https://github.com/new
2. Create a new repository (e.g., `flutter-codemagic-app`)
3. Choose "Public" or "Private" (private requires more setup in Codemagic)
4. Do NOT initialize with README yet

### 2.2 Initialize Git in Your Project

Navigate to the project folder and run:

```bash
cd e:\testing\flutter_codemagic
git init
git add .
git commit -m "Initial commit: Flutter app with Codemagic setup"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/flutter-codemagic-app.git
git push -u origin main
```

Replace `YOUR_USERNAME` and `flutter-codemagic-app` with your actual GitHub username and repository name.

## Step 3: Codemagic Setup

### 3.1 Create a Codemagic Account

1. Go to https://codemagic.io
2. Sign up (you can use your GitHub account)
3. Authorize Codemagic to access your GitHub repositories

### 3.2 Add Your Repository to Codemagic

1. Log into Codemagic Dashboard
2. Click "Add application"
3. Select your Flutter repository from GitHub
4. Codemagic will automatically detect `codemagic.yaml`

### 3.3 Configure iOS Signing (One-time Setup)

To build iOS apps, you need to provide signing certificates:

#### Option A: Free with Apple Developer (Recommended for Learning)
1. In Codemagic dashboard, go to your app settings
2. Navigate to "iOS signing"
3. Click "Automatic signing" (if your account is eligible for free builds)
4. Follow the guided setup

#### Option B: Manual Signing
1. Obtain your iOS certificate and provisioning profile from Apple Developer
2. In Codemagic under iOS signing, upload:
   - Distribution Certificate (.p12 file)
   - Provisioning Profile (.mobileprovision file)

### 3.4 Update codemagic.yaml with Your Config

Edit [codemagic.yaml](codemagic.yaml) and replace:
- `YOUR_PROVISIONING_PROFILE` with your provisioning profile specifier
- `your-email@example.com` with your email

## Step 4: How It Works

1. **Push to GitHub**: When you push code to the `main` branch, GitHub triggers Codemagic
2. **Codemagic Build**: 
   - Checks out your code
   - Runs `flutter pub get` to install dependencies
   - Builds the iOS .ipa file in release mode
   - Signs the app with your certificate
3. **Artifacts**: The .ipa file is stored as a build artifact you can download

## Step 5: Daily Development Workflow

### On Windows:
```bash
# Make changes to your Flutter code
git add .
git commit -m "Your meaningful commit message"
git push origin main
```

That's it! Codemagic will automatically:
- ✅ Detect your push
- ✅ Build the iOS .ipa
- ✅ Email you when done

### Download Your Build
1. Go to Codemagic Dashboard
2. Find your latest build
3. Click "Artifacts" to download the .ipa
4. Use Xcode or Apple Configurator 2 to install on a device

## Step 6: Continuous Development

### Recommended Branching Strategy:
```bash
# Development branches
git checkout -b feature/my-feature
# ... make changes ...
git push origin feature/my-feature

# Create pull request on GitHub
# After review, merge to main
# Codemagic automatically builds when merged
```

## Troubleshooting

### Build Fails with "Pod install" error
- Solution: Commit `ios/Podfile.lock` to Git
  ```bash
  git add ios/Podfile.lock
  git commit -m "Add Podfile.lock"
  git push
  ```

### "No provisioning profile found"
- Check your Apple Developer account has valid profiles
- Regenerate certificate and provision profile
- Re-upload to Codemagic

### Need to Run Commands Locally
```bash
# Build IPA locally (requires macOS)
flutter build ipa --release

# On Windows, you can only build APKs or web
flutter build apk --release
flutter build web
```

## Next Steps

1. ✅ Code your Flutter app
2. ✅ Push to GitHub
3. ✅ Codemagic builds automatically
4. ✅ Download from Codemagic dashboard
5. ✅ Test on iOS devices or TestFlight

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Codemagic Documentation](https://docs.codemagic.io/flutter-builds/building-an-ios-app/)
- [GitHub Workflow Guide](https://docs.github.com/en/get-started)

## Cost
- **Windows Development**: Free (Flutter SDK)
- **iOS Builds on Codemagic**: Free tier available (check limits)
- **GitHub Repository**: Free (public repo)

---
Created for Flutter + Codemagic iOS CI/CD Pipeline
