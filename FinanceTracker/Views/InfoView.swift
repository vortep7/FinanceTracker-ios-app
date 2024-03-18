//
//  InfoView.swift
//  FinanceTracker
//
//  Created by Андрей Петров on 18.03.2024.
//

import UIKit

class InfoView: UIView {
    
    var onFirstActionButon: (() -> Void)?
    var onSecondActionButon: (() -> Void)?

    //MARK: - create UI elements
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cute")
        return imageView
    }()
    
    private let buttonFirst:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "playNew"), for: .normal)
        return button
    }()
    
    private let buttonSecond:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "pause.circle"), for: .normal)
        
        return button
    }()
    
    func constraintForImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
    func constraintForFirstButton() {
        buttonFirst.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonFirst.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            buttonFirst.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -500),
            buttonFirst.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            buttonFirst.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    

    
    func createTasksForButton() {
        buttonFirst.addTarget(self, action: #selector(actionFirstButton), for: .touchUpInside)
        buttonSecond.addTarget(self, action: #selector(actionSecondButton), for: .touchUpInside)
    }
    
    func addSomeViews() {
        self.addSubview(imageView)
        self.addSubview(buttonFirst)
    }
    
    func costraintsForAllViews() {
        constraintForImageView()
        constraintForFirstButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSomeViews()
        costraintsForAllViews()
        createTasksForButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension InfoView {
    @objc func actionFirstButton() {
        onFirstActionButon?()
    }
    
    @objc func actionSecondButton() {
        onSecondActionButon?()
    }
}
