//
//  RootViewController.swift
//  Weather
//
//  Created by Tracker on 08.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import UIKit

class RootViewController: UIViewController {
    var output: RootViewOutput!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorButton: UIButton!
    @IBOutlet weak var errorTextLabel: UILabel!
    var errorAction: (()->Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLoading()
        output.viewIsReady()
    }
    
    @IBAction func openSettings(_ sender: Any) {
        errorAction()
    }
    
    func openSettings() {
        guard let url = try? UIApplication.openSettingsURLString.asURL() else { return }
        UIApplication.shared.open(url)
    }
    
    func tryAgain() {
        startLoading()
        output.requestLocation()
    }
    
    func startLoading() {
        errorButton.isHidden = true
        errorTextLabel.isHidden = true
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
        errorButton.isHidden = false
        errorTextLabel.isHidden = false
    }
}

extension RootViewController: RootViewInput {
    func openApp() {
        performSegue(withIdentifier: "openApp", sender: nil)
    }
    
    func showError(type: LocationErrorType) {
        stopLoading()
        switch type {
        case .accessDenied:
            errorTextLabel.text = "Location required. Change permission in settings"
            errorButton.setTitle("go to settings", for: .normal)
            errorAction = openSettings
        case .requestError:
            errorButton.setTitle("try again", for: .normal)
            errorTextLabel.text = "Something went wrong. Try again."
            errorAction = tryAgain
        }
    }
}
