//
//  RegView.swift
//  FinanceTracker
//
//  Created by Андрей Петров on 08.03.2024.
//

import UIKit

final class RegView: UIView {
    
    var onFirstActionForBotton: (() -> Void)?
    var onSecondActionForBotton: (() -> Void)?

    let firstTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowOpacity = 0.4
        textField.layer.shadowRadius = 4
        textField.layer.cornerRadius = 15
        textField.placeholder = "Email"
        return textField
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "secondKaif")
        return imageView
    }()
    
    let buttonFirst:UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.tintColor = .orange
        button.layer.cornerRadius = 25
        button.setTitle("Do you already have an account?", for: .normal)
        return button
    }()
    
    let buttonSecond:UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.tintColor = .orange
        button.layer.cornerRadius = 25
        button.setTitle("To perform", for: .normal)
        return button
    }()
    
    let firstLabel:UILabel = {
        let label = UILabel()
        label.text = "Registration"
        label.textColor = .white
        label.font = UIFont(name: "abosanova", size: 30)
        return label
    }()
    
    let infoLabel:UILabel = {
        let label = UILabel()
        label.text = "Developed by Vortep"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let secondTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 15
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowOpacity = 0.4
        textField.layer.shadowRadius = 4
        textField.textColor = .black
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        return textField
    }()
    
    func constraintForFirstButton() {
        buttonFirst.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonFirst.topAnchor.constraint(equalTo: self.topAnchor, constant: 460),
            buttonFirst.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -300),
            buttonFirst.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            buttonFirst.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
        ])
    }
    
    func constraintForFInfoLabel() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            infoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 460),
            infoLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -80),
            infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50)
        ])
    }
    
    func constraintForImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
        ])
    }
    
    func constraintForSecondButton() {
        buttonSecond.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonSecond.topAnchor.constraint(equalTo: self.topAnchor, constant: 350),
            buttonSecond.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -450),
            buttonSecond.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            buttonSecond.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
        ])
    }
    
    func constraintForTextFirst() {
        firstTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            firstTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -650),
            firstTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            firstTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
        ])
    }
    
    func constraintForFirstLabel() {
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            firstLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -670),
            firstLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            firstLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70),
        ])
    }
    
    func constraintForTextSecond() {
        secondTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 250),
            secondTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -550),
            secondTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            secondTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
        ])
    }
    
    func createConstraints() {
        constraintForTextFirst()
        constraintForTextSecond()
        constraintForFirstLabel()
        constraintForFirstButton()
        constraintForSecondButton()
        constraintForImageView()
        constraintForFInfoLabel()
    }
    
    func addViews() {
        self.addSubview(imageView)
        self.addSubview(firstTextField)
        self.addSubview(secondTextField)
        self.addSubview(firstLabel)
        self.addSubview(buttonFirst)
        self.addSubview(buttonSecond)
        self.addSubview(infoLabel)
    }
    
    func createTasksForButton() {
        buttonFirst.addTarget(self, action: #selector(actionFirstButton), for: .touchUpInside)
        buttonSecond.addTarget(self, action: #selector(actionSecondButton), for: .touchUpInside)
    }
    
    @objc func actionFirstButton() {
        onFirstActionForBotton?()
    }
    
    @objc func actionSecondButton() {
        onSecondActionForBotton?()
    }
    
    public func changeText(_ result: Bool) {
        switch result{
        case true: firstLabel.text = "Registration"
        case false: firstLabel.text = "Entrance"
        }
    }
    
    public func changeTextForButton(_ result: Bool) {
        switch result{
        case true: buttonFirst.setTitle("Do you already have an account?", for: .normal)
        case false: buttonFirst.setTitle("Register", for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        createConstraints()
        createTasksForButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
