//
//  ViewController.swift
//  Second app - total bill
//
//  Created by Home on 08.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Свойства
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Bill"
        label.textColor = .black
//        label.font = UIFont(name: "Avenir Next Bold", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter the invoice amount and click \"Calculate\""
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 15)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
//        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.6390794516, green: 0.2492685616, blue: 0.6254444718, alpha: 1)
//        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 20)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let totalBillView = TotalBillView()
    let personsView = PersonsView()
    let tipsView = TipsView()
    
    // MARK: - Методы
    
    override func viewDidLoad() { // Метод, с которого начинается загрузка
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        addTap()
    }
    
    func setupViews() { // настройка объектов
        view.backgroundColor = #colorLiteral(red: 0.9813231826, green: 0.9813460708, blue: 0.9813337922, alpha: 1)
        
        view.addSubview(titleLabel)
        titleLabel.font = UIFont(name: "Avenir Next Bold", size: view.frame.height * 0.046)
        
        view.addSubview(logoImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(totalBillView)
        view.addSubview(personsView)
        view.addSubview(tipsView)
        view.addSubview(calculateButton)
        calculateButton.titleLabel?.font = UIFont(name: "Futura", size: view.frame.height / 44)
        
    }
    
    @objc func calculateButtonTapped() {
        guard let totalBill = totalBillView.summTextField.text,
              let totalBillInt = Int(totalBill) else {
                  descriptionLabel.text = "Enter total bill!"
                  descriptionLabel.textColor = .red
                  return
              }
        
        let summ = totalBillInt + totalBillInt * tipsView.tipsCount / 100
        let persons = personsView.counter
        
        if persons < 2 {
            descriptionLabel.text = "Enter persons count!"
            descriptionLabel.textColor = .red
        } else {
            let result = summ / persons
            descriptionLabel.text = "\(result) per person"
            descriptionLabel.textColor = .black
        }
    }
    
    func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Расширения

extension MainViewController {
    
    func setConstraints() { // Расположение объектов
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            logoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            
            descriptionLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            totalBillView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            totalBillView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            totalBillView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            totalBillView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),
            
            personsView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: 5),
            personsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),
            
            tipsView.topAnchor.constraint(equalTo: personsView.bottomAnchor, constant: 10),
            tipsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tipsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tipsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),
            
            calculateButton.topAnchor.constraint(equalTo: tipsView.bottomAnchor, constant: 15),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06)
        ])
    }
}
