//
//  Optional+ExtensionsTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Testing
import Foundation

@testable import Wing

struct OptionalExtensionsTests {
  @Test func testOr() {
    let optionalInt: Int? = 5
    #expect(optionalInt.or(0) == 5)
    
    let nilOptionalInt: Int? = nil
    #expect(nilOptionalInt.or(0) == 0)
    
    let optionalString: String? = "hello"
    #expect(optionalString.or("world") == "hello")
    
    let nilOptionalString: String? = nil
    #expect(nilOptionalString.or("world") == "world")
  }
  
  @Test func testOrThrow() throws {
    let optionalInt: Int? = 10
    #expect(try optionalInt.orThrow(NSError(domain: "Test", code: 1)) == 10)
    
    let nilOptionalInt: Int? = nil
    do {
      _ = try nilOptionalInt.orThrow(NSError(domain: "Test", code: 1))
      #expect(Bool(false), "Expected an error to be thrown")
    } catch let error as NSError {
      #expect(error.domain == "Test")
      #expect(error.code == 1)
    }
  }
  
  @Test func testIfLet() {
    var value = 0
    let optionalInt: Int? = 7
    optionalInt.ifLet {
      value = $0 * 2
    }
    #expect(value == 14)
    
    let nilOptionalInt: Int? = nil
    nilOptionalInt.ifLet {
      value = $0 * 2 // This should not be executed
    }
    #expect(value == 14) // Value should remain unchanged
  }
  
  @Test func testMapIfPresent() {
    let optionalInt: Int? = 3
    let mappedInt = optionalInt.mapIfPresent { $0 * $0 }
    #expect(mappedInt == 9)
    
    let nilOptionalInt: Int? = nil
    let nilMappedInt = nilOptionalInt.mapIfPresent { $0 * $0 }
    #expect(nilMappedInt == nil)
    
    let optionalString: String? = "test"
    let mappedString = optionalString.mapIfPresent { $0.uppercased() }
    #expect(mappedString == "TEST")
    
    let nilOptionalString: String? = nil
    let nilMappedString = nilOptionalString.mapIfPresent { $0.uppercased() }
    #expect(nilMappedString == nil)
  }
  
  @Test func testFlatMapIfPresent() {
    let optionalString: String? = "5"
    let flatMappedInt = optionalString.flatMapIfPresent { Int($0) }
    #expect(flatMappedInt == 5)
    
    let optionalInvalidString: String? = "abc"
    let nilFlatMappedIntFromString = optionalInvalidString.flatMapIfPresent { Int($0) }
    #expect(nilFlatMappedIntFromString == nil)
    
    let nilOptionalString: String? = nil
    let nilFlatMappedIntFromNil = nilOptionalString.flatMapIfPresent { Int($0) }
    #expect(nilFlatMappedIntFromNil == nil)
  }
}
