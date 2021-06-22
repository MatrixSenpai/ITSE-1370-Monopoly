//
//  GameBoardView.swift
//  ITSE-1370-Monopoly
//
//  Created by Mason Phillips on 6/22/21.
//

import UIKit
import Reusable

class GameBoardView: UIViewController, StoryboardBased, BaseControllerType {
    var stepper: AppStepper!
    
    @IBAction func goBack() {
        stepper.steps.accept(AppStep.landing)
    }
}
