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
    
    // The ViewStoreOf is Generic over a Feature => ViewStoreOf<R: Reducer> = ViewStore<R.State, R.Action>
    private let store: ViewStoreOf<ThingsToBuyListFeature>
    private let viewControllerView = ViewControllerView()
    
    init(store: StoreOf<ThingsToBuyListFeature>) {
        self.store = ViewStore(store, observe: { $0 })
        viewControllerView.viewStore = self.store
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(viewControllerView)
        title = "ComposableArcitecture"
        setupConstraints()
    }
    
    private func setupConstraints() {
        viewControllerView.edgesToSuperview()
    }
    
}


