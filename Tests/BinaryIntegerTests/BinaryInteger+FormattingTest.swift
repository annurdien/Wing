//
//  Int+FormattingTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 12/04/25.
//

import Testing
@testable import Wing

struct BinaryIntFormattingTests {
  @Test func testFormattedWithCurrencyStyle() {
    let number = 12345
    let formatted = number.formatted(withStyle: .currency)
    #expect(formatted != nil)
    // Further assertions might be locale-dependent, so be cautious.
    // Example: #expect(formatted?.contains("$12,345.00") == true) for en_US locale.
  }
  
  @Test func testFormattedWithDecimalStyle() {
    let number = 12345
    let formatted = number.formatted(withStyle: .decimal)
    #expect(formatted == "12.345") // Assuming id_ID locale
  }
  
  @Test func testFormattedWithPercentStyle() {
    let number = 50
    let formatted = number.formatted(withStyle: .percent)
    #expect(formatted == "5.000%") // Assuming id_ID locale
  }
  
  @Test func testFormattedWithNoStyle() {
    let number = 987
    let formatted = number.formatted(withStyle: .none)
    #expect(formatted == "987")
  }
}
