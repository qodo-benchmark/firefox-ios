# Compliance Rules

This file contains the compliance and code quality rules for this repository.

## 1. All Swift Files Must Include Mozilla Public License Header

**Objective:** Ensure legal compliance and proper licensing by requiring all Swift source files to include the standard Mozilla Public License v2.0 header at the beginning of the file

**Success Criteria:** Every .swift file begins with the exact Mozilla Public License header comment block: '// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/'

**Failure Criteria:** Swift files are missing the Mozilla Public License header, have an incorrect or modified header text, or have the header in the wrong location (not at the top of the file)

---

## 2. Code Must Pass All Enabled SwiftLint Rules

**Objective:** Maintain consistent code quality, style, and adherence to Swift best practices by enforcing all SwiftLint rules defined in .swiftlint.yml configuration

**Success Criteria:** Code passes all SwiftLint rules specified in .swiftlint.yml without warnings or errors, including line length limits (125 characters), closure body length (34 lines), function body length (122 lines), proper spacing, naming conventions, and syntax requirements

**Failure Criteria:** SwiftLint reports warnings or errors for violations such as exceeding line length, improper spacing, incorrect naming patterns, force unwrapping, force try, legacy API usage, or any other rule violations defined in the configuration

---

## 3. Code Sections Must Be Organized with MARK Comments

**Objective:** Improve code navigation and readability by using MARK comments to clearly delineate logical sections within Swift files, making it easier for developers to locate specific functionality

**Success Criteria:** Swift files use '// MARK:' comments to separate distinct code sections such as UI Elements, Properties, Initializers, Public Methods, Private Methods, Protocol Conformance (e.g., '// MARK: - ThemeApplicable'), and other logical groupings

**Failure Criteria:** Swift files lack MARK comments for section organization, or MARK comments are inconsistently applied across similar code structures

---

## 4. UI Elements Must Have Accessibility Identifiers

**Objective:** Ensure the application is accessible and testable by requiring all interactive UI elements to have unique accessibility identifiers that can be used by UI tests and assistive technologies

**Success Criteria:** All UI elements (buttons, text fields, views, labels, etc.) that users can interact with or that are tested in UI tests have their accessibilityIdentifier property set, typically using values from ViewModels (e.g., 'viewModel.a11yIdentifier')

**Failure Criteria:** Interactive UI elements are missing accessibilityIdentifier assignments, making them difficult to test or inaccessible to automation tools

---

## 5. UI Components Must Implement ThemeApplicable Protocol

**Objective:** Ensure consistent theming across the application by requiring all custom UI components to conform to the ThemeApplicable protocol and implement the applyTheme(theme:) method, enabling dynamic theme changes

**Success Criteria:** Custom UI view classes and components that display visual content conform to the ThemeApplicable protocol and implement the 'func applyTheme(theme: Theme)' method to update colors and visual properties based on the current theme

**Failure Criteria:** UI components that should support theming do not conform to ThemeApplicable protocol, or implement the protocol but fail to properly update their visual properties in the applyTheme method

---

## 6. Test Classes Must Use XCTest Framework with Proper Structure

**Objective:** Maintain consistent and reliable test infrastructure by requiring all test classes to inherit from XCTest framework classes and follow standard setup/teardown patterns

**Success Criteria:** Test files import XCTest, test classes inherit from XCTestCase, use setUp() and tearDown() methods for test lifecycle management, test methods start with 'test' prefix, and use XCTAssert family of assertions

**Failure Criteria:** Test classes do not inherit from XCTestCase, lack proper setUp/tearDown methods when needed, test methods don't follow naming conventions, or use assertions outside the XCTest framework

---

## 7. UI Components Must Use ViewModel Structs for Configuration

**Objective:** Promote separation of concerns and testability by requiring UI components to accept configuration through dedicated ViewModel structs rather than individual parameters

**Success Criteria:** UI components (views, buttons, cells) have corresponding ViewModel structs (e.g., PrimaryRoundedButtonViewModel) that encapsulate all configuration data including titles, identifiers, and styling properties, and components provide a configure(viewModel:) method

**Failure Criteria:** UI components accept configuration through multiple individual parameters instead of a cohesive ViewModel struct, or ViewModels are missing required properties like a11yIdentifier

---

## 8. System Dependencies Must Be Abstracted Behind Protocols

**Objective:** Improve testability and maintainability by requiring system dependencies (FileManager, NotificationCenter, etc.) to be abstracted behind protocol interfaces that can be mocked in tests

**Success Criteria:** System dependencies are accessed through protocol abstractions (e.g., FileManagerProtocol, NotificationProtocol, Application protocol) rather than direct concrete type usage, enabling dependency injection and test mocking

**Failure Criteria:** Code directly instantiates or uses concrete system types (FileManager.default, NotificationCenter.default) instead of using protocol abstractions, making the code difficult to test in isolation

---

## 9. UI-Related Code Must Be Annotated with @MainActor

**Objective:** Ensure thread safety and prevent race conditions by requiring all UI-related code, including view controllers, views, and UI-manipulating methods, to be annotated with @MainActor to guarantee execution on the main thread

**Success Criteria:** Classes, structs, or methods that interact with UIKit or perform UI updates are marked with @MainActor annotation, ensuring all UI operations execute on the main thread

**Failure Criteria:** UI-related code lacks @MainActor annotation, potentially allowing UI updates from background threads and causing runtime errors or crashes

---

## 10. Test Files Must Follow Naming Convention

**Objective:** Maintain consistent test file organization and discoverability by enforcing a standardized naming pattern for test files that clearly indicates their purpose

**Success Criteria:** Test files are named with 'Tests.swift' or 'Test.swift' suffix (e.g., 'LoggerTests.swift', 'NavigationTest.swift'), clearly identifying them as test files and corresponding to the code they test

**Failure Criteria:** Test files do not follow the naming convention, making them difficult to identify as tests or unclear which code they are testing

---

## 11. Properties and Methods Must Have Appropriate Access Control

**Objective:** Enforce information hiding and prevent unintended external access by requiring explicit access control modifiers (public, internal, private, fileprivate) on all properties and methods based on their intended scope

**Success Criteria:** All properties and methods have explicit access control modifiers: 'private' for implementation details, 'public' for external API surface, 'internal' for module-level access, ensuring minimal exposure of internal implementation

**Failure Criteria:** Properties or methods lack explicit access control modifiers when they should be private, or are marked public when they are only used internally

---

## 12. Classes That Should Not Be Subclassed Must Be Marked Final

**Objective:** Improve performance through compiler optimization and prevent unintended inheritance by marking classes as final when they are not designed to be subclassed

**Success Criteria:** Classes that are not intended for inheritance are marked with the 'final' keyword (e.g., 'final class MenuCell', 'public final class SecondaryRoundedButton'), enabling compiler optimizations and making design intent explicit

**Failure Criteria:** Classes that are not designed for subclassing lack the 'final' keyword, allowing unintended inheritance and missing optimization opportunities

---

## 13. UI Constant Values Must Be Defined in Nested UX Structs

**Objective:** Organize UI-related constants and magic numbers in a centralized, discoverable location by requiring them to be defined within nested UX structs inside UI component classes

**Success Criteria:** UI components define layout constants, spacing values, corner radii, insets, and other UI measurements within a private nested struct named 'UX', keeping magic numbers organized and easily modifiable (e.g., 'private struct UX { static let buttonCornerRadius: CGFloat = 12 }')

**Failure Criteria:** UI constants and magic numbers are scattered throughout the implementation code as literals, or are not organized within a dedicated UX namespace struct

---

## 14. Public APIs Must Have Documentation Comments

**Objective:** Improve code maintainability and developer experience by requiring all public-facing APIs to include documentation comments that explain their purpose, parameters, and usage

**Success Criteria:** Public functions, methods, properties, classes, structs, and protocols include triple-slash (///) documentation comments describing their purpose, behavior, parameters, and return values

**Failure Criteria:** Public API elements lack documentation comments, making it difficult for other developers to understand their purpose and proper usage without reading implementation code

---

## 15. UIView Subclasses Must Implement Required Init With FatalError

**Objective:** Prevent accidental instantiation from Interface Builder and make design decisions explicit by requiring UIView subclasses to implement required init?(coder:) with fatalError when programmatic initialization is intended

**Success Criteria:** Custom UIView subclasses that are designed for programmatic initialization only implement 'required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }', clearly indicating Interface Builder instantiation is not supported

**Failure Criteria:** UIView subclasses designed for programmatic use are missing the required init?(coder:) implementation, or implement it without fatalError, potentially allowing unintended Interface Builder instantiation

---
