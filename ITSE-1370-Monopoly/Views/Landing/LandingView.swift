//
//  LandingView.swift
//  ITSE-1370-Monopoly
//
//  Created by Mason Phillips on 6/21/21.
//

import UIKit
import Reusable

class LandingView: UIViewController, BaseControllerType, StoryboardBased {
    var stepper: AppStepper!
    
    @IBAction func moveToNewGame() {
        stepper.steps.accept(AppStep.newGame)
    }
}
