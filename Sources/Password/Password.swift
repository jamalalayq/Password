// swiftlint:disable all
//
//  Password.swift
//
//  Created by Jamal alayq on 6/23/19.
//  Copyright © 2019 Jamal alayq. All rights reserved.
//

import Foundation

public struct Password: ExpressibleByStringLiteral {
    
    public private(set) var value: String
    public var confirmation: String?
    public var length = 8 {
        didSet {
            if self.length <= 0 {
                fatalError("passwords couldn't be less than zero or equal zero.")
            }
        }
    }
        
    public init(stringLiteral value: String) {
        self = Password(value: value)
    }
    
    public init(value: String) {
        self.value = value
    }
    
    public var isValid: Bool {
        guard !self.value.isEmpty else { return false }
        guard self.value.count >= length else { return false }
        if let confirmed = self.confirmation, confirmed != value {
            return false
        }
        return true
    }

    public var isNotValid: Bool { !isValid }
    
    public func validate() throws {
        guard !self.value.isEmpty else { throw PasswordErrors.empty }
        guard self.value.count >= length else { throw PasswordErrors.invalidLength }
        if let confirmed = self.confirmation {
            if confirmed.isEmpty { throw PasswordErrors.invalidConfirmPassword }
            if confirmed != value { throw PasswordErrors.invalidMatching }
        }
    }
        
    public static var empty: Password {
        return .init(value: "")
    }
    
    public enum PasswordErrors: Error {
        case empty
        case invalidLength
        case invalidMatching
        case invalidConfirmPassword
    }
    
}

// MARK:- Codabilty

extension Password: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        value = try container.decode(String.self)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
    
}

// MARK:- Equatable

extension Password: Equatable {
        
    public static func == (lhs: Password, rhs: Password) -> Bool {
        return lhs.value == rhs.value && lhs.isValid && rhs.isValid
    }
    
}

// MARK:- Hshable

extension Password: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.value)
    }
    
}
