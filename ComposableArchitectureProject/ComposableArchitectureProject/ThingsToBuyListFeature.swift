//
//  ThingsToBuyListFeature.swift
//  ComposableArchitectureProject
//
//  Created by Mark Jones on 05/06/2023.
//

import Foundation
import ComposableArchitecture

struct ThingsToBuyListFeature: Reducer {
    
    // MARK: Feature - Defining the core domain of the App OR Feature
    // the domain and the reducer model our business logic for the App OR Feature
    
    struct State: Equatable {
        var thingsToBuy: [ThingsToBuyViewModel] = []
    }
    
    enum Action {
        case thingsToBuyCheckBoxTapped(index: Int)
        case thingsToBuyDescriptionChanged(index: Int, text: String)
    }
    
    struct AppEnvironment {  // dependencies
        
    }
    
    // the appReducer is Generic over AppState, AppAction, AppEnvironment
    // reducer is responsible for all the business logic of hte application OR feature
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        
        case .thingsToBuyCheckBoxTapped(index: let index):
            print("checkBoxTapped in REDUCER - \(index)")
            state.thingsToBuy[index].isPurchased.toggle()
            return .none
        
        case .thingsToBuyDescriptionChanged(index: let index, text: let text):
            print("descriptionTapped in REDUCER - \(index) - \(text)")
            state.thingsToBuy[index].description = text
            return .none
        }
    }
}

public struct ThingsToBuyViewModel: Equatable {
    var description = ""
    var isPurchased = false
    //        let id = UUID
    
    public init(description: String, isPurchased: Bool) {
      self.description = description
      self.isPurchased = isPurchased
    }
}
