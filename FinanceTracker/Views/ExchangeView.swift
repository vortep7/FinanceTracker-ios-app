
import Foundation
import UIKit

final class ExchangeView: UIView {
    //MARK: - clouser for button
    var onButtonAction:(() -> Void)?
    
    //MARK: - create UI elements
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "newStocks")
        return imageView
    }()
    
    private let toolBar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.barTintColor = .mainWhite
        return toolbar
    }()
    
    private let toolbarLabel: UILabel = {
        let label = UILabel()
        label.text = "Exchange rate"
        label.textColor = .black
        label.font = UIFont(name: "abosanova", size: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let buttonPerson: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "house.fill"), for: .normal)
        return button
    }()
    
    private let buttonBook: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "info.bubble.fill"), for: .normal)
        return button
    }()
    
    var collectionView: UICollectionView
    
    //MARK: - create constraints for UI elements
    func constraintForPersonButton() {
        buttonPerson.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonPerson.centerXAnchor.constraint(equalTo: toolBar.centerXAnchor, constant: 175),
            buttonPerson.centerYAnchor.constraint(equalTo: toolBar.centerYAnchor, constant: 30)
        ])
    }
    
    func constraintForBookButton() {
        buttonBook.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonBook.centerXAnchor.constraint(equalTo: toolBar.centerXAnchor, constant: -175),
            buttonBook.centerYAnchor.constraint(equalTo: toolBar.centerYAnchor, constant: 30)
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
    
    func constraintForCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
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
        self.addSubview(collectionView)
        self.addSubview(toolbarLabel)
        self.addSubview(buttonPerson)
        self.addSubview(buttonBook)
    }
    
    func costraintsForAllViews() {
        constraintForImageView()
        constraintForToolBar()
        constraintForCollectionView()
        costraintsForToolBarLabel()
        constraintForPersonButton()
        constraintForBookButton()
    }
    
    func addButtonAction() {
        buttonPerson.addTarget(self, action: #selector(personButtonAction), for: .touchUpInside)
    }
        
    override init(frame: CGRect) {
        let layout = ExchangeView.setupLayout()
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        
        super.init(frame: frame)
        addSomeViews()
        costraintsForAllViews()
        addButtonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - layout for collectionView
    private static func setupLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 350, height: 350)
        layout.minimumLineSpacing = 100
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        return layout
    }
}

//MARK: - button action
extension ExchangeView {
    @objc func personButtonAction(){
        onButtonAction?()
    }
}
