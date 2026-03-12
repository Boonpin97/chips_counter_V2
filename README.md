# chip_counter

A Flutter app for tallying poker chip values and settling debts after a game.

## Setup for new contributors

### 1. Install dependencies
```
flutter pub get
```

### 2. Configure Firebase (required for web)

The Firebase config is gitignored and must be created manually.

1. Go to the [Firebase Console](https://console.firebase.google.com/) → your project → Project Settings → Your apps → SDK setup and configuration
2. Copy the code snippet provided (the content between `<script type="module">` and `</script>`)
3. Create the file `web/firebase-config.js`
4. Paste the copied content into that file — **do not include the `<script>` or `</script>` lines**, just the JavaScript inside them

The file should look like this:
```js
import { initializeApp } from "https://www.gstatic.com/firebasejs/12.10.0/firebase-app.js";
import { getAnalytics } from "https://www.gstatic.com/firebasejs/12.10.0/firebase-analytics.js";

const firebaseConfig = {
  apiKey: "...",
  authDomain: "...",
  projectId: "...",
  storageBucket: "...",
  messagingSenderId: "...",
  appId: "...",
  measurementId: "..."
};

const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
```

A reference template is available at `web/firebase-config.example.js`.

### 3. Build for web
```
flutter build web --release
```

---

## Migrating to a new Firebase project

Follow this guide if you're hosting the app under a different Firebase project (e.g. a new Google account).

### 1. Create a new Firebase project

1. Go to [console.firebase.google.com](https://console.firebase.google.com/) and create a new project.
2. In the project, enable **Hosting** and register a **Web app** to generate a Firebase config.

### 2. Run `firebase init` locally

From the project root, run:
```
firebase login
firebase init hosting
```

During `firebase init`, when prompted to set up a GitHub Action:
- Select **Yes** — the CLI will automatically create a service account in the new project and inject it as a secret into your GitHub repository (e.g. `FIREBASE_SERVICE_ACCOUNT_<NEW_PROJECT_ID>`).
- It will also regenerate `.github/workflows/firebase-hosting-merge.yml` with the correct `projectId` and service account secret name.

> You do **not** need to manually create or add the service account secret — the CLI handles this for you.

### 3. Update GitHub secrets

The 7 Firebase config secrets must be added manually in **GitHub → Settings → Secrets and variables → Actions**:

| Secret name | Where to find it |
|---|---|
| `FIREBASE_API_KEY` | Firebase Console → Project Settings → Your apps → SDK config |
| `FIREBASE_AUTH_DOMAIN` | same as above |
| `FIREBASE_PROJECT_ID` | same as above |
| `FIREBASE_STORAGE_BUCKET` | same as above |
| `FIREBASE_MESSAGING_SENDER_ID` | same as above |
| `FIREBASE_APP_ID` | same as above |
| `FIREBASE_MEASUREMENT_ID` | same as above |

### 4. Clean up old secrets (optional)

If migrating from a previous project, the old `FIREBASE_SERVICE_ACCOUNT_<OLD_PROJECT_ID>` secret will still exist in GitHub but is no longer used. Delete it from **GitHub → Settings → Secrets → Actions** to keep things clean.

### 5. Update your local `web/firebase-config.js`

Follow step 2 in the **Setup for new contributors** section above, using the new project's config values.

---

## Getting Started with Flutter

A few resources if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter documentation](https://docs.flutter.dev/)
