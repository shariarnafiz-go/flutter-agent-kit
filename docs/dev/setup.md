# Development Setup

## Environment
- **Flutter**: 3.41.7
- **Dart**: 3.11.5
- **IDE**: VS Code or Android Studio with Flutter & Dart plugins.

## Project Initialization
1. Ensure `project.md` is correctly filled.
2. Run `./setup.ps1` in the `flutter-agent-kit` folder.
3. Verify that `GEMINI.md` exists in the project root.

## Dependencies
Run `flutter pub get` after setup. 
The kit relies on:
- `hooks_riverpod`
- `riverpod_annotation`
- `freezed_annotation`
- `json_annotation`
- `sdp` (for scaling)

## Build Runner
Generating code is mandatory for Freezed and Riverpod.
```bash
dart run build_runner build --delete-conflicting-outputs
```
Or for continuous watches:
```bash
dart run build_runner watch --delete-conflicting-outputs
```

