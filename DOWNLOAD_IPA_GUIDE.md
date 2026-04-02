# How to Download .ipa File from GitHub

## Step-by-Step Guide

### Step 1: Go to GitHub Actions Page
Open this URL in browser:
```
https://github.com/stepssync-jpg/Step-SyncIOS/actions
```

### Step 2: Find Your Latest Build
You should see a list of workflow runs. Look for:
- **Green checkmark** ✅ = Build successful
- **Red X** ❌ = Build failed
- **Yellow dot** 🟡 = Still building

**Click on the green checkmark** for your latest build.

---

### Step 3: Wait for Build to Complete (If Still Running)

If it shows **🟡 Yellow dot**, it's still building. Wait and refresh the page:
- Press **F5** to refresh
- Check again in 2-3 minutes
- iOS builds take **5-15 minutes**

Once it's **✅ Green** → Continue to Step 4

---

### Step 4: Find the Artifacts Section

After clicking the build:

1. Scroll down the page
2. Look for section labeled **"Artifacts"**
3. You should see: **`ios-ipa`** (a folder/zip file)

---

### Step 5: Download the Artifact

Click on **`ios-ipa`** → It downloads as a **`.zip` file**

Example:
- Downloads to: `C:\Users\YourName\Downloads\ios-ipa.zip`

---

### Step 6: Unzip the File

1. Right-click the downloaded file
2. Select **"Extract All"** (or "7-Zip → Extract")
3. Choose where to extract (example: Desktop)
4. You get: `app.ipa` (this is your iOS app!)

---

## Visual Summary

```
1. Open: https://github.com/stepssync-jpg/Step-SyncIOS/actions
                              ↓
2. Click green checkmark ✅
                              ↓
3. Scroll down to "Artifacts"
                              ↓
4. Click "ios-ipa"
                              ↓
5. Download as ZIP
                              ↓
6. Right-click → Extract All
                              ↓
7. You have: app.ipa ✅
```

---

## Where is My .ipa File Now?

After unzipping:
- File name: `app.ipa`
- Location: Desktop or Downloads folder (wherever you extracted)
- Size: ~50-150 MB

---

## Next: Install on iPhone

Once you have the `.ipa` file, you can:

### Option A: TestFlight (Easiest)
- Don't need Mac or USB
- Upload to TestFlight
- Install from TestFlight app on iPhone

### Option B: Apple Configurator 2 (Needs USB)
- Download Apple Configurator 2
- Connect iPhone with USB
- Drag `.ipa` to install

### Option C: Xcode (If you have Mac)
- Open Xcode
- Connect iPhone
- Drag `.ipa` to install

---

## Quick Status Check

**Check build status NOW:**
👉 https://github.com/stepssync-jpg/Step-SyncIOS/actions

Tell me what you see:
- ✅ Green checkmark?
- 🟡 Still building?
- ❌ Red X (failed)?
