//
//  BinaryFloatingPoint+TimeIntervalTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Testing
@testable import Wing

struct BinaryFloatingPointTimeIntervalTests {
  @Test func testSeconds() {
    #expect(1.0.seconds == 1.0)
    #expect(5.5.seconds == 5.5)
    #expect(0.0.seconds == 0.0)
    #expect((-2.0).seconds == -2.0)
  }
  
  @Test func testMinutes() {
    #expect(1.0.minutes == 60.0)
    #expect(0.5.minutes == 30.0)
    #expect(2.0.minutes == 120.0)
    #expect((-1.0).minutes == -60.0)
  }
  
  @Test func testHours() {
    #expect(1.0.hours == 3600.0)
    #expect(0.25.hours == 900.0)
    #expect(2.0.hours == 7200.0)
    #expect((-0.5).hours == -1800.0)
  }
  
  @Test func testDays() {
    #expect(1.0.days == 86400.0)
    #expect(0.5.days == 43200.0)
    #expect(0.1.days == 8640.0)
    #expect((-1.0).days == -86400.0)
  }
}
