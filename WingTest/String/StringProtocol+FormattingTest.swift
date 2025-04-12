//
//  String+Formatting.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Testing
import Foundation

@testable import Wing

struct StringFormattingTests {
  
  @Test func testFormatCurrency() {
    let price = "1234.56"
    let enUSLocale = Locale(identifier: "en_US")
    let enUSFormatted = price.formatCurrency(locale: enUSLocale)
    #expect(enUSFormatted?.contains("$1,234.56") == true) // Might vary slightly based on locale data
    
    let deDELocale = Locale(identifier: "de_DE")
    let deDEFormatted = price.formatCurrency(locale: deDELocale)
    #expect(deDEFormatted?.contains("1.234,56") == true) // Might vary slightly based on locale data
    
    #expect("invalid".formatCurrency() == nil)
  }
  
  @Test func testFormatNumber() {
    let number = "123.4567"
    #expect(number.formatNumber(decimalPlaces: 2) == "123,46")
    #expect(number.formatNumber(decimalPlaces: 0) == "123")
    #expect("invalid".formatNumber(decimalPlaces: 2) == nil)
  }
  
  @Test func testFormatPercentage() {
    let ratio = "0.75"
    let expected = NumberFormatter.localizedString(from: NSNumber(value: 0.75), number: .percent)
    #expect(ratio.formatPercentage() == expected)
    #expect("invalid".formatPercentage() == nil)
  }
}
