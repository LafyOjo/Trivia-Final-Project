# React Native Trivia App

This is a scaffold for a React Native trivia game powered by Firebase and the OpenTDB API. It focuses on authentication, Firestore setup, and a basic game loop. The project uses Expo for quick setup.

## Getting Started

1. Install dependencies

```bash
npm install
```

2. Set your Firebase credentials in `src/firebaseConfig.ts`.

3. Run the development server

```bash
npm start
```

The basic game pulls questions from OpenTDB and tracks the score locally. Authentication is handled via Firebase Auth. User profiles are created in Firestore on sign up.

This skeleton provides a foundation to expand with features like multiplayer, in-app purchases, ads, and leaderboards.
