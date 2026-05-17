# How-to: Add a Domain Event

Events allow features to communicate while remaining decoupled.

## Step 1: Update Catalog
Add your event to the **Global Event Catalog** in `docs/arch/event-driven.md`.

## Step 2: Define the Variant
Add the variant to `core/events/domain_event.dart`.

```dart
@freezed
sealed class DomainEvent with _$DomainEvent {
  // ...
  const factory DomainEvent.paymentCompleted({
    required String transactionId,
  }) = PaymentCompleted;
}
```

## Step 3: Emit the Event
Emit from a Notifier or a Repository.

```dart
_eventBus.emit(DomainEvent.paymentCompleted(transactionId: 'tx_123'));
```

## Step 4: Listen to the Event
In another feature's Notifier:

```dart
@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  CartState build() {
    // Listen for payment completion to clear the cart
    ref.listen(eventBusProvider.select((bus) => bus.on<PaymentCompleted>()), (prev, stream) {
      stream.listen((event) => clearCart());
    });
    return const CartState();
  }
}
```

