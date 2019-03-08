//
//  ViewInput.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import UIKit

protocol UIViewInput {
    func show(error: Error, handler: ((UIAlertAction) -> Void)?)
}

extension UIViewInput {
    func show(error: Error, handler: ((UIAlertAction) -> Void)? = nil) {
        guard let vc = self as? UIViewController else { return }
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: handler)
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
}

