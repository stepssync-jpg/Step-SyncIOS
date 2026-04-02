# Git & GitHub Setup Plan

## Current Status
❌ Git NOT initialized in project folder
❌ No GitHub repository connected
❌ No Codemagic connection yet

---

## Step-by-Step Plan

### STEP 1: Initialize Git Locally (Windows PC)
Run these commands in PowerShell:

```powershell
cd E:\testing\flutter_codemagic

# Initialize git repo
git init

# Configure git (use your real name and email)
git config user.name "Your Name"
git config user.email "your.email@example.com"

# Verify config
git config --list
```

**What it does**: Creates `.git` folder, sets up Git locally

---

### STEP 2: Add Files to Git
```powershell
# Stage all files
git add .

# Check what's staged
git status

# Make initial commit
git commit -m "Initial commit: Flutter iOS app with Codemagic setup"
```

**What it does**: Adds all files to Git history

---

### STEP 3: Create GitHub Repository
1. Go to https://github.com/new
2. Repository name: `flutter-codemagic-app` (or your choice)
3. Description: "Flutter app with iOS builds via Codemagic"
4. Choose **Public** (easier) or **Private**
5. **DO NOT** initialize with README (you already have one)
6. Click "Create repository"

**Result**: You get a GitHub URL like:
```
https://github.com/YOUR_USERNAME/flutter-codemagic-app.git
```

---

### STEP 4: Connect Local Repo to GitHub
```powershell
# Add GitHub as remote
git remote add origin https://github.com/YOUR_USERNAME/flutter-codemagic-app.git

# Verify remote
git remote -v

# Push to GitHub (main branch)
git branch -M main
git push -u origin main
```

**What it does**: Connects your local Git to GitHub, uploads all your code

---

### STEP 5: Verify on GitHub
- Go to your GitHub repo URL
- You should see all your files (README.md, lib/main.dart, pubspec.yaml, etc.)
- It's live! ✅

---

### STEP 6: Connect Codemagic
1. Go to https://codemagic.io
2. Sign in with GitHub (authorize it)
3. Click "Add application"
4. Select: `flutter-codemagic-app` (your repo)
5. Codemagic auto-detects `codemagic.yaml` ✅
6. Configure iOS signing (follow guide in Codemagic)
7. Save & trigger build (or just push new code)

---

## Quick Reference

| Step | Command | Status |
|------|---------|--------|
| 1. Init Git | `git init` | ⬜ TODO |
| 2. Config Git | `git config user.name "..."` | ⬜ TODO |
| 3. Stage Files | `git add .` | ⬜ TODO |
| 4. First Commit | `git commit -m "..."` | ⬜ TODO |
| 5. Create GitHub Repo | Browser | ⬜ TODO |
| 6. Add Remote | `git remote add origin ...` | ⬜ TODO |
| 7. Push to GitHub | `git push -u origin main` | ⬜ TODO |
| 8. Connect Codemagic | Browser | ⬜ TODO |

---

## Replace These Values

When running commands, replace:
- `Your Name` → Your actual name
- `your.email@example.com` → Your Gmail/email
- `YOUR_USERNAME` → Your GitHub username
- `flutter-codemagic-app` → Your chosen repo name

---

## Flow Diagram

```
Local Folder (E:\testing\flutter_codemagic)
         ↓ git init
    Local Git Repo
         ↓ git commit
    Code History Saved
         ↓ git push
    GitHub Repository (Online)
         ↓ Codemagic watches
    Automatic iOS Build
         ↓ Download .ipa
    Your iPhone 📱
```

---

## Do These In Order

1. ✅ STEP 1-4 (Git setup on Windows)
2. ✅ STEP 5 (Verify on GitHub)
3. ✅ STEP 6 (Connect Codemagic)
4. ✅ Then just write code & push!

Ready? Start with STEP 1!
