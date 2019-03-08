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
    
    var localizedDescription: String {
        switch self {
        case .defaultError:
            return "Something went wrong. Try again later."
        }
    }
}
