//
//  String+Hashing.swift
//  Wing
//
//  Created by Annurdien Rasyid on 11/04/25.
//

import Testing
@testable import Wing

struct StringHashingTests {
  @Test func testSHA1() {
    #expect("Hello".sha1() == "f7ff9e8b7bb2e09b70935a5d785e0cc5d9d0abf0")
    #expect("".sha1() == "da39a3ee5e6b4b0d3255bfef95601890afd80709")
    #expect("123".sha1() == "40bd001563085fc35165329ea1ff5c5ecbdbbeef")
  }
  
  @Test func testSHA256() {
    #expect("Hello".sha256() == "185f8db32271fe25f561a6fc938b2e264306ec304eda518007d1764826381969")
    #expect("".sha256() == "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
    #expect("123".sha256() == "a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3")
  }
}
