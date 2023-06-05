//
//  ViewController.swift
//  ComposableArchitectureProject
//
//  Created by Mark Jones on 05/06/2023.
//

import UIKit
import ComposableArchitecture

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
        view.backgroundColor = .cyan
    }
}

extension ViewController {
    
}

