//
//  TableViewCell.swift
//  ComposableArchitectureProject
//
//  Created by Mark Jones on 05/06/2023.
//

import UIKit

protocol TableViewCellDelegate {
    func thingsToBuyPurchaseStatusToggled(at index: Int)
    func thingsToBuyTextChange(at index: Int, text: String)
}

class TableViewCell: UITableViewCell {
    
    let cellItemView = TableViewCellView()
    var index: Int?
    var delegate: TableViewCellDelegate?
    
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
    
    func configure(title: String? = "n/a", isPurchased: Bool, index: Int) {
        cellItemView.configure(title: title, isSelected: isPurchased)
        cellItemView.checkBox.delegate = self
        cellItemView.textField.delegate = self
        self.index = index
    }
}

extension TableViewCell: CheckBoxDelegate {
    func checkboxTapped() {
        guard let index else { return }
        print("TVCell (as CheckBoxDelegate) relaying tap to VCView (as TableViewCellDelegate)")
        delegate?.thingsToBuyPurchaseStatusToggled(at: index)
    }
}

protocol CheckBoxDelegateProtocol {
    func checkboxTapped()
}

extension TableViewCell: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) { }
    func textFieldDidChangeSelection(_ textField: UITextField) { }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text, let index else { return }
        print("TextField Finished Editing - relay text update to VCView (as TableViewCellDelegate)")
        delegate?.thingsToBuyTextChange(at: index, text: text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // TextField Should Return on return key
        textField.resignFirstResponder()
        return true
    }
}

class TableViewCellView :UIView {
    
    let textField = UITextField()
    let checkBox = CheckBox()
    
    init() {
        super.init(frame: .zero)
        setup()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setup() {
        textField.textColor = .blue
        addSubview(textField)
        addSubview(checkBox)
    }
    
    func setupConstraints() {
        checkBox.topToSuperview()
        checkBox.bottomToSuperview()
        checkBox.rightToSuperview()
        textField.topToSuperview()
        textField.bottomToSuperview()
        textField.leftToSuperview()
        textField.rightToLeft(of: checkBox)
    }
    
    func configure(title :String?, isSelected: Bool) {
        textField.text = title
        checkBox.isSelected = isSelected
    }
}

