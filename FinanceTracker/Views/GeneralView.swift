
import Foundation
import UIKit

class GeneralView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "man")
        return imageView
    }()
    
    private let bigLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.text = "Add purchase"
        label.textColor = .mainWhite
        return label
    }()
    
    private let firstTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Sum"
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    private let secondtTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Reason"
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    let picker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .homeViewColor
        picker.layer.cornerRadius = 12
        return picker
    }()
    
    private let toolBar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.backgroundColor = UIColor.mainWhite
        return toolbar
    }()
    
    private let toolbarLabel: UILabel = {
        let label = UILabel()
        label.text = "Purchases and expenses"
        label.textColor = .black
        label.font = UIFont(name: "abosanova", size: 20)
        label.textAlignment = .center
        return label
    }()
    
    func costraintsForPicker() {
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            picker.topAnchor.constraint(equalTo: self.topAnchor, constant: 500),
            picker.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150),
            picker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            picker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70)
        ])
    }
    
    func costraintsForBigLabel() {
        bigLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bigLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            bigLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -700),
            bigLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            bigLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70)
        ])
    }
    
    func costraintsForToolBarLabel() {
        toolbarLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            toolbarLabel.centerXAnchor.constraint(equalTo: toolBar.centerXAnchor),
            toolbarLabel.centerYAnchor.constraint(equalTo: toolBar.centerYAnchor, constant: 30)
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
    
    func constraintForToolBar() {
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toolBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            toolBar.topAnchor.constraint(equalTo: self.topAnchor),
            toolBar.heightAnchor.constraint(equalToConstant: 95)
        ])
    }
    
    //MARK: - add views elements
    func addSomeViews() {
        self.addSubview(imageView)
        self.addSubview(toolBar)
        self.addSubview(toolbarLabel)
        self.addSubview(picker)
        self.addSubview(bigLabel)
    }
    
    func costraintsForAllViews() {
        constraintForImageView()
        constraintForToolBar()
        costraintsForToolBarLabel()
        costraintsForPicker()
        costraintsForBigLabel()
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
