//
//  Int+TimeIntervalTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Testing
import Foundation

@testable import Wing

struct BinaryIntTimeIntervalTests {
  @Test func testSeconds() {
    #expect(5.seconds == TimeInterval(5))
    #expect(0.seconds == TimeInterval(0))
    #expect((-10).seconds == TimeInterval(-10))
  }
  
  @Test func testMinutes() {
    #expect(2.minutes == TimeInterval(120))
    #expect(0.minutes == TimeInterval(0))
    #expect((-1).minutes == TimeInterval(-60))
  }
  
  @Test func testHours() {
    #expect(1.hours == TimeInterval(3600))
    #expect(0.hours == TimeInterval(0))
  }
  
  @Test func testDays() {
    #expect(0.days == TimeInterval(0))
    #expect((-1).days == TimeInterval(-86400))
  }
}
