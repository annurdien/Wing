//
//  String+Conversion.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Testing
import Foundation

@testable import Wing

struct StringConversionTests {
  
  @Test func testInt() {
    #expect("123".int == 123)
    #expect("-456".int == -456)
    #expect("0".int == 0)
    #expect("abc".int == nil)
    #expect("12.3".int == nil)
  }
  
  @Test func testDouble() {
    #expect("3.14".double == 3.14)
    #expect("-2.718".double == -2.718)
    #expect("0".double == 0.0)
    #expect("abc".double == nil)
  }
  
  @Test func testFloat() {
    #expect("2.718".float == 2.718)
    #expect("-1.618".float == -1.618)
    #expect("0".float == 0.0)
    #expect("abc".float == nil)
  }
  
  @Test func testBool() {
    #expect("true".bool == true)
    #expect("yes".bool == true)
    #expect("1".bool == true)
    #expect("false".bool == false)
    #expect("no".bool == false)
    #expect("0".bool == false)
    #expect("invalid".bool == nil)
    #expect("TRUE".bool == true)
  }
  
  @Test func testDateWithFormat() {
    let dateFormatter = "yyyy-MM-dd"
    let dateString = "2023-10-27"
    let expectedDate = Calendar(identifier: .gregorian).date(bySettingHour: 0, minute: 0, second: 0, of: Date(timeIntervalSince1970: 1698355200))!
    #expect(dateString.date(withFormat: dateFormatter) == expectedDate)
    
    #expect("invalid date".date(withFormat: dateFormatter) == nil)
    #expect(dateString.date(withFormat: "MM/dd/yyyy") == nil)
  }
  
  @Test func testUtf8Data() {
    let str = "Hello"
    let expectedData = Data([72, 101, 108, 108, 111])
    #expect(str.utf8Data == expectedData)
    #expect("".utf8Data == Data())
  }
  
  @Test func testToIntArray() {
    #expect("1,2,3,4,5".toIntArray() == [1, 2, 3, 4, 5])
    #expect("1, 2, 3".toIntArray() == [1, 2, 3])
    #expect("1,a,3".toIntArray() == [1, 3])
    #expect("".toIntArray() == [])
    #expect(" ".toIntArray() == [])
  }
  
  @Test func testToDoubleArray() {
    #expect("1.1,2.2,3.3".toDoubleArray() == [1.1, 2.2, 3.3])
    #expect("1.1, 2.2, 3.3".toDoubleArray() == [1.1, 2.2, 3.3])
    #expect("1.1,a,3.3".toDoubleArray() == [1.1, 3.3])
    #expect("".toDoubleArray() == [])
    #expect(" ".toDoubleArray() == [])
  }
  
  @Test func testToURL() {
    #expect("https://www.example.com".toURL() == URL(string: "https://www.example.com"))
    #expect("invalid url".toURL() == nil)
  }
  
  @Test func testToDataUsingEncoding() {
    let str = "Hello"
    let expectedASCII = Data([72, 101, 108, 108, 111])
    #expect(str.toData(using: .ascii) == expectedASCII)
    #expect("".toData(using: .utf8) == Data())
  }
}
