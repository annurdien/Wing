//
//  String+Regex.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Testing
@testable import Wing

struct StringRegexTests {
  
  @Test func testMatchesRegex() {
    let str = "123-456-7890"
    let phoneRegex = "^\\d{3}-\\d{3}-\\d{4}$"
    #expect(str.matches(regex: phoneRegex) == true)
    #expect("abc".matches(regex: phoneRegex) == false)
    #expect("".matches(regex: "^$") == true)
  }
  
  @Test func testMatchingStringsRegex() {
    let str = "Hello 123 World 456"
    let numberRegex = "\\d+"
    #expect(str.matchingStrings(regex: numberRegex) == ["123", "456"])
    #expect("No numbers".matchingStrings(regex: numberRegex) == [])
    #expect("".matchingStrings(regex: numberRegex) == [])
  }
  
  @Test func testReplacingOccurrencesOfRegex() {
    let str = "Hello 123 World 456"
    let numberRegex = "\\d+"
    #expect(str.replacingOccurrences(ofRegex: numberRegex, with: "***") == "Hello *** World ***")
    #expect("No numbers".replacingOccurrences(ofRegex: numberRegex, with: "***") == "No numbers")
    #expect("".replacingOccurrences(ofRegex: numberRegex, with: "***") == "")
  }
}
