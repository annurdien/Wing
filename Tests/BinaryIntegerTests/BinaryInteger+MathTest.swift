//
//  Int+MathTest.swift
//  Wing
//
//  Created by Annurdien Rasyid on 13/04/25.
//

import Testing
import Foundation

@testable import Wing

struct BinaryIntPowerTests {
  @Test func testPowerPositiveExponent() {
    #expect(2.power(of: 3) == 8)
    #expect(5.power(of: 2) == 25)
    #expect(10.power(of: 1) == 10)
  }
  
  @Test func testPowerZeroExponent() {
    #expect(5.power(of: 0) == 1)
    #expect(0.power(of: 0) == 1)
    #expect((-3).power(of: 0) == 1)
  }
  
  @Test func testPowerNegativeExponentReturnsZero() {
    #expect(2.power(of: -1) == 0)
    #expect(5.power(of: -3) == 0)
  }
  
  @Test func testPowerBaseZero() {
    #expect(0.power(of: 5) == 0)
  }
  
  @Test func testIsPrimeTrue() {
    #expect(2.isPrime == true)
    #expect(3.isPrime == true)
    #expect(5.isPrime == true)
    #expect(7.isPrime == true)
    #expect(11.isPrime == true)
    #expect(13.isPrime == true)
    #expect(17.isPrime == true)
    #expect(97.isPrime == true)
  }
  
  @Test func testIsPrimeFalse() {
    #expect(1.isPrime == false)
    #expect(4.isPrime == false)
    #expect(6.isPrime == false)
    #expect(8.isPrime == false)
    #expect(9.isPrime == false)
    #expect(10.isPrime == false)
    #expect(12.isPrime == false)
    #expect(15.isPrime == false)
    #expect(100.isPrime == false)
  }
  
  @Test func testIsPrimeNegativeAndZero() {
    #expect(0.isPrime == false)
    #expect((-2).isPrime == false)
    #expect((-7).isPrime == false)
  }
  
  @Test func testFactorialZero() {
    #expect(0.factorial == 1)
  }
  
  @Test func testFactorialPositive() {
    #expect(1.factorial == 1)
    #expect(2.factorial == 2)
    #expect(3.factorial == 6)
    #expect(4.factorial == 24)
    #expect(5.factorial == 120)
    #expect(10.factorial == 3628800)
  }
  
  @Test func testFactorialNegativeReturnsOne() {
    #expect((-1).factorial == 1)
    #expect((-5).factorial == 1)
  }
  
  @Test func testIsDivisibleByPositiveDivisor() {
    #expect(10.isDivisible(by: 2) == true)
    #expect(15.isDivisible(by: 5) == true)
    #expect(7.isDivisible(by: 7) == true)
    #expect(9.isDivisible(by: 3) == true)
    #expect(10.isDivisible(by: 3) == false)
  }
  
  @Test func testIsDivisibleByNegativeDivisor() {
    #expect(10.isDivisible(by: -2) == true)
    #expect(15.isDivisible(by: -5) == true)
    #expect((-10).isDivisible(by: 2) == true)
    #expect((-15).isDivisible(by: -5) == true)
    #expect(7.isDivisible(by: -7) == true)
  }
  
  @Test func testIsNotDivisible() {
    #expect(10.isDivisible(by: 7) == false)
    #expect(15.isDivisible(by: 4) == false)
    #expect(7.isDivisible(by: 2) == false)
  }
  
  @Test func testIsDivisibleByZeroReturnsFalse() {
    #expect(5.isDivisible(by: 0) == false)
    #expect(0.isDivisible(by: 0) == false)
  }
  
  @Test func testZeroIsDivisibleByNonZero() {
    #expect(0.isDivisible(by: 5) == true)
    #expect(0.isDivisible(by: -3) == true)
  }
  
  @Test func testGCDPositiveNumbers() {
    #expect(48.gcd(with: 18) == 6)
    #expect(12.gcd(with: 8) == 4)
    #expect(10.gcd(with: 5) == 5)
    #expect(7.gcd(with: 13) == 1) // Coprime
    #expect(25.gcd(with: 25) == 25)
  }
  
  @Test func testGCDWithZero() {
    #expect(10.gcd(with: 0) == 10)
    #expect(0.gcd(with: 15) == 15)
    #expect(0.gcd(with: 0) == 0)
  }
  
  @Test func testGCDWithNegativeNumbers() {
    #expect((-48).gcd(with: 18) == 6)
    #expect(48.gcd(with: (-18)) == 6)
    #expect((-48).gcd(with: (-18)) == 6)
    #expect((-10).gcd(with: 5) == 5)
  }
  
  @Test func testLCMPositiveNumbers() {
    #expect(12.lcm(with: 18) == 36)
    #expect(4.lcm(with: 6) == 12)
    #expect(5.lcm(with: 10) == 10)
    #expect(7.lcm(with: 11) == 77) // Coprime
    #expect(15.lcm(with: 15) == 15)
  }
  
  @Test func testLCMWithZero() {
    #expect(10.lcm(with: 0) == 0)
    #expect(0.lcm(with: 15) == 0)
    #expect(0.lcm(with: 0) == 0)
  }
  
  @Test func testLCMWithNegativeNumbers() {
    #expect((-12).lcm(with: 18) == 36)
    #expect(12.lcm(with: (-18)) == 36)
    #expect((-12).lcm(with: (-18)) == 36)
    #expect((-5).lcm(with: 10) == 10)
  }
}
