//
//  String+Manipulation.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Testing
import Foundation

@testable import Wing

struct StringManipulationTests {
  
  @Test func testSubstringFrom() {
    let str = "Hello, World!"
    #expect(str.substring(from: 7) == "World!")
    #expect(str.substring(from: 0) == "Hello, World!")
    #expect(str.substring(from: str.count) == "")
    #expect(str.substring(from: 100) == "")
    #expect(str.substring(from: -1) == "")
  }
  
  @Test func testSubstringTo() {
    let str = "Hello, World!"
    #expect(str.substring(to: 5) == "Hello")
    #expect(str.substring(to: 0) == "")
    #expect(str.substring(to: str.count) == "Hello, World!")
    #expect(str.substring(to: 100) == "")
    #expect(str.substring(to: -1) == "")
  }
  
  @Test func testReplacing() {
    let str = "Hello World World"
    #expect(str.replacing("World", with: "Universe") == "Hello Universe Universe")
    #expect(str.replacing("hello", with: "Hi") == "Hello World World")
  }
  
  @Test func testRemoving() {
    let str = "Hello World World"
    #expect(str.removing("World ") == "Hello World")
    #expect(str.removing("hello") == "Hello World World")
    #expect(str.removing("") == "Hello World World")
  }
  
  @Test func testAppending() {
    let str = "Hello"
    #expect(str.appending(" World!") == "Hello World!")
    #expect(str.appending("") == "Hello")
  }
  
  @Test func testInserting() {
    let str = "HelloWorld"
    #expect(str.inserting(", ", at: 5) == "Hello, World")
    #expect(str.inserting("!", at: str.count) == "HelloWorld!")
    #expect(str.inserting("Start ", at: 0) == "Start HelloWorld")
    #expect(str.inserting("", at: 3) == "HelloWorld")
    #expect(str.inserting("Middle", at: 5) == "HelloMiddleWorld")
    #expect(str.inserting("End", at: 100) == "HelloWorld")
    #expect(str.inserting("Start", at: -1) == "HelloWorld")
  }
  
  @Test func testComponentsSeparatedByString() {
    let str = "apple,banana,orange"
    #expect(str.components(separatedBy: ",") == ["apple", "banana", "orange"])
    #expect("one two three".components(separatedBy: " ") == ["one", "two", "three"])
    #expect("".components(separatedBy: ",") == [""])
  }
  
  
  @Test func testPaddingToLengthWithPad() {
    let str = "Hello"
    #expect(str.padding(toLength: 10, withPad: "*") == "Hello*****")
    #expect(str.padding(toLength: 5, withPad: "*") == "Hello")
    #expect(str.padding(toLength: 0, withPad: "*") == "")
    #expect("".padding(toLength: 5, withPad: "-") == "-----")
  }
  
  @Test func testTruncate() {
    let str = "This is a long string."
    #expect(str.truncate(length: 10) == "This is a ...")
    #expect(str.truncate(length: 10, addEllipsis: false) == "This is a ")
    #expect(str.truncate(length: str.count) == "This is a long string.")
    #expect(str.truncate(length: str.count + 5) == "This is a long string.")
    #expect("Short".truncate(length: 10) == "Short")
    #expect("".truncate(length: 5) == "")
  }
  
  @Test func testIndexOfSubOccurrence() {
    let str = "banana"
    #expect(str.indexOf(sub: "a", occurrence: 1) == 1)
    #expect(str.indexOf(sub: "a", occurrence: 2) == 3)
    #expect(str.indexOf(sub: "a", occurrence: 3) == 5)
    #expect(str.indexOf(sub: "a", occurrence: 4) == nil)
    #expect(str.indexOf(sub: "n", occurrence: 0) == nil)
    #expect(str.indexOf(sub: "ban", occurrence: 1) == 0)
    #expect(str.indexOf(sub: "nan", occurrence: 2) == nil)
    #expect(str.indexOf(sub: "x", occurrence: 1) == nil)
    #expect("aaaaa".indexOf(sub: "a", occurrence: 3) == 2)
  }
}
