
import Foundation
import UIKit

final class StatisticView: UIView {
    //MARK: - clousers for button action
    var onReloadButtonAction: (() ->Void)?
    var onPersonButtonAction: (() ->Void)?
    
    //MARK: - create UI elements
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Black")
        return imageView
    }()
    
    private let toolBar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.backgroundColor = UIColor.mainWhite
        return toolbar
    }()
    
    private let toolbarLabel: UILabel = {
        let label = UILabel()
        label.text =  "History of spending"
        label.textColor = .black
        label.font = UIFont(name: "abosanova", size: 20)
        label.textAlignment = .center
        return label
    }()
    
    let sumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "abosanova", size: 20)
        label.textAlignment = .center
        return label
    }()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .tabBarColor
        label.font = UIFont(name: "abosanova", size: 28)
        label.textAlignment = .center
        return label
    }()
    
    let sumsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainWhite
        label.font = UIFont(name: "abosanova", size: 20)
        label.numberOfLines = 10
        label.textAlignment = .center
        return label
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    private let reloadButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.setTitle("Reload", for: .normal)
        button.backgroundColor = .pickerLabel
        return button
    }()
    
    let buttonPerson: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        return button
    }()
    
    
    //MARK: - constraints for UI elements
    func constraintForAmountLabel() {
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            amountLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            amountLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -710),
            amountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            amountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80)
        ])
    }
    
    func constraintSumsLabel() {
        sumsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sumsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 180),
            sumsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -500),
            sumsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            sumsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
//    func constraintForSumLabel() {
//        sumLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            sumLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 180),
//            sumLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -570),
//            sumLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
//            sumLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100)
//        ])
//    }
    
    func constraintForPersonButton() {
        buttonPerson.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonPerson.centerXAnchor.constraint(equalTo: toolBar.centerXAnchor, constant: 175),
            buttonPerson.centerYAnchor.constraint(equalTo: toolBar.centerYAnchor, constant: 30)
        ])
    }
    
    func constraintForReloadButton() {
        reloadButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reloadButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 400),
            reloadButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -440),
            reloadButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            reloadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -120)
        ])
    }
    
    func constraintForTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 510),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -115),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
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
    
    func costraintsForToolBarLabel() {
        toolbarLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            toolbarLabel.centerXAnchor.constraint(equalTo: toolBar.centerXAnchor),
            toolbarLabel.centerYAnchor.constraint(equalTo: toolBar.centerYAnchor, constant: 30)
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
        reloadButton.addTarget(self, action: #selector(reloadAction), for: .touchUpInside)
        buttonPerson.addTarget(self, action: #selector(personAction), for: .touchUpInside)
    }
    
    //MARK: - add views elements
    func addSomeViews() {
        self.addSubview(imageView)
        self.addSubview(toolBar)
        self.addSubview(toolbarLabel)
        self.addSubview(tableView)
        self.addSubview(reloadButton)
        self.addSubview(sumLabel)
        self.addSubview(buttonPerson)
        self.addSubview(amountLabel)
        self.addSubview(sumsLabel)
    }
    
    func costraintsForAllViews() {
        constraintForImageView()
        constraintForToolBar()
        costraintsForToolBarLabel()
        constraintForTableView()
        constraintForReloadButton()
//        constraintForSumLabel()
        constraintForPersonButton()
        constraintForAmountLabel()
        constraintSumsLabel()
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

//MARK: - button action and animation
extension StatisticView {
    @objc func reloadAction() {
        onReloadButtonAction?()
    }
    
    @objc func personAction() {
        onPersonButtonAction?()
    }
    
    func animationForButton() {
        UIView.animate(withDuration: 0.1, animations: {
            self.reloadButton.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.reloadButton.transform = CGAffineTransform.identity
            }
        }
    }
}
