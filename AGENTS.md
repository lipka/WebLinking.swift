# Repository Guidelines

## Project Structure & Module Organization
The Swift Package manifest (`Package.swift`) defines a single `WebLinking` library target and a matching `WebLinkingTests` suite. Runtime sources live in `Sources/WebLinking/WebLinking.swift`, which exposes the `Link` model and `HTTPURLResponse` helpers for RFC 5988 parsing. XCTest coverage sits in `Tests/WebLinking/WebLinkingTests.swift`; mirror new modules by creating matching folders under `Sources/` and `Tests/`.

## Build, Test, and Development Commands
Use `swift build` to compile the library against the platforms declared in the manifest. Run `swift test` before every push; it executes the XCTest suite and surfaces regressions. Resolve dependency updates with `swift package resolve`, then commit the updated `Package.resolved` if it appears. For Xcode-based debugging, open `Package.swift` in Xcode and select the `WebLinking` scheme.

## Coding Style & Naming Conventions
Follow the existing two-space indentation and place braces on the same line as declarations. Public APIs use UpperCamelCase types (`Link`) and lowerCamelCase methods/properties (`findLink`). Keep doc comments in `///` format describing observable behavior, and group helpers with `// MARK:` pragmas. Prefer pure Foundation types and avoid adding new dependencies without discussing the impact on supported Apple platforms.

## Testing Guidelines
All behavior must be exercised through XCTest in `Tests/WebLinking`. Name test methods with the `testDescriptiveScenario` pattern (see `testResponseFindLinkRelation`). When adding parsing logic, cover happy paths, malformed inputs, and edge cases such as relative URLs. Use `swift test --enable-code-coverage` locally if you touch critical parsing functions, and attach results when the change meaningfully alters coverage.

## Commit & Pull Request Guidelines
Write commits in the imperative mood with concise summaries (e.g. `feat: add relative link normalization`). Squash noisy work-in-progress commits before opening a pull request. Every PR should describe the intent, list validation commands (`swift test`), and link related issues. Include updated headers or sample responses when changes affect how agents or clients consume parsed links. Ask for reviews from maintainers familiar with Foundation networking when altering HTTP parsing.
