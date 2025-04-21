<p align="center">
    <img src="docs/logo-wing.png" alt="Wing Logo" width="500">
</p>

<h1 align="center">Wing</h1>

<p align="center">
    <a href="https://swift.org">
        <img src="https://img.shields.io/badge/Swift-6+-orange.svg" alt="Swift 6+">
    </a>
    <a href="https://developer.apple.com/ios/">
        <img src="https://img.shields.io/badge/iOS-15.0+-blue.svg" alt="iOS 15.0+">
    </a>
    <a href="https://developer.apple.com/macos/">
        <img src="https://img.shields.io/badge/macOS-10.15+-blue.svg" alt="macOS 10.15+">
    </a>
    <a href="https://github.com/annurdien/Wing/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="MIT">
    </a>
</p>

<p align="center">
    A powerful Swift library providing comprehensive extensions for standard Swift types and Foundation/UIKit classes, 
    designed to enhance developer productivity and simplify common programming tasks.
</p>

## 📖 Table of Contents

- [Features](#-features)
- [Installation](#-installation)
- [Usage Examples](#-usage-examples)
- [Requirements](#-requirements)
- [Documentation](#-documentation)
- [Contributing](#-contributing)
- [License](#-license)
- [Author](#-author)

## ✨ Features

<details open>
<summary>🔤 String Extensions</summary>

| Category | Features |
|----------|----------|
| **Encoding/Decoding** | • Base64 encoding/decoding<br>• URL encoding/decoding<br>• UTF-8 encoding/decoding |
| **Text Manipulation** | • Case transformations (camelCase, snake_case, kebab-case)<br>• Trimming whitespace<br>• Padding<br>• Truncating<br>• Removing HTML tags<br>• String reversal |
| **Validation** | • URL validation<br>• Hexadecimal validation<br>• Custom character set validation |
| **Formatting** | • Currency formatting<br>• Percentage formatting<br>• Number formatting |
| **Generation** | • Random string generation (alphanumeric, alphabetic, numeric) |
| **Hashing** | • SHA1<br>• SHA256 |

</details>

<details>
<summary>🔢 Number Extensions</summary>

| Category | Features |
|----------|----------|
| **Mathematical Operations** | • Power calculation<br>• Square root<br>• Rounding and formatting |
| **Utilities** | • Range clamping<br>• Random number generation<br>• Type conversions |
| **Formatting** | • Currency formatting<br>• Time interval conversions |

</details>

<details>
<summary>📅 Date Extensions</summary>

| Feature | Description |
|---------|-------------|
| **Calculations** | • Time difference calculations<br>• Date manipulation (adding/subtracting days) |
| **Comparison** | • `isToday`<br>• `isInPast`<br>• `isInFuture` |
| **Formatting** | • String conversion with custom formats |

</details>

<details>
<summary>📚 Collection Extensions</summary>

| Feature | Description |
|---------|-------------|
| **Safety** | • Safe subscript access |
| **Manipulation** | • Array chunking<br>• Duplicate removal<br>• Element swapping<br>• Element moving |

</details>

<details>
<summary>⚡ Optional Extensions</summary>

| Feature | Description |
|---------|-------------|
| **Unwrapping** | • Convenience unwrapping methods<br>• Nil coalescing with default values |
| **Utilities** | • Optional chaining helpers<br>• Nil-or-empty checking for collections |

</details>

<details>
<summary>🎁 Property Wrappers</summary>

| Wrapper | Description |
|---------|-------------|
| **@Clamped** | Value range restriction |
| **@KeyValueStorage** | UserDefaults persistence |
| **@Limited** | Collection/String length limiting |
| **@Masked** | String pattern masking |
| **@Trimming** | Automatic whitespace trimming |
| **@Validated** | Value validation |

</details>

## 📦 Installation

### Swift Package Manager

Add Wing to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/annurdien/Wing.git", from: "1.0.0")
]
```

## 🚀 Usage Examples

### String Extensions
```swift
import Wing

// Base64 encoding/decoding
let encoded = "Hello".base64Encoded // "SGVsbG8="
let decoded = encoded?.base64Decoded // "Hello"

// Case transformations
"helloWorld".snakeCased // "hello_world"
"hello-world".camelCased // "helloWorld"
"hello world".kebabCased // "hello-world"

// String validation
"https://example.com".isValidURL // true
"FF00FF".isHexadecimal // true

// String manipulation
"  Hello World  ".trimmed // "Hello World"
"Hello".padding(toLength: 10, withPad: "*") // "Hello*****"
"Hello World".truncate(length: 8) // "Hello..."
```

### Number Extensions
```swift
import Wing

// Mathematical operations
5.squared // 25
16.squareRoot() // 4.0
2.power(3) // 8

// Formatting
123.456.formatted(withFractionDigits: 2) // "123.46"
1234.currencyFormatted(locale: Locale(identifier: "en_US")) // "$1,234.00"

// Time intervals
5.minutes // TimeInterval(300)
2.hours // TimeInterval(7200)
```

### Date Extensions
```swift
import Wing

let date = Date()
date.isToday // true
date.isInPast // false
date.isInFuture // false

// Date formatting
date.toString("yyyy-MM-dd") // "2025-04-21"
date.toString(dateStyle: .full, timeStyle: .short) // "Sunday, April 21, 2025 at 10:30 AM"

// Date manipulation
date.addingDays(7) // Date one week from now
date.days(from: Date()) // 0
```

### Collection Extensions
```swift
import Wing

// Safe subscript access
let array = ["a", "b", "c"]
array[safe: 1] // Optional("b")
array[safe: 5] // nil

// Array manipulation
let numbers = [1, 2, 2, 3, 3, 3]
numbers.removingDuplicates() // [1, 2, 3]
numbers.chunked(into: 2) // [[1, 2], [2, 3], [3, 3]]

var mutableArray = ["a", "b", "c"]
mutableArray.move(from: 0, to: 2) // ["b", "c", "a"]
```

### Optional Extensions
```swift
import Wing

let optionalValue: String? = "Hello"
let nilValue: String? = nil

// Convenient unwrapping
optionalValue.ifPresent { value in
    print(value) // "Hello"
}

// Default values
nilValue.or("Default") // "Default"

// Optional mapping
optionalValue.mapIfPresent { $0.uppercased() } // Optional("HELLO")
```

### Property Wrappers
```swift
import Wing

class Configuration {
    @Clamped(min: 0, max: 100)
    var volume: Int = 50 // Will always be between 0 and 100
    
    @KeyValueStorage("username")
    var username: String = "default" // Persisted in UserDefaults
    
    @Limited(maxLength: 10)
    var shortText: String = "" // Will be truncated if longer than 10 characters
    
    @Trimming
    var userInput: String = "" // Whitespace will be automatically trimmed
}
```


## ⚙️ Requirements

- iOS 15.0+
- Swift 6.0+
- Xcode 15.0+

## 📚 Documentation

### Building Documentation

```bash
# Generate documentation using DocC
xcodebuild docbuild -scheme Wing -destination generic/platform=iOS

# View in Xcode
Product > Build Documentation (⌘ + ⇧ + D)
```

### Online Documentation
Visit our [online documentation](https://annurdien.github.io/Wing/documentation/wing) for detailed API references and guides.

## 👥 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Write tests for your changes
4. Commit your changes (`git commit -m 'Add amazing feature'`)
5. Push to the branch (`git push origin feature/amazing-feature`)
6. Open a Pull Request

For major changes, please open an issue first to discuss what you would like to change.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Annurdien Rasyid**
- GitHub: [@annurdien](https://github.com/annurdien)
- Twitter: [@annurdien](https://twitter.com/annurdien)

---

<p align="center">
    Made with ❤️ by <a href="https://github.com/annurdien">Annurdien Rasyid</a>
</p>