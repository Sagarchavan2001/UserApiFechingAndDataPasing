//
//  userModal.swift
//  machintest19Jan
//
//  Created by STC on 19/01/24.
//

import Foundation
struct UserApiResponce: Decodable {
    let address: Address
    let id: Int
    let email, username, password: String
    let name: Name
    let phone: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case address, id, email, username, password, name, phone
        case v = "__v"
    }
}

// MARK: - Address
struct Address: Decodable {
    let geolocation: Geolocation
    let city, street: String
    let number: Int
    let zipcode: String
}

// MARK: - Geolocation
struct Geolocation: Decodable
{
    let lat, long: String
}

// MARK: - Name
struct Name: Decodable {
    let firstname, lastname: String
}
