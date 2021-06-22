//
//  BaseController.swift
//  ITSE-1370-Monopoly
//
//  Created by Mason Phillips on 6/21/21.
//

import UIKit
import Reusable

protocol BaseControllerType: UIViewController {
    var stepper: AppStepper! { get set }
}

extension StoryboardBased where Self: BaseControllerType {
    static func instantiate(_ stepper: AppStepper) -> Self {
        let controller = Self.instantiate()
        controller.stepper = stepper
        
        return controller
    }
}
