
import Foundation
import UIKit

class GeneralView: UIView {
    
    var onAddButtonAction: (() -> Void)?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "compt")
        return imageView
    }()
    
    private let bigLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.text = "Add purchase"
        label.textColor = .mainWhite
        return label
    }()
    
    private let pickerLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Types of purchases"
        label.textColor = .pickerLabel
        return label
    }()
    
    let firstTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "  Sum"
        textField.textColor = .black
        textField.backgroundColor = .lightGray
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    let secondtTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "  Reason"
        textField.textColor = .black
        textField.backgroundColor = .lightGray
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    let picker: UIPickerView = {
        let picker = UIPickerView()
        picker.tintColor = .pickerLabel
        picker.backgroundColor = .pickerColor
        picker.largeContentTitle = "Kinds of purches"
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
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .tabBarColor
        button.tintColor = .orange
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.setTitle("+", for: .normal) // Устанавливаем символ "+" как текст кнопки
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40) // Устанавливаем размер шрифта
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 45 // Делаем кнопку круглой
        button.clipsToBounds = true
        return button
    }()
    
    func costraintsForAddButton() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 660),
            addButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -140),
            addButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 155),
            addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -155)
        ])
    }
    
    func costraintsForFirstTextField() {
        firstTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 190),
            firstTextField.bottomAnchor.constraint(equalTo: secondtTextField.topAnchor, constant: -20),
            firstTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            firstTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    func costraintsForSecondTextField() {
        secondtTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondtTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 270),
            secondtTextField.bottomAnchor.constraint(equalTo: pickerLabel.topAnchor, constant: -20),
            secondtTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            secondtTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    func costraintsForPickerLabel() {
        pickerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pickerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 350),
            pickerLabel.bottomAnchor.constraint(equalTo: picker.topAnchor, constant: -20),
            pickerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            pickerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70)
        ])
    }
    
    func costraintsForPicker() {
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            picker.topAnchor.constraint(equalTo: self.topAnchor, constant: 400),
            picker.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -280),
            picker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            picker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70)
        ])
    }
    
    func costraintsForBigLabel() {
        bigLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bigLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            bigLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -680),
            bigLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            bigLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70)
        ])
    }
    
    func costraintsForToolBarLabel() {
        toolbarLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            toolbarLabel.centerXAnchor.constraint(equalTo: toolBar.centerXAnchor),
            toolbarLabel.centerYAnchor.constraint(equalTo: toolBar.centerYAnchor, constant: 20)
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
    
    func addButtonAction() {
        addButton.addTarget(self, action: #selector(actionForAddButton), for: .touchUpInside)
    }
    
    //MARK: - add views elements
    func addSomeViews() {
        self.addSubview(imageView)
        self.addSubview(toolBar)
        self.addSubview(toolbarLabel)
        self.addSubview(picker)
        self.addSubview(bigLabel)
        self.addSubview(pickerLabel)
        self.addSubview(firstTextField)
        self.addSubview(secondtTextField)
        self.addSubview(addButton)
    }
    
    func costraintsForAllViews() {
        constraintForImageView()
        constraintForToolBar()
        costraintsForToolBarLabel()
        costraintsForPicker()
        costraintsForBigLabel()
        costraintsForPickerLabel()
        costraintsForFirstTextField()
        costraintsForSecondTextField()
        costraintsForAddButton()
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

extension GeneralView {
    @objc func actionForAddButton() {
        onAddButtonAction?()
    }
    
    func animationForButton() {
        UIView.animate(withDuration: 0.1, animations: {
            self.addButton.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.addButton.transform = CGAffineTransform.identity
            }
        }
    }
    
}

