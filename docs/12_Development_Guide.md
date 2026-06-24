# 12 - Development Guide

# Constellation Development Guide

## Purpose

This document defines the engineering standards and development practices for Constellation.

Its purpose is to ensure that every contribution follows consistent architectural, coding, documentation, and testing principles.

Consistency is more valuable than individual coding preferences.

Every line of code should make the project easier to maintain.

---

# Development Philosophy

Code is read far more often than it is written.

The primary objective is not writing code quickly.

The primary objective is writing code that remains understandable months and years later.

Readable code scales.

Confusing code accumulates technical debt.

---

# Core Principles

1. Simplicity over cleverness.

2. Consistency over personal preference.

3. Readability over brevity.

4. Explicit behavior over hidden behavior.

5. Composition over inheritance.

6. Interfaces over implementations.

7. Small components over large classes.

8. Architecture before optimization.

9. Testability by design.

10. Document important decisions.

---

# Code Style

Every source file should:

Have a clear purpose.

Contain one primary responsibility.

Use descriptive names.

Remain easy to navigate.

Avoid unnecessary complexity.

---

# Class Guidelines

Classes should:

Represent one concept.

Remain reasonably small.

Expose minimal public APIs.

Hide implementation details.

Depend on abstractions whenever possible.

Large classes should be divided before they become difficult to understand.

---

# Function Guidelines

Functions should:

Perform one task.

Have descriptive names.

Remain short whenever practical.

Avoid deeply nested logic.

Return predictable results.

Prefer early returns over deeply nested conditionals.

---

# Naming Conventions

Variables

camelCase

Classes

PascalCase

Enums

PascalCase

Methods

camelCase

Files

snake_case

Folders

snake_case

Constants

camelCase unless globally shared.

Names should describe intent rather than implementation.

---

# Comments

Comments should explain **why**, not **what**.

Avoid:

```dart
// Increment index
index++;
```

Prefer:

```dart
// Skip the current message because it has already been processed.
index++;
```

Good code should explain itself whenever possible.

---

# Documentation

Public classes should include documentation.

Complex algorithms should explain:

Purpose

Inputs

Outputs

Assumptions

Limitations

Architecture decisions belong in the `docs/` and `decisions/` directories rather than inline comments.

---

# Error Handling

Never silently ignore errors.

Every error should be:

Handled

Logged appropriately

Recoverable whenever possible

Errors should provide useful information without exposing sensitive implementation details.

---

# Logging

Log useful events.

Avoid noisy logging.

Never log:

Passwords

API Keys

Tokens

Sensitive user data

Logs should assist debugging without compromising privacy.

---

# Testing

Testing is part of development, not a separate phase.

Recommended priorities:

Unit Tests

↓

Integration Tests

↓

Widget Tests

↓

Manual Testing

Every important subsystem should have automated tests.

---

# Code Reviews

Every change should be evaluated for:

Correctness

Readability

Architecture

Security

Performance

Testing

Documentation

Reviews should improve code rather than criticize developers.

---

# Refactoring

Refactoring is encouraged.

Reasons include:

Improved readability

Reduced duplication

Simplified architecture

Better testing

Reduced complexity

Refactoring should preserve existing behavior.

---

# Dependency Management

Before adding a dependency, ask:

Can this be implemented internally?

Is the package actively maintained?

Does it improve the architecture?

Does it increase security risks?

Every dependency should provide clear long-term value.

---

# State Management

Riverpod is the standard state management solution.

Avoid introducing additional state management libraries.

Consistency is preferred over multiple approaches.

---

# Architecture Rules

Business logic belongs inside the Core.

UI belongs inside features.

Infrastructure implements interfaces.

Features communicate through the Core.

Platform-specific code remains isolated.

Do not bypass architectural boundaries for convenience.

---

# Performance Guidelines

Avoid:

Unnecessary rebuilds

Repeated calculations

Duplicate queries

Blocking the UI thread

Optimize only after measuring.

Correct architecture is usually the greatest optimization.

---

# Security Guidelines

Validate external input.

Protect sensitive data.

Use secure storage.

Verify downloads.

Never hardcode secrets.

Security should be considered during implementation rather than after completion.

---

# Git Practices

Every commit should:

Compile successfully.

Pass tests.

Remain focused on one purpose.

Avoid unrelated changes.

Small commits are preferred over large commits.

---

# Pull Requests

Each pull request should:

Describe the change.

Explain the motivation.

Reference related issues.

Include testing information.

Remain reasonably small.

Large pull requests are difficult to review.

---

# Continuous Improvement

Engineers are encouraged to improve:

Documentation

Architecture

Tests

Naming

Performance

Security

Leaving the codebase slightly better than before is a shared responsibility.

---

# Definition of Done

A task is considered complete only when:

✓ Code compiles.

✓ Tests pass.

✓ Documentation is updated.

✓ Architecture remains consistent.

✓ Errors are handled.

✓ Logging is appropriate.

✓ Performance is acceptable.

✓ Security considerations are addressed.

✓ Code has been reviewed.

Completing functionality alone is not sufficient.

---

# Engineering Mindset

Before implementing a solution, ask:

Is it simple?

Is it readable?

Is it testable?

Is it scalable?

Does it respect the architecture?

Will another engineer understand it six months from now?

If the answer to any question is no, reconsider the implementation.

---

# Development Principles Summary

1. Readability first.

2. Simplicity first.

3. Respect architecture.

4. Test continuously.

5. Document decisions.

6. Improve incrementally.

7. Avoid unnecessary dependencies.

8. Write maintainable code.

9. Never sacrifice quality for speed.

10. Build software that future engineers will appreciate.

---

# Success Criteria

The Development Guide succeeds when every contributor writes code that feels as though it was created by the same engineering team.

Consistency, clarity, and maintainability should become visible throughout the entire Constellation codebase regardless of who wrote the implementation.
