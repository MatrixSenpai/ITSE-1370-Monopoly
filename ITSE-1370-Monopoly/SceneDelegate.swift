//
//  SceneDelegate.swift
//  ITSE-1370-Monopoly
//
//  Created by Mason Phillips on 6/16/21.
//

import UIKit
import RxCocoa
import RxFlow
import RxSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let coordinator = FlowCoordinator()
    let logger = Printer()
    
    let bag = DisposeBag()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        
        coordinator.rx.willNavigate.subscribe(onNext: { _, arg in
            self.logger.info("Will Move To: \(arg)")
        }).disposed(by: bag)
        coordinator.rx.didNavigate.subscribe(onNext: { _, arg in
            self.logger.info("Did Move To: \(arg)")
        }).disposed(by: bag)
        
        let flow = AppFlow()
        Flows.use(flow, when: .created) { [window] root in
            window?.rootViewController = root
            window?.makeKeyAndVisible()
        }
        coordinator.coordinate(flow: flow, with: flow.stepper, allowStepWhenDismissed: false)
    }
}

