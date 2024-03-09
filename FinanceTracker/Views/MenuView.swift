
import UIKit
import Foundation

final class MenuView: UIView {
    
    var onButtonAction: (() -> Void)?
    
    //MARK: - creating UI elements
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LogoRobo")
        return imageView
    }()
    
    let buttonExit:UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.tintColor = .orange
        button.layer.cornerRadius = 25
        button.setTitle("Выйти", for: .normal)
        return button
    }()
    
    private let firstLabel: UILabel = {
        let label = UILabel()
        label.text = Words.firstLabel.rawValue
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor.magenta
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
    
    func constraintForFirstLabel() {
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            firstLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -550),
            firstLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            firstLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    
    func constraintForExitButton() {
        buttonExit.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonExit.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            buttonExit.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -650),
            buttonExit.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            buttonExit.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    func addButtonAction() {
        buttonExit.addTarget(self, action: #selector(exitButtonAction), for: .touchUpInside)
        
    }
    
    @objc func exitButtonAction() {
        onButtonAction?()
    }
    
    func costraintsForAllViews() {
        constraintForImageView()
        constraintForFirstLabel()
        constraintForExitButton()
    }
    
    
    //MARK: - add views elements
    func addSomeViews() {
        self.addSubview(imageView)
        self.addSubview(firstLabel)
        self.addSubview(buttonExit)
    }
    
    //MARK: - init func
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSomeViews()
        addButtonAction()
        costraintsForAllViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Enum for words
enum Words: String {
    case firstLabel = "Hi"
}
