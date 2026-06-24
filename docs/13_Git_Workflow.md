# 13 - Git Workflow

# Constellation Git Workflow

## Purpose

This document defines the Git workflow used throughout the Constellation project.

Its purpose is to ensure a consistent development process, maintain a clean commit history, simplify collaboration, and reduce merge conflicts.

Every commit should represent a meaningful step in the project's evolution.

---

# Workflow Philosophy

Constellation follows a lightweight Trunk-Based Development workflow.

The project values:

* Small commits
* Short-lived branches
* Frequent integration
* Clear history
* Easy code reviews

Git history should tell the story of the project.

---

# Primary Branch

The repository contains one long-lived branch.

```text
main
```

The `main` branch should always remain:

* Stable
* Buildable
* Deployable
* Tested

Broken code should never be merged into `main`.

---

# Feature Branches

All work begins from `main`.

Examples:

```text
feature/chat-screen

feature/memory-system

feature/pipeline-engine

feature/model-manager
```

Feature branches should remain focused on one objective.

---

# Bug Fix Branches

Bug fixes use dedicated branches.

Examples:

```text
fix/model-loading

fix/chat-scroll

fix/memory-search
```

Each fix should solve one problem.

---

# Refactoring Branches

Large refactoring efforts should remain isolated.

Examples:

```text
refactor/inference-engine

refactor/context-builder

refactor/database-layer
```

Refactoring branches should avoid introducing new functionality.

---

# Documentation Branches

Documentation improvements deserve their own branches.

Examples:

```text
docs/architecture

docs/setup-guide

docs/api
```

Documentation evolves alongside the codebase.

---

# Branch Naming

Use lowercase letters.

Separate words with hyphens.

Recommended prefixes:

```text
feature/

fix/

docs/

refactor/

test/

chore/

release/
```

Branch names should clearly describe their purpose.

---

# Commit Philosophy

Every commit should answer one question:

**What changed?**

Avoid combining unrelated work into a single commit.

Small, meaningful commits are preferred.

---

# Commit Message Format

Use concise, descriptive commit messages.

Recommended format:

```text
type: short description
```

Examples:

```text
feat: add memory ranking system

fix: prevent duplicate model loading

docs: update architecture guide

refactor: simplify pipeline execution

test: add coordinator unit tests

chore: update dependencies
```

The first line should summarize the change.

---

# Commit Types

Recommended commit types:

```text
feat

fix

docs

refactor

style

test

perf

build

ci

chore

revert
```

Using consistent prefixes improves readability and automation.

---

# Commit Frequency

Commit often.

Recommended moments:

* After completing a small feature.
* After passing tests.
* Before major refactoring.
* Before switching tasks.

Avoid extremely large commits.

---

# Pull Requests

Every pull request should include:

Purpose

Summary

Testing performed

Screenshots (if UI changes)

Related issue (if applicable)

Pull requests should remain focused.

Large pull requests are difficult to review.

---

# Review Checklist

Before merging:

✓ Builds successfully.

✓ Tests pass.

✓ Documentation updated.

✓ Naming is consistent.

✓ Architecture respected.

✓ Security considered.

✓ Performance acceptable.

✓ No unnecessary dependencies.

Only after passing the checklist should changes reach `main`.

---

# Merge Strategy

Prefer:

**Squash and Merge**

Benefits:

* Cleaner history.
* One commit per feature.
* Easier rollbacks.
* Simpler project timeline.

The `main` branch should remain readable.

---

# Conflict Resolution

Resolve conflicts inside feature branches before merging.

Never leave conflict markers inside committed code.

After resolving conflicts:

* Build the project.
* Run tests.
* Verify functionality.

---

# Releases

Version tags follow Semantic Versioning.

Examples:

```text
v1.0.0

v1.1.0

v1.2.3

v2.0.0
```

Guidelines:

Major

Breaking changes.

Minor

New functionality.

Patch

Bug fixes.

---

# Git Tags

Every public release should receive a Git tag.

Example:

```text
git tag v1.0.0
```

Tags create stable project milestones.

---

# Git Ignore

Never commit:

Build outputs

Temporary files

Secrets

API Keys

Downloaded models

IDE-specific files

Large generated assets

The repository should remain clean.

---

# Large Files

AI models should never be committed.

Instead:

Store download metadata.

Download models at runtime.

Document supported models.

Repository size should remain manageable.

---

# Backup Strategy

Remote repositories should serve as project backups.

Important milestones should also be tagged.

Future versions may include automated release generation.

---

# Continuous Integration

Future CI pipelines should automatically:

Build the application.

Run static analysis.

Execute tests.

Check formatting.

Generate documentation.

Reject failing pull requests.

Automation should reduce manual verification.

---

# Development Cycle

Recommended workflow:

```text
main

↓

Create feature branch

↓

Implement feature

↓

Run tests

↓

Update documentation

↓

Create pull request

↓

Review

↓

Squash merge

↓

Delete branch
```

The cycle should remain short and repeatable.

---

# Git Principles

1. Keep `main` stable.

2. Create one branch per task.

3. Commit early and often.

4. Write meaningful commit messages.

5. Keep pull requests small.

6. Test before merging.

7. Update documentation with code changes.

8. Tag releases.

9. Never commit secrets or models.

10. Let Git history tell the story of the project.

---

# Success Criteria

The Git workflow succeeds when the repository remains clean, understandable, and easy to navigate throughout the lifetime of Constellation.

A new contributor should be able to understand the project's evolution by reading the Git history alone.

The development process should encourage quality, consistency, and confidence while remaining lightweight enough for both solo development and future team collaboration.
