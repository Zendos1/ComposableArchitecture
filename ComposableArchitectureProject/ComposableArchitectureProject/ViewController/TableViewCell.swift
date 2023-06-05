//
//  TableViewCell.swift
//  ComposableArchitectureProject
//
//  Created by Mark Jones on 05/06/2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let cellItemView = TableViewCellView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        selectionStyle = .none
        setupUI()
        setupConstraints()
    }

    func setupUI() {
        contentView.addSubview(cellItemView)
    }
    
    func setupConstraints() {
        cellItemView.topToSuperview(offset: 5)
        cellItemView.leftToSuperview(offset: 20)
        cellItemView.rightToSuperview(offset: -20)
        cellItemView.bottomToSuperview(offset: -5)
    }
    
    func configure(title: String? = "n/a") {
        cellItemView.configure(title: title)
    }
}

class TableViewCellView :UIView {
    
    let mainLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        setup()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setup() {
//        mainLabel.backgroundColor = .systemGray
        mainLabel.textColor = .blue
        addSubview(mainLabel)
    }
    
    func setupConstraints() {
        mainLabel.edgesToSuperview()
    }
    
    func configure(title :String?) {
        mainLabel.text = title
    }
}



