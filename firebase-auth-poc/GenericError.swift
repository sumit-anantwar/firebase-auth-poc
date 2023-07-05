//
//  GenericError.swift
//  firebase-auth-poc
//
//  Created by Leo on 05/07/2023.
//

import Foundation

struct GenericError : Error, LocalizedError {
    
    private let message: String
    init(_ message: String) {
        self.message = message
    }
    
    var errorDescription: String? {
        return self.message
    }
}
