//
//  TipsCollectionViewCell.swift
//  Second app - total bill
//
//  Created by Home on 08.08.2023.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell {
    
    let procentLabel: UILabel = {
        let label = UILabel()
        label.text = "10%"
        label.textColor = .black
        label.textAlignment = .center
//        label.font = UIFont(name: "Avenir Next", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 3
                layer.borderColor = #colorLiteral(red: 0.6390794516, green: 0.2492685616, blue: 0.6254444718, alpha: 1)
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        procentLabel.font = UIFont(name: "Avenir Next", size: frame.height / 3.4)
    }
    
    // MARK: - методы
    
    func setupView() {
        backgroundColor = #colorLiteral(red: 0.9300000072, green: 0.9300000072, blue: 0.9300000072, alpha: 1)
        layer.cornerRadius = 10
        
        addSubview(procentLabel)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            procentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            procentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            procentLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
