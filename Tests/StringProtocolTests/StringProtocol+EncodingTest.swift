//
//  String+Encoding.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Testing
import Foundation

@testable import Wing

struct StringEncodingTests {
  
  @Test func testUtf8Encoded() {
    let str = "Hello"
    let expectedData = Data([72, 101, 108, 108, 111])
    #expect(str.utf8Encoded() == expectedData)
    #expect("".utf8Encoded() == Data())
  }
  
  @Test func testUtf8Decoded() {
    let data = Data([72, 101, 108, 108, 111])
    #expect(String.utf8Decoded(data) == "Hello")
    #expect(String.utf8Decoded(Data()) == "")
    #expect(String.utf8Decoded(Data([0xFF])) == nil) // Invalid UTF-8
  }
}
