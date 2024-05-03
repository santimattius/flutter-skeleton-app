# Flutter skeleton app

Flutter app using Domain Driven Design (DDD).

The following describes the architecture of the app, the structure of the project and the dependencies used.

<p align="center">
  <img src="https://github.com/santimattius/flutter-skeleton-app/blob/feature_login/doc/skeleton_login.png" width="300"/>
  <img src="https://github.com/santimattius/flutter-skeleton-app/blob/feature_login/doc/skeleton_home.png" width="300"/>
</p>

## Setup Firebase using Firebase CLI

[Check this documentation](https://firebase.flutter.dev/docs/cli/)

# Architecture 
## Bounded context
<p align="left">
  <img width="700" src="https://github.com/santimattius/flutter-skeleton-app/blob/feature_login/doc/architecture_structure.png?raw=true" alt="Project packages"/>
</p>

## Flow
<p align="left">
  <img width="600" src="https://github.com/santimattius/flutter-skeleton-app/blob/feature_login/doc/architecture_layers.png?raw=true" alt="Project packages"/>
</p>

## Packages
```yaml
dependencies:
  flutter:
    sdk: flutter
  dartz: ^0.10.0
  flutter_bloc: ^8.0.1
  # Firebase
  firebase_core: ^1.4.0
  firebase_auth: ^3.0.1
  google_sign_in: ^5.0.7
  get_it: ^7.2.0
  uuid: ^3.0.4
  equatable: ^2.0.0
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0

```
## Flutter documentation

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## References

- [Domain Driven Design](https://martinfowler.com/bliki/DomainDrivenDesign.html)
