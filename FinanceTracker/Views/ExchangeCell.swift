
import UIKit

class ExchangeCell: UICollectionViewCell {
    
    var name: UILabel = {
        let name = UILabel()
        return name
    }()
    
    var title: UILabel = {
        let title = UILabel()
        title.numberOfLines = 15
        return title
    }()
    
    var price: UILabel = {
        let price = UILabel()
        return price
    }()
    
    var imageView: UIImageView = {
        let Image = UIImageView()
        return Image
    }()
    
    func setupCell() {
        name.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(name)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(title)
        
        price.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(price)
                
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
                title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15), // Растягиваем по ширине
                title.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -30) // Устанавливаем нижнее ограничение
            ])
        
        NSLayoutConstraint.activate([
            price.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -80),
            price.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2)
        ])
        
        self.title.numberOfLines = 15
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        self.backgroundColor = .brown
    }
    
 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


