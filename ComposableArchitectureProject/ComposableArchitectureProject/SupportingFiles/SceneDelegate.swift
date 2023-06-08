//
//  SceneDelegate.swift
//  ComposableArchitectureProject
//
//  Created by Mark Jones on 05/06/2023.
//

import UIKit
import ComposableArchitecture

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let store = StoreOf<ThingsToBuyListFeature>(
        initialState: .init(thingsToBuy:
                                [ThingsToBuyViewModel(description: "Audi TT 2.0 TDI", isPurchased: false),
                                 ThingsToBuyViewModel(description: "Apple Vision Pro", isPurchased: false),
                                 ThingsToBuyViewModel(description: "Warhammer 40k Elite Edition Starter Set", isPurchased: false),
                                 ThingsToBuyViewModel(description: "Specialized Roubaix", isPurchased: false),
                                 ThingsToBuyViewModel(description: "Coffee MAchine", isPurchased: false),
                                 ThingsToBuyViewModel(description: "M2 MacBook Pro", isPurchased: false)]),
        reducer: ThingsToBuyListFeature.init)
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
       
        let viewController = ViewController(store: store)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

}

