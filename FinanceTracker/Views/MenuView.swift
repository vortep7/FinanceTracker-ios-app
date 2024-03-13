
import UIKit
import Foundation

final class MenuView: UIView {
    
    var onButtonExitAction: (() -> Void)?
    var onSwitchAction: (() -> Void)?
    var onButtonGoAction: (() -> Void)?
    var onButtonInfoAction: (() -> Void)?


    //MARK: - creating UI elements
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blackFirst")
        return imageView
    }()
    
    private let buttonExit:UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.tintColor = .orange
        
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        
        button.layer.cornerRadius = 25
        button.setTitle("Exit", for: .normal)
        return button
    }()
    
    let moodSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.isOn = true
        uiSwitch.onTintColor = .white
        uiSwitch.backgroundColor = .darkGray
        uiSwitch.layer.cornerRadius = 16
        uiSwitch.thumbTintColor = . systemYellow
        uiSwitch.frame = CGRect(x: 300, y: 130, width: 70, height: 40)
        return uiSwitch
    }()
    
    private let firstLabel: UILabel = {
        let label = UILabel()
        label.text = Words.firstLabel.rawValue
        label.font = UIFont.systemFont(ofSize: 38)
        label.textColor = UIColor.white
        return label
    }()
    
    private let goButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.tintColor = .orange
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5

        button.layer.cornerRadius = 25
        button.setTitle("Continue", for: .normal)
        return button
    }()
    
    private let infoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.tintColor = .orange
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5

        button.layer.cornerRadius = 25
        button.setTitle("More info", for: .normal)
        return button
    }()
        
    private let moodLabel: UILabel = {
        let label = UILabel()
        label.text = "Mood"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.white
        return label
    }()
    
    //MARK: - creating cosntraints for UI elements
    func constraintForImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
    func constraintForMoodLabel() {
        moodLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moodLabel.bottomAnchor.constraint(equalTo: moodSwitch.bottomAnchor, constant: 25),
            moodLabel.leadingAnchor.constraint(equalTo: moodSwitch.leadingAnchor, constant: 0),
            moodLabel.trailingAnchor.constraint(equalTo: moodSwitch.trailingAnchor, constant: 0)
        ])
    }
    
    func constraintForFirstLabel() {
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 300),
            firstLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -300),
            firstLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            firstLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        ])
    }
    
    
    func constraintForExitButton() {
        buttonExit.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonExit.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            buttonExit.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -720),
            buttonExit.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            buttonExit.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -280)
        ])
    }
    
    func constraintForGoButton() {
        goButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -175),
            goButton.bottomAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 60),
            goButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            goButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50)
        ])
    }
    
    func constraintForInfoButton() {
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            infoButton.bottomAnchor.constraint(equalTo: goButton.bottomAnchor, constant: 30),
            infoButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            infoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50)
        ])
    }
    
    func addLabelOnView() {
        self.addSubview(firstLabel)
        firstLabel.alpha = 0
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseInOut, animations: {
                    self.firstLabel.alpha = 1
                }, completion: nil)
    }
    
    func addButtonAction() {
        buttonExit.addTarget(self, action: #selector(exitButtonAction), for: .touchUpInside)
        goButton.addTarget(self, action: #selector(goButtonAction), for: .touchUpInside)
        infoButton.addTarget(self, action: #selector(infiButtonAction), for: .touchUpInside)
    }
    
    func addSwitchAction() {
        moodSwitch.addTarget(self, action: #selector(moodSwitchAction), for: .valueChanged)
    }
    
    
    func costraintsForAllViews() {
        constraintForImageView()
        constraintForFirstLabel()
        constraintForExitButton()
        constraintForMoodLabel()
        constraintForGoButton()
        constraintForInfoButton()
    }
    
    func lightImage() {
        imageView.image = UIImage(named: "blueFirst")
        firstLabel.textColor = .systemIndigo
        moodLabel.textColor = .systemIndigo
    }
    
    func blackImage() {
        imageView.image = UIImage(named: "blackFirst")
        firstLabel.textColor = .white
        moodLabel.textColor = .white
    }
    
    
    //MARK: - add views elements
    func addSomeViews() {
        self.addSubview(imageView)
        addLabelOnView()
        self.addSubview(buttonExit)
        self.addSubview(moodSwitch)
        self.addSubview(moodLabel)
        self.addSubview(goButton)
        self.addSubview(infoButton)
    }
    
    //MARK: - init func
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSomeViews()
        addButtonAction()
        addSwitchAction()
        costraintsForAllViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Enum for words
enum Words: String {
    case firstLabel = "Welcome, user!"
    case firstImage = "blackFirst"
    case secondImage = ""
}

//MARK: - objc action func
extension MenuView {
    @objc func exitButtonAction() {
        onButtonExitAction?()
    }
    
    @objc func moodSwitchAction() {
        onSwitchAction?()
    }
    
    @objc func goButtonAction() {
        onButtonGoAction?()
    }
    
    @objc func infiButtonAction() {
        onButtonInfoAction?()
    }
}
