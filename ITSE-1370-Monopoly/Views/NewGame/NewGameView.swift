//
//  NewGameView.swift
//  ITSE-1370-Monopoly
//
//  Created by Mason Phillips on 6/21/21.
//

import UIKit
import Reusable

class NewGameView: UIViewController, BaseControllerType, StoryboardBased {
    var stepper: AppStepper!
    
    @IBAction func toGame() {
        stepper.steps.accept(AppStep.board)
    }
    
    @IBAction func goBack() {
        stepper.steps.accept(AppStep.landing)
    }
}
