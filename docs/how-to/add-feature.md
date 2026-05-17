# How-to: Add a New Feature

Follow this checklist for every new feature.

## Step 1: Folder Structure
Create the standard FEDA folders:
```bash
lib/features/[feature_name]/
  ├── data/
  ├── domain/
  ├── presentation/
  └── [feature_name].dart
```

## Step 2: Data Models
Create `[feature_name]_request.dart` and `[feature_name]_model.dart` in `data/models/`.

## Step 3: Domain Entity
Create `[feature_name]_entity.dart` in `domain/entities/`.
Add a `toEntity()` extension on your `Model`.

## Step 4: Logic Wiring
1. Define `[Feature]Repository` interface in `domain/repositories/`.
2. Define `Get[Feature]UseCase` in `domain/use_cases/`.
3. Implement `[Feature]RemoteDataSource` in `data/data_sources/`.
4. Implement `[Feature]RepositoryImpl` in `data/repositories/`.

## Step 5: State & UI
1. Create `[Feature]Notifier` in `presentation/notifiers/`.
2. Create `[Feature]Screen` and sub-widgets in `presentation/widgets/`.

## Step 6: Barrel File
Export ONLY the Domain Entity, UseCase provider, Repository provider, and the main Widget.
```dart
// lib/features/my_feature/my_feature.dart
export 'domain/entities/my_entity.dart';
export 'domain/use_cases/get_my_use_case.dart';
export 'presentation/widgets/my_screen.dart';
```

## Step 7: Registry
Update `docs/features/registry.md`.

