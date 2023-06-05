//
//  ViewController.swift
//  ComposableArchitectureProject
//
//  Created by Mark Jones on 05/06/2023.
//

import UIKit
import ComposableArchitecture

// MARK: Feature - Defining the core domain of the App OR Feature
// the domain and the reducer model our business logic for the App OR feature

struct AppState {
    
}

enum AppAction {
    
}

struct AppEnvironment {  // dependencies
    
}

// the appReducer is Generic over AppState, AppAction, AppEnvironment
// reducer is responsible for all hte business logic of hte application OR feature
let appReducer = AnyReducer<AppState, AppAction, AppEnvironment> { state, action, environment in
    switch action {
    default:
        print("MJ Here")
    }
}

// MARK: ViewController

class ViewController: UIViewController {
    // Store is generic over AppState & AppAction
    var store: Store<AppState, AppAction>
   
    init(store: Store<AppState, AppAction>) {
        self.store = store
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

