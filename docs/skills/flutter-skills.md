# Flutter Advanced Skills

This document contains "Pro Tips" for building highly performant and accessible Flutter apps.

## 1. Efficient Rebuilds
- Use `const` constructors everywhere.
- Use `select()` on providers to listen to granular state changes.
- Extract changing parts of a widget tree into separate widgets.

## 2. Platform Adaptation
- Use `LayoutBuilder` for responsive designs.
- Use `.sdp` for pixel-perfect scaling across device densities (RULE-002).
- Use `Platform.isIOS` etc. only when absolutely necessary for native-only features.

## 3. Accessibility (A11y)
- Wrap interactive elements in `Semantics`.
- Ensure a minimum tap target of 44x44.
- Use `ExcludeSemantics` for decorative icons.

## 4. Performance
- Avoid `Opacity` widget; use `Colors.withOpacity` or `Visibility` instead.
- Use `ListView.builder` for long lists.
- Pre-cache heavy images using `precacheImage`.

---
*Reference: [Agent Workflow](file:///docs/agent/overview.md)*

