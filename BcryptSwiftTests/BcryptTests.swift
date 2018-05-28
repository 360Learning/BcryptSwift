//
//  BcryptTests.swift
//  Mobile360
//
//  Created by Jean Barloy on 04/09/2017.
//  Copyright © 2017 360Learning. All rights reserved.
//

import XCTest
@testable import BcryptSwift

class BcryptTests: XCTestCase {
    
    let passwordsWith10RoundsHash = [
        "azertyuiop": "$2a$10$5QTfvfmetrNq3UsjrCRi7Oej4abYodKzzH9GjwmEoIvWjD34LmyxG",
        "qsdfghjklm": "$2a$10$YJ45teK12LVVyFy3dCh2wewTXSluksXwkIwBmwzQDUxiIHzjNGJji",
        "wxcvbn": "$2a$10$2Wh9M8H1gi76nnZ/lZSRU.dYFeHgc1I2CkLYqc1Lz1Ekq6Jl8xjWq",
        "1234567890azerty": "$2a$10$bl8KSr37v/8EqiS/4NfHg.m1UsV8G7eYk6FGdTlvLRd4Dtnijw652",
        "1234567890": "$2a$10$8.dQyZ8Uz/0EWv/XahaSkO3O1el5iWv7zD5CxF2iKt9NcdrYwHBTe",
        "azerty@&éè§(!àç)123": "$2a$10$aZFEXKyg8rNiRiJIHp6w0OETLl4F7S4qkehQzFMEWZG6JXw8LAE5u"
    ]
    
    let passwordsWith5RoundsHash = [
        "azertyuiop": "$2a$05$0skWAQPeFb6mcu0OQcHOYO0GFZa4bWFYS7TYSuR1K7YoTwoddcg8K",
        "qsdfghjklm": "$2a$05$ThmkEz6Pix7apv2SDYKuoev.UMRqfyixDdyLzeShhtOX3uuaHrdJi",
        "wxcvbn": "$2a$05$7lHtOBPJ5IpGecnz.F3dueox9X6LsY61g3HawwJf3x6/0qB1BSmgi",
        "1234567890azerty": "$2a$05$WXFZU18V0GkJn.j4OHETTO/WRp8XypeQWPUraWK25p6KtelFczFQK",
        "1234567890": "$2a$05$YzY32lnJ0IgzKmzqCYfY.uFBtDIKhzMnp0PQ3g/vvirAYoSsGfkqG",
        "azerty@&éè§(!àç)123": "$2a$05$l0eS6DASFlmj.2iXjy8MT.oRXf964Z9x.Qq4YNRLkBFyd.FEWywme"
    ]
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testVerifySelfHashs() {
        for password in passwordsWith10RoundsHash.keys {
            let hash = JKBCrypt.hashPassword(password: password, withSalt: JKBCrypt.generateSalt())!
            XCTAssert(JKBCrypt.verifyPassword(password: password, matchesHash: hash)!)
        }
    }
    
    func testVerifyExternalHashs() {
        for password in passwordsWith10RoundsHash.keys {
            let hash = passwordsWith10RoundsHash[password]!
            XCTAssert(JKBCrypt.verifyPassword(password: password, matchesHash: hash)!)
        }
    }
    
    func testVerifySelf5RoundsHashs() {
        for password in passwordsWith5RoundsHash.keys {
            let hash = JKBCrypt.hashPassword(password: password, withSalt: JKBCrypt.generateSaltWithNumberOfRounds(rounds: 5))!
            XCTAssert(JKBCrypt.verifyPassword(password: password, matchesHash: hash)!)
        }
    }
    
    func testVerifyExternal5RoundsHashs() {
        for password in passwordsWith5RoundsHash.keys {
            let hash = passwordsWith5RoundsHash[password]!
            XCTAssert(JKBCrypt.verifyPassword(password: password, matchesHash: hash)!)
        }
    }
    
    func testHash10RoundsPerformance() {
        self.measure {
            let _ = JKBCrypt.hashPassword(password: "1234567890azerty", withSalt: JKBCrypt.generateSalt())
        }
    }
    
    func testHash7RoundsPerformance() {
        self.measure {
            let _ = JKBCrypt.hashPassword(password: "1234567890azerty", withSalt: JKBCrypt.generateSaltWithNumberOfRounds(rounds: 7))
        }
    }
    
    func testHash6RoundsPerformance() {
        self.measure {
            let _ = JKBCrypt.hashPassword(password: "1234567890azerty", withSalt: JKBCrypt.generateSaltWithNumberOfRounds(rounds: 6))
        }
    }
    
    func testHash5RoundsPerformance() {
        self.measure {
            let _ = JKBCrypt.hashPassword(password: "1234567890azerty", withSalt: JKBCrypt.generateSaltWithNumberOfRounds(rounds: 5))
        }
    }
    
    func testVerify10RoundsPerformance() {
        let password = "1234567890azerty"
        let hash = passwordsWith10RoundsHash[password]!
        self.measure {
            let _ = JKBCrypt.verifyPassword(password: password, matchesHash: hash)
        }
    }
    
    func testVerify5RoundsPerformance() {
        let password = "1234567890azerty"
        let hash = passwordsWith5RoundsHash[password]!
        self.measure {
            let _ = JKBCrypt.verifyPassword(password: password, matchesHash: hash)
        }
    }
    
}
