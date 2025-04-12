//
//  String+Comparison.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Testing
@testable import Wing

struct StringComparisonTests {
  
  @Test func testIsCaseInsensitiveEqual() {
    #expect("Hello".isCaseInsensitiveEqual(to: "hello") == true)
    #expect("WORLD".isCaseInsensitiveEqual(to: "world") == true)
    #expect("Hello".isCaseInsensitiveEqual(to: "hi") == false)
    #expect("".isCaseInsensitiveEqual(to: "") == true)
  }
  
  @Test func testContains() {
    let str = "Hello World"
    #expect(str.contains("World") == true)
    #expect(str.contains("world") == false)
    #expect(str.contains("world", caseSensitive: false) == true)
    #expect(str.contains("H") == true)
    #expect("".contains("a") == false)
  }
  
  @Test func testStartsWith() {
    let str = "Hello World"
    #expect(str.startsWith("Hello") == true)
    #expect(str.startsWith("hello") == false)
    #expect(str.startsWith("hello", caseSensitive: false) == true)
    #expect(str.startsWith("") == true)
    #expect("".startsWith("a") == false)
  }
  
  @Test func testEndsWith() {
    let str = "Hello World"
    #expect(str.endsWith("World") == true)
    #expect(str.endsWith("world") == false)
    #expect(str.endsWith("world", caseSensitive: false) == true)
    #expect(str.endsWith("") == true)
    #expect("".endsWith("a") == false)
  }
  
  @Test func testIsAnagram() {
    #expect("listen".isAnagram(of: "silent") == true)
    #expect("hello".isAnagram(of: "world") == false)
    #expect("".isAnagram(of: "") == true)
    #expect("aabb".isAnagram(of: "baba") == true)
    #expect("aabbc".isAnagram(of: "baba") == false)
  }
  
  @Test func testCompareVersion() {
    #expect("1.0.0".compareVersion(to: "1.0.1") == .orderedAscending)
    #expect("1.1.0".compareVersion(to: "1.0.0") == .orderedDescending)
    #expect("1.0.0".compareVersion(to: "1.0.0") == .orderedSame)
    #expect("1.0".compareVersion(to: "1.0.0") == .orderedAscending)
    #expect("1.0.0".compareVersion(to: "1.0") == .orderedDescending)
    #expect("2.0".compareVersion(to: "1.5") == .orderedDescending)
  }
}
