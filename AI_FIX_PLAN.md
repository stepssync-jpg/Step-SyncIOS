# GitHub Actions iOS Build Fix Plan - For AI

## Problem Identification

**Error Found:**
```
Error: This request has been automatically failed because it uses a deprecated version of 'actions/upload-artifact' v3
```

**Root Cause:** The workflow file `.github/workflows/ios-build.yml` uses deprecated GitHub Actions version.

**Solution:** Update to `actions/upload-artifact@v4` (latest stable)

---

## What Needs to Be Done

### Task 1: Update Workflow File
**File:** `.github/workflows/ios-build.yml`

**Current Code (BROKEN):**
```yaml
- uses: actions/upload-artifact@v3
  with:
    name: ios-ipa
    path: build/ios/ipa/*.ipa
    retention-days: 30
```

**New Code (FIXED):**
```yaml
- uses: actions/upload-artifact@v4
  with:
    name: ios-ipa
    path: build/ios/ipa/*.ipa
    retention-days: 30
```

**Change:** `v3` → `v4`

---

## Step-by-Step Implementation

### Step 1: Replace the Deprecated Line
In file: `e:\testing\flutter_codemagic\.github\workflows\ios-build.yml`

Find this line:
```
- uses: actions/upload-artifact@v3
```

Replace with:
```
- uses: actions/upload-artifact@v4
```

### Step 2: Verify the Complete Workflow File
The file should look like this after update:

```yaml
name: Build iOS

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    name: Build iOS App
    runs-on: macos-latest

    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.19.0'
      
      - name: Get dependencies
        run: flutter pub get
      
      - name: Build iOS IPA
        run: |
          flutter build ipa \
            --release \
            --no-codesign
      
      - name: Upload iOS Build
        uses: actions/upload-artifact@v4
        with:
          name: ios-ipa
          path: build/ios/ipa/*.ipa
          retention-days: 30
      
      - name: Notify Build Complete
        run: echo "✅ iOS build completed! Download from Artifacts section"
```

**Key Changes:**
- Line with `upload-artifact@v3` → `upload-artifact@v4` (ONLY this line changes)
- Everything else stays the same

### Step 3: Commit and Push
```powershell
cd E:\testing\flutter_codemagic
git add .github/workflows/ios-build.yml
git commit -m "fix: Update GitHub Actions upload-artifact to v4"
git push origin main
```

### Step 4: Verify Fix
1. Go to: https://github.com/stepssync-jpg/Step-SyncIOS/actions
2. Look for new workflow run (should appear within 1-2 minutes)
3. Wait for build to complete (5-15 minutes)
4. Check for **GREEN checkmark** ✅

### Step 5: Download .ipa When Complete
If build is green ✅:
1. Click the workflow run
2. Scroll to "Artifacts"
3. Download `ios-ipa`
4. Unzip and get `app.ipa`

---

## Expected Results

**Before Fix:**
```
❌ Red X (failed)
Error: deprecated version of 'actions/upload-artifact' v3
```

**After Fix:**
```
✅ Green checkmark (success)
artifacts: ios-ipa available for download
```

---

## Files to Modify

Only ONE file needs changes:
- `e:\testing\flutter_codemagic\.github\workflows\ios-build.yml`

Change: `v3` → `v4` on the upload-artifact line

---

## Commands for AI to Execute

```powershell
# Step 1: Navigate to project
cd E:\testing\flutter_codemagic

# Step 2: Update workflow file
# (Replace v3 with v4 in .github/workflows/ios-build.yml)

# Step 3: Commit and push
git add .github/workflows/ios-build.yml
git commit -m "fix: Update GitHub Actions upload-artifact to v4"
git push origin main

# Step 4: Verify
# Check: https://github.com/stepssync-jpg/Step-SyncIOS/actions
```

---

## How to Know It's Fixed

✅ **Success Indicators:**
- GitHub Actions shows green checkmark ✅
- Artifacts section shows `ios-ipa` download
- No error messages in logs
- Build log shows: "Getting action download info" → SUCCESS

❌ **Failure Indicators:**
- Red X on workflow
- Error messages in logs
- No artifacts section

---

## Rollback (If Needed)

If the fix doesn't work:
```powershell
git revert HEAD
git push origin main
```

---

## Next Steps After Fix

1. Wait for successful build (5-15 min)
2. Download .ipa artifact
3. Install on iPhone using TestFlight or Apple Configurator 2
4. Done! 🎉

---

## Summary

**Problem:** Deprecated GitHub Actions version v3  
**Fix:** Update to v4  
**File:** `.github/workflows/ios-build.yml`  
**Time to Fix:** 5 minutes  
**Expected Outcome:** Green checkmark ✅ + .ipa download available
