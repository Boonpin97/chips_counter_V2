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

## Getting Started with Flutter

A few resources if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter documentation](https://docs.flutter.dev/)
