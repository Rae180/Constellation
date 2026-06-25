# 18 - Setup Guide

# Constellation Setup Guide

## Purpose

This document explains how to set up the Constellation development environment from scratch.

Following this guide should allow any developer to clone the repository, install dependencies, and run the application successfully.

---

# Supported Platforms

Development is officially supported on:

* Windows
* Linux
* macOS

Target platforms:

* Android
* Windows
* Linux
* macOS
* Web

iOS development requires macOS.

---

# Prerequisites

Before starting, install the following tools.

---

# Flutter SDK

Required Version:

```text
Flutter Stable Channel
```

Verify installation:

```bash
flutter doctor
```

Expected result:

```text
No issues found
```

Any reported issues should be resolved before continuing.

---

# Git

Verify installation:

```bash
git --version
```

Example:

```text
git version 2.x.x
```

Git is required for source control and repository management.

---

# IDE

Recommended:

* Visual Studio Code

Optional:

* Android Studio
* IntelliJ IDEA

Recommended VS Code Extensions:

```text
Flutter

Dart

Error Lens

GitLens

Flutter Widget Snippets
```

---

# Clone Repository

Clone the project:

```bash
git clone <repository-url>
```

Navigate to the project:

```bash
cd Constellation
```

---

# Verify Project Structure

Expected structure:

```text
Constellation/
│
├── assets/
├── decisions/
├── docs/
├── lib/
├── scripts/
├── test/
│
├── pubspec.yaml
├── README.md
└── analysis_options.yaml
```

If the structure differs significantly, verify repository integrity.

---

# Install Dependencies

Fetch Flutter dependencies:

```bash
flutter pub get
```

Expected result:

```text
Resolving dependencies...
Downloading packages...
Got dependencies.
```

---

# Generate Code

Run code generation:

```bash
dart run build_runner build
```

Future generated files may include:

* Freezed models
* JSON serializers
* Database adapters

Warnings should be reviewed before continuing.

---

# Static Analysis

Run:

```bash
flutter analyze
```

Expected result:

```text
No issues found
```

Warnings should be addressed whenever practical.

---

# Execute Tests

Run all tests:

```bash
flutter test
```

Expected result:

```text
All tests passed.
```

No failing tests should exist on the main branch.

---

# Run Application

Start the application:

```bash
flutter run
```

Supported devices:

```bash
flutter devices
```

Example:

```text
Chrome

Windows

Android Device
```

Select a target device and launch.

---

# Build Commands

Android APK:

```bash
flutter build apk
```

Android App Bundle:

```bash
flutter build appbundle
```

Windows:

```bash
flutter build windows
```

Linux:

```bash
flutter build linux
```

Web:

```bash
flutter build web
```

Release builds should be tested before distribution.

---

# Project Configuration

Current Version:

```text
Version 1
```

Architecture:

```text
Clean Architecture
```

State Management:

```text
Riverpod
```

Routing:

```text
GoRouter
```

Dependency Injection:

```text
GetIt
```

Serialization:

```text
Freezed + JSON Serializable
```

Storage:

```text
To Be Determined (ADR Required)
```

All architectural decisions should reference ADRs.

---

# Development Workflow

Recommended workflow:

```text
Pull Latest Changes

↓

Create Branch

↓

Implement Feature

↓

Run Analysis

↓

Run Tests

↓

Commit

↓

Push

↓

Create Pull Request
```

Refer to:

```text
13_Git_Workflow.md
```

for detailed Git procedures.

---

# Updating Dependencies

Check outdated packages:

```bash
flutter pub outdated
```

Upgrade packages:

```bash
flutter pub upgrade
```

Major upgrades should be evaluated through ADRs when they affect architecture.

---

# Troubleshooting

## Flutter Doctor Issues

Run:

```bash
flutter doctor
```

Resolve all critical warnings.

---

## Dependency Conflicts

Clean project:

```bash
flutter clean
```

Fetch packages again:

```bash
flutter pub get
```

---

## Build Runner Issues

Remove generated files:

```bash
dart run build_runner clean
```

Regenerate:

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Android Build Failures

Verify:

```text
Android SDK

Java Version

Android Licenses
```

Accept licenses:

```bash
flutter doctor --android-licenses
```

---

## Cache Problems

Clear Flutter cache:

```bash
flutter clean
```

Then:

```bash
flutter pub get
```

---

# Development Standards

Before committing:

✓ Project builds successfully.

✓ Static analysis passes.

✓ Tests pass.

✓ Documentation updated.

✓ Architecture respected.

✓ No secrets committed.

✓ Code follows project conventions.

---

# First Day Checklist

A new developer should be able to:

✓ Clone repository.

✓ Install dependencies.

✓ Generate code.

✓ Run analysis.

✓ Run tests.

✓ Launch application.

✓ Understand project structure.

✓ Read architecture documents.

Completing this checklist indicates a successful environment setup.

---

# Success Criteria

The setup process succeeds when a developer can move from a fresh machine to a running Constellation application in less than thirty minutes without requiring assistance from another contributor.

A reproducible setup process is essential for long-term maintainability and future team growth.
