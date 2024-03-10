
import UIKit

class ExchangeCell: UICollectionViewCell {
    
    let name: UILabel = {
        let name = UILabel()
        return name
    }()
    
    let title: UILabel = {
        let title = UILabel()
        return title
    }()
    
    let price: UILabel = {
        let price = UILabel()
        return price
    }()
    
    let imageView: UIImageView = {
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
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2)
        ])
        
        NSLayoutConstraint.activate([
            price.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            price.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2)
        ])
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

