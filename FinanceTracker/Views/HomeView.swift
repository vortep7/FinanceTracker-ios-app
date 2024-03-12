
import UIKit

class HomeView: UIView {
    
    var onActionForExitButton: (() -> Void)?
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fonn")
        return imageView
    }()
    
    private let generalLabel: UILabel = {
        let label = UILabel()
        label.text = "My Account"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = UIColor.mainWhite
        return label
    }()
    
    private let settingButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .homeViewColor
        button.tintColor = .orange
        
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        
        button.layer.cornerRadius = 25
        button.setTitle("Settings", for: .normal)
        return button
    }()
    
    private let buttonExit:UIButton = {
        let button = UIButton()
        button.backgroundColor = .homeViewColor
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
        button.backgroundColor = .homeViewColor
        button.tintColor = .orange
        
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        
        button.layer.cornerRadius = 25
        button.setTitle("Custom View", for: .normal)
        return button
    }()
    
    func constraintForCustomButton() {
        customButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 170),
            customButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -560),
            customButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            customButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80)
        ])
    }
    
    func constraintForExitButton() {
        buttonExit.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonExit.topAnchor.constraint(equalTo: self.topAnchor, constant: 320),
            buttonExit.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -400),
            buttonExit.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            buttonExit.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80)
        ])
    }
    
    func constraintForSettingButton() {
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 470),
            settingButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -250),
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
            generalLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            generalLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70)
        ])
    }
    
    func addSomeViews() {
        self.addSubview(imageView)
        self.addSubview(generalLabel)
        self.addSubview(buttonExit)
        self.addSubview(settingButton)
        self.addSubview(customButton)
    }
    
    func addButtonAction() {
        buttonExit.addTarget(self, action: #selector(actionExitButton), for: .touchUpInside)
    }
    
    func costraintsForAllViews() {
        constraintForImageView()
        constraintForGeneralButton()
        constraintForCustomButton()
        constraintForSettingButton()
        constraintForExitButton()
    }
    
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

extension HomeView {
    @objc func actionExitButton() {
        onActionForExitButton?()
    }
}
