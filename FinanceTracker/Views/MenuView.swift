
import UIKit
import Foundation

final class MenuView: UIView {
    
    //MARK: - creating UI elements
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LogoRobo")
        return imageView
    }()
    
    private let firstButton: UIButton = {
        let button = UIButton()
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
    
    func constraintForFirstButton() {
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 500),
            firstButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            firstButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            firstButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    func costraintsForAllViews() {
        constraintForImageView()
        constraintForFirstLabel()
        constraintForFirstButton()
    }
    
    
    //MARK: - add views elements
    func addSomeViews() {
        self.addSubview(imageView)
        self.addSubview(firstLabel)
        self.addSubview(firstButton)
    }
    
    //MARK: - init func
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSomeViews()
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
