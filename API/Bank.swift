//
//  Bank.swift
//  API
//
//  Created by wdp mac on 10/02/22.
//

import Foundation

// MARK: - WelcomeElement
struct Bank: Codable {
    let id: Int
    let uid, accountNumber, iban, bankName: String
    let routingNumber, swiftBic: String

    enum CodingKeys: String, CodingKey {
        case id, uid
        case accountNumber = "account_number"
        case iban
        case bankName = "bank_name"
        case routingNumber = "routing_number"
        case swiftBic = "swift_bic"
    }
}

typealias Banks = [Bank]
