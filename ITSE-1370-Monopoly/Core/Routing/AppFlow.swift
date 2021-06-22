//
//  AppFlow.swift
//  ITSE-1370-Monopoly
//
//  Created by Mason Phillips on 6/21/21.
//

import UIKit
import RxCocoa
import RxFlow
import RxSwift

class AppFlow: Flow {
    var root: Presentable { rootViewController }
    
    let stepper = AppStepper()
    
    private let rootViewController = UINavigationController()
    
    init() {
        rootViewController.isNavigationBarHidden = true
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        
        switch step {
        case .landing: return toLanding()
        case .newGame: return toNewGame()
        case .board  : return toGame()
        }
    }
    
    private func toLanding() -> FlowContributors {
        let controller = LandingView.instantiate(stepper)
        rootViewController.setViewControllers([controller], animated: true)
        
        return .none
    }
    private func toNewGame() -> FlowContributors {
        let controller = NewGameView.instantiate(stepper)
        rootViewController.pushViewController(controller, animated: true)
        
        return .none
    }
    private func toGame() -> FlowContributors {
        let controller = GameBoardView.instantiate(stepper)
        rootViewController.pushViewController(controller, animated: true)
        
        return .none
    }
}

class AppStepper: Stepper {
    let steps = PublishRelay<Step>()
    let initialStep = AppStep.landing
    
    func readyToEmitSteps() {
        steps.accept(initialStep)
    }
}
