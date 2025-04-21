# Wing

Wing is a Swift library that provides a comprehensive collection of extensions for standard Swift types and Foundation/UIKit classes, designed to simplify common programming tasks and enhance developer productivity.

## Features

### String Extensions
- **Encoding/Decoding**
  - Base64 encoding/decoding
  - URL encoding/decoding
  - UTF-8 encoding/decoding
- **Text Manipulation**
  - Case transformations (camelCase, snake_case, kebab-case)
  - Trimming whitespace
  - Padding
  - Truncating
  - Removing HTML tags
  - String reversal
- **Validation**
  - URL validation
  - Hexadecimal validation
  - Custom character set validation
- **Formatting**
  - Currency formatting
  - Percentage formatting
  - Number formatting
- **Generation**
  - Random string generation (alphanumeric, alphabetic, numeric)
- **Hashing**
  - SHA1
  - SHA256

### Number Extensions
- **BinaryInteger & BinaryFloatingPoint**
  - Mathematical operations (power, square root, etc.)
  - Rounding and formatting
  - Range clamping
  - Random number generation
  - Time interval conversions
  - Currency formatting
  - Type conversions

### Date Extensions
- Time difference calculations
- Date comparison (`isToday`, `isInPast`, `isInFuture`)
- String conversion with custom formats
- Date manipulation (adding/subtracting days)

### Collection Extensions
- Safe subscript access
- Array chunking
- Duplicate removal
- Element swapping
- Element moving

### Optional Extensions
- Convenience unwrapping methods
- Nil coalescing with default values
- Optional chaining helpers
- Nil-or-empty checking for collections

### Property Wrappers
- `@Clamped`: Value range restriction
- `@KeyValueStorage`: UserDefaults persistence
- `@Limited`: Collection/String length limiting
- `@Masked`: String pattern masking
- `@Trimming`: Automatic whitespace trimming
- `@Validated`: Value validation


Complete documentation is available [here](https://annurdien.github.io/Wing/documentation/wing).

## Installation

### Swift Package Manager

Add Wing as a dependency in your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/username/Wing.git", from: "1.0.0")
]
```

## Usage Examples

### String Extensions
```swift
import Wing

// Base64 encoding/decoding
let encoded = "Hello".base64Encoded // "SGVsbG8="
let decoded = encoded?.base64Decoded // "Hello"

// URL encoding/decoding
let url = "Hello World!".urlEncoded // "Hello%20World!"
let decoded = url?.urlDecoded // "Hello World!"

// Case transformations
"helloWorld".snakeCased // "hello_world"
"hello-world".camelCased // "helloWorld"

// String validation
"https://example.com".isValidURL // true
"FF00FF".isHexadecimal // true
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
date.toString("yyyy-MM-dd") // "2025-04-21"
date.addingDays(7) // Date one week from now
```

### Collection Extensions
```swift
import Wing

let array = [1, 2, 2, 3, 3, 3]
array.removingDuplicates() // [1, 2, 3]

let chunks = array.chunked(into: 2) // [[1, 2], [2, 3], [3, 3]]

// Safe subscript
let items = ["a", "b", "c"]
items[safe: 5] // nil
```

## Requirements

- iOS 13.0+ / macOS 10.15+
- Swift 5.3+
- Xcode 12.0+

## Documentation

Detailed API documentation is available through DocC. Build the documentation in Xcode using:
Product > Build Documentation (⌘ + ⇧ + D)

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Author

Annurdien Rasyid
