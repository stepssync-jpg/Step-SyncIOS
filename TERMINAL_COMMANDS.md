# Terminal Commands - Copy & Paste Ready

## STEP 1: Initialize Git & First Commit
Copy-paste all these commands at once into PowerShell:

```powershell
cd E:\testing\flutter_codemagic
git init
git config user.name "Your Name"
git config user.email "your@email.com"
git add .
git commit -m "Initial commit: Flutter iOS app with Codemagic"
git branch -M main
```

**Replace:**
- `Your Name` → your actual name
- `your@email.com` → your email

---

## STEP 2: Create GitHub Repo (Browser Only)
1. Go to https://github.com/new
2. Repo name: `flutter-codemagic-app`
3. Click "Create repository" (DO NOT add README)
4. Copy the URL given (looks like: `https://github.com/USERNAME/flutter-codemagic-app.git`)

---

## STEP 3: Push to GitHub
Replace `YOUR_GITHUB_URL` with the URL from Step 2, then copy-paste:

```powershell
git remote add origin YOUR_GITHUB_URL
git push -u origin main
```

**Example:**
```powershell
git remote add origin https://github.com/john123/flutter-codemagic-app.git
git push -u origin main
```

---

## STEP 4: Verify
Go to your GitHub repo in browser - you should see all files! ✅

---

## Summary - Just 3 PowerShell Runs:

### Run 1️⃣ (Copy-paste this):
```powershell
cd E:\testing\flutter_codemagic; git init; git config user.name "Your Name"; git config user.email "your@email.com"; git add .; git commit -m "Initial commit: Flutter iOS app with Codemagic"; git branch -M main
```

### Run 2️⃣ (After creating GitHub repo, copy-paste this):
```powershell
git remote add origin https://github.com/YOUR_USERNAME/flutter-codemagic-app.git; git push -u origin main
```

That's it! Code is now in GitHub repo! 🚀
