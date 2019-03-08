//
//  Errors.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation

enum SystemError: LocalizedError {
    case defaultError
    case shareError
    
    var localizedDescription: String {
        switch self {
        case .defaultError:
            return "Something went wrong. Try again later."
        case .shareError:
            return "Oops...Nothing to share"
        }
    }
}
