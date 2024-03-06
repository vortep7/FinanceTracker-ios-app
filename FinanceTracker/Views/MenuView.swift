
import UIKit
import Foundation

final class MenuView: UIView {
    
    //MARK: - creating UI elements
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let firatLabel: UILabel = {
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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -550),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    func costraintsForAllViews() {
        constraintForImageView()
        constraintForFirstLabel()
    }
    
    
    //MARK: - add views elements
    func addSomeViews() {
        self.addSubview(imageView)
        self.addSubview(firatLabel)
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
