//
//  CheckBox.swift
//  ComposableArchitectureProject
//
//  Created by Mark Jones on 08/06/2023.
//

import UIKit

typealias BoolActionBlock = (Bool) -> Void

protocol CheckBoxDelegate {
    func checkboxTapped()
}

class CheckBox :UIButton {

    var selectAction: BoolActionBlock?
    var delegate: CheckBoxDelegate?
    
    init(isSelected :Bool = true) {
        super.init(frame: .zero)
        self.isSelected = isSelected
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setImage(UIImage(named: "checkUnchecked"), for: .normal)
        setImage(UIImage(named: "checkChecked"), for: .selected)
        addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    func setupConstraints() {
        width(25.0)
        height(25.0)
    }
    
    @objc func tapped() {
//        isSelected.toggle()
//        selectAction?(isSelected)
        delegate?.checkboxTapped()
    }
}
