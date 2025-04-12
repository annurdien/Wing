//
//  String+Random.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Testing
@testable import Wing

struct StringRandomTests {
  
  @Test func testRandomLength() {
    #expect(String.random(length: 5).length == 5)
    #expect(String.random(length: 10).length == 10)
    #expect(String.random(length: 0).isEmpty == true)
  }
  
  @Test func testRandomAlphabeticLength() {
    #expect(String.randomAlphabetic(length: 7).length == 7)
    #expect(String.randomAlphabetic(length: 0).isEmpty == true)
  }
  
  @Test func testRandomNumericLength() {
    #expect(String.randomNumeric(length: 6).length == 6)
    #expect(String.randomNumeric(length: 0).isEmpty == true)
  }
  
  @Test func testRandomWithCustomCharactersLength() {
    let customChars = "!@#%^&*"
    #expect(String.random(length: 3, from: customChars).length == 3)
    #expect(String.random(length: 0, from: customChars).isEmpty == true)
    #expect(String.random(length: 5, from: "").isEmpty == true)
  }
}
