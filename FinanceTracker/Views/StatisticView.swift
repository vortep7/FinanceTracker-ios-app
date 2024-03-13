
import Foundation
import UIKit

class StatisticView: UIView {
    
    var onReloadButtonAction: (() ->Void)?
    
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
    
    func constraintForSumLabel() {
        sumLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sumLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 140),
            sumLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -670),
            sumLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            sumLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100)
        ])
    }
    
    func constraintForReloadButton() {
        reloadButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reloadButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 140),
            reloadButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -670),
            reloadButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 200),
            reloadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50)
        ])
    }
    
    func constraintForTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 300),
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
    }
    
    //MARK: - add views elements
    func addSomeViews() {
        self.addSubview(imageView)
        self.addSubview(toolBar)
        self.addSubview(toolbarLabel)
        self.addSubview(tableView)
        self.addSubview(reloadButton)
        self.addSubview(sumLabel)
    }
    
    func costraintsForAllViews() {
        constraintForImageView()
        constraintForToolBar()
        costraintsForToolBarLabel()
        constraintForTableView()
        constraintForReloadButton()
        constraintForSumLabel()
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

extension StatisticView {
    @objc func reloadAction() {
        onReloadButtonAction?()
    }
}
