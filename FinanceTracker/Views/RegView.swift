//
//  RegView.swift
//  FinanceTracker
//
//  Created by Андрей Петров on 08.03.2024.
//

import UIKit

final class RegView: UIView {
    //MARK: - clousers

    var onFirstActionForBotton: (() -> Void)?
    var onSecondActionForBotton: (() -> Void)?
    
    
    //MARK: - creating UI elements
    let firstTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowOpacity = 0.4
        textField.layer.shadowRadius = 4
        textField.layer.cornerRadius = 15
        textField.placeholder = " Email"
        return textField
    }()
    
    let alert: UIAlertController = {
        let alert = UIAlertController(title: "Error", message: "Invalid username or password", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alert.addAction(okAction)
        return alert
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "secondKaif")
        return imageView
    }()
    
    private let buttonFirst:UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.tintColor = .orange
        button.layer.cornerRadius = 25
        button.setTitle("Do you already have an account?", for: .normal)
        return button
    }()
    
    private let buttonSecond:UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.tintColor = .orange
        button.layer.cornerRadius = 25
        button.setTitle("To perform", for: .normal)
        return button
    }()
    
    private let firstLabel:UILabel = {
        let label = UILabel()
        label.text = "Registration"
        label.textColor = .white
        label.font = UIFont(name: "abosanova", size: 30)
        return label
    }()
    
    private let infoLabel:UILabel = {
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
        textField.placeholder = " Password"
        return textField
    }()
    
    //MARK: - consctraints for UI
    func constraintForFirstButton() {
        buttonFirst.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonFirst.topAnchor.constraint(equalTo: self.topAnchor, constant: 500),
            buttonFirst.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -300),
            buttonFirst.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            buttonFirst.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
        ])
    }
    
    func constraintForFInfoLabel() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
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
            buttonSecond.topAnchor.constraint(equalTo: self.topAnchor, constant: 370),
            buttonSecond.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -430),
            buttonSecond.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            buttonSecond.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
        ])
    }
    
    func constraintForTextFirst() {
        firstTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 170),
            firstTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -670),
            firstTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            firstTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
        ])
    }
    
    func constraintForFirstLabel() {
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            firstLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -670),
            firstLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            firstLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func constraintForTextSecond() {
        secondTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 270),
            secondTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -570),
            secondTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            secondTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
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

//MARK: - action for buttons and change text
extension RegView {
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
}
