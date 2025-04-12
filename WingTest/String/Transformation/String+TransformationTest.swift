//
//  String+Transformation.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Testing
@testable import Wing

struct StringTransformationTests {
  
  @Test func testNormalized() {
    #expect("café".normalized == "cafe")
    #expect("你好世界".normalized == "你好世界")
    #expect("".normalized == "")
    #expect("éèêë".normalized == "eeee")
  }
  
  @Test func testUppercasedFirstLetter() {
    #expect("hello".uppercasedFirstLetter == "Hello")
    #expect("World".uppercasedFirstLetter == "World")
    #expect("".uppercasedFirstLetter == "")
    #expect("a".uppercasedFirstLetter == "A")
  }
  
  @Test func testLowercasedFirstLetter() {
    #expect("Hello".lowercasedFirstLetter == "hello")
    #expect("world".lowercasedFirstLetter == "world")
    #expect("".lowercasedFirstLetter == "")
    #expect("A".lowercasedFirstLetter == "a")
  }
  
  @Test func testCamelCased() {
    #expect("hello world example".camelCased == "helloWorldExample")
    #expect("HelloWorldExample".camelCased == "helloWorldExample")
    #expect("hello   world".camelCased == "helloWorld")
    #expect("".camelCased == "")
    #expect("singleWord".camelCased == "singleWord")
    #expect("  leading and trailing spaces  ".camelCased == "leadingAndTrailingSpaces")
  }
  
  @Test func testSnakeCased() {
    #expect("hello world example".snakeCased == "hello_world_example")
    #expect("HelloWorldExample".snakeCased == "hello_world_example")
    #expect("hello   world".snakeCased == "hello_world")
    #expect("".snakeCased == "")
    #expect("singleWord".snakeCased == "single_word")
    #expect("  leading and trailing spaces  ".snakeCased == "leading_and_trailing_spaces")
    #expect("AABBCC".snakeCased == "aabbcc")
    #expect("AaBbCc".snakeCased == "aa_bb_cc")
  }
  
  @Test func testKebabCased() {
    #expect("hello world example".kebabCased == "hello-world-example")
    #expect("HelloWorldExample".kebabCased == "hello-world-example")
    #expect("hello   world".kebabCased == "hello-world")
    #expect("".kebabCased == "")
    #expect("singleWord".kebabCased == "single-word")
    #expect("  leading and trailing spaces  ".kebabCased == "leading-and-trailing-spaces")
  }
  
  @Test func testBase64Encoded() {
    #expect("Hello".base64Encoded == "SGVsbG8=")
    #expect("Swift".base64Encoded == "U3dpZnQ=")
    #expect("".base64Encoded == "")
  }
  
  @Test func testBase64Decoded() {
    #expect("SGVsbG8=".base64Decoded == "Hello")
    #expect("U3dpZnQ=".base64Decoded == "Swift")
    #expect("".base64Decoded == "")
    #expect("invalid base64".base64Decoded == nil)
  }
  
  @Test func testReversed() {
    #expect("Hello".reversed == "olleH")
    #expect("racecar".reversed == "racecar")
    #expect("".reversed == "")
    #expect("123".reversed == "321")
  }
  
  @Test func testUrlEncoded() {
    #expect("Hello World!".urlEncoded == "Hello%20World!")
    #expect("".urlEncoded == "")
  }
  
  @Test func testUrlDecoded() {
    #expect("Hello%20World!".urlDecoded == "Hello World!")
    #expect("!%40%23%24%25%5E%26*()_%2B".urlDecoded == "!@#$%^&*()_+")
    #expect("".urlDecoded == "")
  }
  
  @Test func testRemovingHTMLTags() {
    #expect("<p>Hello <b>World</b>!</p>".removingHTMLTags() == "Hello World!")
    #expect("No tags here".removingHTMLTags() == "No tags here")
    #expect("".removingHTMLTags() == "")
    #expect("<a>Link</a> and <br/> break".removingHTMLTags() == "Link and  break")
  }
}
