//
//  ComposableFeature.swift
//  ComposableArchitectureProject
//
//  Created by Mark Jones on 05/06/2023.
//

import Foundation
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
