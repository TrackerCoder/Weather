//
//  RootViewIO.swift
//  Weather
//
//  Created by Tracker on 08.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation

protocol RootViewInput: class {
    func openApp()
    func showError(type: LocationErrorType)
}

protocol RootViewOutput {
    func viewIsReady()
    func requestLocation()
}
