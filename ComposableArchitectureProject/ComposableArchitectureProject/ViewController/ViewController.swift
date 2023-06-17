//
//  ViewController.swift
//  ComposableArchitectureProject
//
//  Created by Mark Jones on 05/06/2023.
//

import UIKit
import ComposableArchitecture
import Combine

// MARK: ViewController

class ViewController: UIViewController {
    
    // The ViewStoreOf is Generic over a Feature => ViewStoreOf<R: Reducer> = ViewStore<R.State, R.Action>
    private var store: ViewStoreOf<ThingsToBuyListFeature>
    private let viewControllerView = ViewControllerView()
    private var cancellables = Set<AnyCancellable>()
    
    init(store: StoreOf<ThingsToBuyListFeature>) {
        self.store = ViewStore(store, observe: { $0 })
        viewControllerView.viewStore = self.store
        super.init(nibName: nil, bundle: nil)
        viewControllerView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(viewControllerView)
        title = "ComposableArchitecture"
        setupConstraints()
        setupSubscriptions()
    }
    
    private func setupConstraints() {
        viewControllerView.edgesToSuperview()
    }
    
    func setupSubscriptions() {
        store.publisher.thingsToBuy
            .dropFirst()
            .removeDuplicates()
            .sink(receiveValue: { ThingsToBuyViewModel in
                print("MJ MJ MJ MJ - \(ThingsToBuyViewModel.description)")
            }).store(in: &cancellables)
    }
    
}

extension ViewController: TableViewCellDelegate {
    
    func thingsToBuyPurchaseStatusToggled(at index: Int) {
        store.send(.thingsToBuyCheckBoxTapped(index: index))
        print("VC is Toggling isPurchased at index \(index)")
    }
}


