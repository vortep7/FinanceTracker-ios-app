//
//  SettingView.swift
//  FinanceTracker
//
//  Created by Андрей Петров on 13.03.2024.
//

import UIKit

final class SettingView: UIView {
    
    var onActionForDeleteButton: (() -> Void)?
    var onExitButonAction: (() -> Void)?

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blackFirst")
        return imageView
    }()
        
    private let generalLabel: UILabel = {
        let label = UILabel()
        label.text = "Table view setting"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = UIColor.mainWhite
        return label
    }()
    
    private let settingButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .tabBarColor
        button.tintColor = .orange
        
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        
        button.layer.cornerRadius = 25
        button.setTitle("Delete all data", for: .normal)
        return button
    }()
    
    private let buttonExit:UIButton = {
        let button = UIButton()
        button.backgroundColor = .tabBarColor
        button.tintColor = .orange
        
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        
        button.layer.cornerRadius = 25
        button.setTitle("Exit", for: .normal)
        return button
    }()
    
    private let customButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .tabBarColor
        button.tintColor = .orange
        
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        
        button.layer.cornerRadius = 25
        button.setTitle("Custom table view", for: .normal)
        return button
    }()
    
    func constraintForCustomButton() {
        customButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 170),
            customButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -600),
            customButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            customButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80)
        ])
    }
    
    func constraintForExitButton() {
        buttonExit.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonExit.topAnchor.constraint(equalTo: self.topAnchor, constant: 320),
            buttonExit.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -440),
            buttonExit.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            buttonExit.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80)
        ])
    }
    
    func constraintForSettingButton() {
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 470),
            settingButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -290),
            settingButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            settingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80)
        ])
    }
    
    func constraintForImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
    func constraintForGeneralButton() {
        generalLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            generalLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            generalLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -685),
            generalLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            generalLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80)
        ])
    }
    
    func addSomeViews() {
        self.addSubview(imageView)
        self.addSubview(customButton)
        self.addSubview(generalLabel)
        self.addSubview(settingButton)
        self.addSubview(buttonExit)

    }
    
    func costraintsForAllViews() {
        constraintForImageView()
        constraintForCustomButton()
        constraintForGeneralButton()
        constraintForSettingButton()
        constraintForExitButton()
    }
    
    func addButtonAction() {
        settingButton.addTarget(self, action: #selector(actionSettingButton), for: .touchUpInside)
        buttonExit.addTarget(self, action: #selector(actionExitButton), for: .touchUpInside)
    }
    
    //MARK: - init func
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSomeViews()
        costraintsForAllViews()
        addButtonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingView {
    @objc func actionSettingButton() {
        onActionForDeleteButton?()
    }
    
    @objc func actionExitButton() {
        onExitButonAction?()
    }
}
