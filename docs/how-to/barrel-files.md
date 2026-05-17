# How-to: Barrel Files (Feature Entry Points)

Barrel files are the "Public API" of a feature. They prevent "Spiderweb Imports" where every file in Feature A knows about every file in Feature B.

## 1. The Single Barrel Rule
There MUST be only one barrel file per feature, located at `lib/features/[feature]/[feature].dart`.

## 2. What to Export ✅
- **Domain Entities**: So other features can display your data.
- **UseCase Providers**: So other features can trigger your logic.
- **Feature Providers**: So other features can watch your state.
- **Main Widget (Screen)**: So the Router can navigate to you.

## 3. What NOT to Export ❌
- **Data Models**: Models are for serialization, not for UI consumption.
- **Data Sources**: These are infrastructure details.
- **Private Widgets**: Internal UI implementation details.
- **Repositories**: Other features should use UseCases, not raw Repositories.

## 4. Usage Example

```dart
// lib/features/auth/auth.dart
export 'domain/entities/auth_user.dart';
export 'domain/use_cases/login_use_case.dart';
export 'presentation/widgets/login_screen.dart';

// In another feature:
import 'package:app/features/auth/auth.dart'; // ✅ Clean
```

