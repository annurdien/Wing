//
//  String+Validation.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Testing
import Foundation

@testable import Wing

struct StringValidationTests {
  
  @Test func testIsValidEmail() {
    #expect("test@example.com".isValidEmail == true)
    #expect("test.user@sub.example.co.uk".isValidEmail == true)
    #expect("test@example".isValidEmail == false)
    #expect("test@.com".isValidEmail == false)
    #expect("@example.com".isValidEmail == false)
    #expect("test@example..com".isValidEmail == false)
  }
  
  @Test func testIsValidURL() {
    #expect("https://www.example.com".isValidURL == true)
    #expect("http://example.org".isValidURL == true)
    #expect("ftp://files.example.net".isValidURL == true)
    #expect("example".isValidURL == false)
    #expect("invalid://url".isValidURL == false)
  }
  
  @Test func testIsPhoneNumber() {
    #expect("+1 (555) 123-4567".isPhoneNumber == true)
    #expect("555-123-4567".isPhoneNumber == true)
    #expect("1234567890".isPhoneNumber == true)
    #expect("+447700900000".isPhoneNumber == true)
    #expect("abc".isPhoneNumber == false)
    #expect("123-456-7890 ext 123".isPhoneNumber == false)
  }
  
  @Test func testIsAlphanumeric() {
    #expect("HelloWorld123".isAlphanumeric == true)
    #expect("ABCDEF0123456789".isAlphanumeric == true)
    #expect("".isAlphanumeric == false)
    #expect("Hello World".isAlphanumeric == false)
    #expect("Hello!".isAlphanumeric == false)
  }
  
  @Test func testIsNumeric() {
    #expect("12345".isNumeric == true)
    #expect("0".isNumeric == true)
    #expect("".isNumeric == false)
    #expect("123a".isNumeric == false)
    #expect("12.3".isNumeric == false)
    #expect("-123".isNumeric == false)
  }
  
  @Test func testIsAlphabetic() {
    #expect("HelloWorld".isAlphabetic == true)
    #expect("ABCDEF".isAlphabetic == true)
    #expect("".isAlphabetic == false)
    #expect("Hello1".isAlphabetic == false)
    #expect("Hello World".isAlphabetic == false)
  }
  
  @Test func testContainsOnlyCharactersIn() {
    let hexChars = CharacterSet(charactersIn: "0123456789abcdefABCDEF")
    #expect("A1B2C3D4".containsOnlyCharactersIn(characterSet: hexChars) == true)
    #expect("A1B2G3D4".containsOnlyCharactersIn(characterSet: hexChars) == false)
    #expect("".containsOnlyCharactersIn(characterSet: hexChars) == true)
  }
  
  @Test func testIsStrongPassword() {
    #expect("P@sswOrd123".isStrongPassword == true)
    #expect("StrongPassword!1".isStrongPassword == true)
    #expect("password".isStrongPassword == false)
    #expect("Password1".isStrongPassword == true)
    #expect("password1".isStrongPassword == false)
    #expect("P@ssword".isStrongPassword == false)
    #expect("P@ssword12".isStrongPassword == true)
  }
  
  @Test func testIsHexadecimal() {
    #expect("A1B2C3".isHexadecimal == true)
    #expect("0123456789abcdefABCDEF".isHexadecimal == true)
    #expect("".isHexadecimal == true)
    #expect("A1B2G3".isHexadecimal == false)
    #expect("A1 B2".isHexadecimal == false)
  }
  
  @Test func testIsValidIPAddress() {
    #expect("192.168.1.1".isValidIPAddress == true)
    #expect("0.0.0.0".isValidIPAddress == true)
    #expect("255.255.255.255".isValidIPAddress == true)
    #expect("256.0.0.1".isValidIPAddress == false)
    #expect("192.168.1".isValidIPAddress == false)
    #expect("192.168.1.1.1".isValidIPAddress == false)
    #expect("abc.def.ghi.jkl".isValidIPAddress == false)
  }
  
  @Test func testIsValidPostalCode() {
    #expect("12345".isValidPostalCode == true)
    #expect("12345-6789".isValidPostalCode == true)
    #expect("1234".isValidPostalCode == false)
    #expect("123456".isValidPostalCode == false)
    #expect("12345-678".isValidPostalCode == false)
    #expect("abcde".isValidPostalCode == false)
  }
}
