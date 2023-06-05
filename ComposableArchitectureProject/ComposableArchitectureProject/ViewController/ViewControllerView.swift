//
//  ViewControllerView.swift
//  ComposableArchitectureProject
//
//  Created by Mark Jones on 05/06/2023.
//

import UIKit
import TinyConstraints

class ViewControllerView :UIView {
    
    private let tableView = UITableView(frame: CGRect.zero, style: .grouped)
    let dataSource = ["Specialized Roubaix", "Coffee MAchine", "M2 MacBook Pro", "Audi TT"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        print("MJ View Setup")
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    private func setup() {
        setupTableView()
        setupConstraints()
    }
    
    private func setupTableView() {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: String(describing: TableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white
        addSubview(tableView)
        tableView.reloadData()
    }
    
    private func setupConstraints() {
        tableView.edgesToSuperview()
    }
}

extension ViewControllerView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewCell.self),
                                                    for: indexPath) as? TableViewCell,
           let title = dataSource[safe: indexPath.item] {
            cell.configure(title: title)
//            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewControllerView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let title = dataSource[safe: indexPath.item] else { return }
        print(title)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}
