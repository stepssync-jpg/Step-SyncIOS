# GitHub Actions Auto iOS Build Plan

## Overview
**Goal**: Every time you push to GitHub → Automatic iOS .ipa build

**No Codemagic needed!** Uses **GitHub Actions** (free, built-in)

---

## Complete Step-by-Step Plan

### STEP 1: Create GitHub Actions Workflow File
Location: `.github/workflows/ios-build.yml`

This file tells GitHub to automatically build iOS when you push code.

### STEP 2: Push Workflow to GitHub
```powershell
cd E:\testing\flutter_codemagic
git add .github/
git commit -m "Add GitHub Actions iOS build workflow"
git push origin main
```

### STEP 3: GitHub Actions Automatically Builds
- ✅ Detects new push
- ✅ Builds iOS .ipa file
- ✅ Stores as artifact (downloadable)
- ✅ Sends you email when done

### STEP 4: Download .ipa from GitHub
1. Go to: https://github.com/stepssync-jpg/Step-SyncIOS/actions
2. Click latest workflow run
3. Scroll to "Artifacts"
4. Download `ios-build.ipa`

### STEP 5: Install on iPhone
Download the .ipa and install using:
- **Xcode** (if you have Mac)
- **Apple Configurator 2** (Windows/Mac)
- **TestFlight** (easiest)

---

## Files Needed

### 1. `.github/workflows/ios-build.yml`
Main workflow file - triggers on every push

### 2. `codemagic.yaml` 
Already have it (Codemagic config - GitHub Actions will use Flutter build commands instead)

### 3. `pubspec.yaml`
Already have it ✅

---

## Command Sequence

```powershell
# Step 1: Create workflow directory
mkdir -p .github/workflows

# Step 2: Add workflow file (I'll create this)

# Step 3: Commit and push
cd E:\testing\flutter_codemagic
git add .github/
git commit -m "Add iOS CI/CD with GitHub Actions"
git push origin main

# Step 4: Go to GitHub Actions
# https://github.com/stepssync-jpg/Step-SyncIOS/actions
```

---

## How It Works

```
You on Windows
   ↓
Edit code
   ↓
git push origin main
   ↓
GitHub Actions triggers
   ↓
Runs on GitHub's macOS server
   ↓
flutter build ipa --release
   ↓
Generates iOS .ipa file
   ↓
Stores as downloadable artifact
   ↓
Email notification: "Build Complete!"
   ↓
Download .ipa
   ↓
Install on iPhone
```

---

## What AI Needs to Create

1. **`.github/workflows/ios-build.yml`**
   - Triggers on: push to main branch
   - Runs on: macOS-latest
   - Steps:
     - Checkout code
     - Setup Flutter
     - Run `flutter pub get`
     - Run `flutter build ipa --release`
     - Upload artifact (the .ipa file)
     - Send email notification

2. **`.github/workflows/ios-build.yml` Content:**
   ```yaml
   name: Build iOS
   
   on:
     push:
       branches: [main]
   
   jobs:
     build:
       runs-on: macos-latest
       steps:
         - uses: actions/checkout@v3
         - uses: subosito/flutter-action@v2
           with:
             flutter-version: 'latest'
         - run: flutter pub get
         - run: flutter build ipa --release
         - uses: actions/upload-artifact@v3
           with:
             name: ios-build
             path: build/ios/ipa/*.ipa
   ```

---

## Next Steps in Order

1. ✅ Create `.github/workflows/ios-build.yml`
2. ✅ Run: `git add .github/; git commit -m "..."; git push origin main`
3. ✅ Wait for build (5-15 min)
4. ✅ Check: https://github.com/stepssync-jpg/Step-SyncIOS/actions
5. ✅ Download .ipa
6. ✅ Install on iPhone

---

## Expected Results

After push:
```
✅ Green checkmark on GitHub
✅ "Build successful" notification
✅ Download link for .ipa file
✅ Install on iPhone
```

---

## Troubleshooting

If build fails, check:
- GitHub Actions logs: `/actions` tab
- Flutter config: `pubspec.yaml` valid?
- iOS config: `ios/` folder complete?
- Signing: May need Apple certificate (advanced)

---

## Free Tier Limits

- ✅ **Public repo**: 3000 build minutes/month (FREE!)
- ✅ **macOS**: Included
- ✅ **Artifacts**: 500MB storage
- ✅ **Enough for 1-2 builds weekly**

---

## That's It!

Once workflow is created and pushed:

```
Every push → Auto iOS build → Download .ipa → Install on iPhone
```

**No manual setup needed after first commit!** 🚀

---

## To Execute:

Give AI these instructions:
1. Create file: `.github/workflows/ios-build.yml`
2. Add workflow content (see above)
3. Run git commands
4. Done!
