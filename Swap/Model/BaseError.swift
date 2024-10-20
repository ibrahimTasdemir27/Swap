//
//  BaseError.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 29.08.2024.
//

import Foundation

public enum BaseError: Error, Equatable {
    case networkError
    case serverError
    case databaseError
    case invalidInputError
    case customError(String)
    case defaultError
    // Ek hata türleri buraya eklenebilir
    
    
    var localizedDescription: String {
        switch self {
        case .networkError:
            return "Lütfen internet bağlantını kontrole et."
        case .serverError:
            return "There is no data to show."
        case .databaseError:
            return "Something went wrong."
        case .invalidInputError:
            return "Invalid input."
        case .customError(let message):
            return message
        case .defaultError:
            return "Bir şeyler yanlış gitti."
        }
    }

    
}
