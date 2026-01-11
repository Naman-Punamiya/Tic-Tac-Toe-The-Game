# ❌⭕ Tic-Tac-Toe – The Game

A fun and simple **Tic-Tac-Toe** game built using **Flutter**, allowing two players to play the classic X vs O game with a clean and interactive UI. The app works across **Android, iOS, Web, and Desktop**.

---

## 🎮 Features

✔️ Classic 2-player Tic-Tac-Toe gameplay  
✔️ Clean and simple UI  
✔️ Real-time win and draw detection  
✔️ Restart game option  
✔️ Cross-platform support (Android, iOS, Web, Desktop)

---

## 📁 Project Structure

```text
├── android/        # Android platform code
├── ios/            # iOS platform code
├── web/            # Web platform code
├── lib/            # Flutter Dart source code
├── test/           # Tests
├── pubspec.yaml    # Dependencies
├── .gitignore
├── README.md       # Project documentation
```

## 🚀 Getting Started
🔧 Prerequisites
  Flutter SDK installed
  VS Code or Android Studio
Check Flutter setup:

```flutter doctor```

## 🛠️ Clone & Install
```bash
git clone https://github.com/Naman-Punamiya/Tic-Tac-Toe-The-Game.git
cd Tic-Tac-Toe-The-Game
flutter pub get
```

▶️ Run the App
Android / iOS
```
flutter run
```
Web
```
flutter run -d chrome
```
Desktop
```
flutter config --enable-windows-desktop
flutter config --enable-macos-desktop
flutter config --enable-linux-desktop
flutter run -d windows   # or macos / linux
```

🧠 Game Logic
- Two players take turns placing X and O
- The game checks:
  - Row match
  - Column match
  - Diagonal match
- Displays:
  - Winner message
  - Draw message
- Reset button clears the board

🛠️ Future Improvements
- Single-player mode with AI
- Scoreboard
- Sound effects
- Animations
- Online multiplayer

🤝 Contribution
1. Star the repo
2. Fork it
3. Create a new branch
4. Commit changes
5. Push and open a Pull Request

📄 License
MIT License

👤 Author
Naman Punamiya

Enjoy playing Tic-Tac-Toe! ❌⭕
