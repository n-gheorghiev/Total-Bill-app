//
//  TotalBillView.swift
//  Second app - total bill
//
//  Created by Home on 08.08.2023.
//

import UIKit

class TotalBillView: UIView {
    
    // MARK: - Свойства
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Bill"
        label.textColor = #colorLiteral(red: 0.2454476058, green: 0.2894899547, blue: 0.3496131301, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let summTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.9300000072, green: 0.9300000072, blue: 0.9300000072, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.tintColor = #colorLiteral(red: 0.6390794516, green: 0.2492685616, blue: 0.6254444718, alpha: 1)
        textField.font = UIFont(name: "Avenir Next", size: 48)
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.font = UIFont(name: "Avenir Next", size: frame.width / 26.7)
        summTextField.font = UIFont(name: "Avenir Next", size: frame.height / 2.6)
    }
    
    // MARK: - Методы
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(summTextField)
    }
    
    func setContraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            summTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            summTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            summTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            summTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            
        
        ])
    }
}
