//
//  String+FoundationTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Testing
@testable import Wing

struct StringFoundationTests {
  
  @Test func testLength() {
    #expect("".length == 0)
    #expect("Hello".length == 5)
    #expect("你好".length == 2)
  }
  
  @Test func testEmpty() {
    #expect(String.empty.isEmpty == true)
    #expect(String.empty.length == 0)
  }
  
  @Test func testTrimmed() {
    #expect("   Hello, World!   \n".trimmed == "Hello, World!")
    #expect("No whitespace".trimmed == "No whitespace")
    #expect("".trimmed == "")
    #expect(" \t\n ".trimmed == "")
  }
}
