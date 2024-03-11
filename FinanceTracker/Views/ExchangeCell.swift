
import UIKit

class ExchangeCell: UICollectionViewCell {
    
    var name: UILabel = {
        let name = UILabel()
        name.font = UIFont(name: "abosanova", size: 30)
        name.textColor = .white
        return name
    }()
    
    var title: UILabel = {
        let title = UILabel()
        title.textColor = .white
        return title
    }()
    
    var price: UILabel = {
        let price = UILabel()
        price.textColor = .white
        price.font = .boldSystemFont(ofSize: 26)
        return price
    }()
    
    var imageView: UIImageView = {
        let Image = UIImageView()
        return Image
    }()
    
    var specialLabel: UILabel = {
        let label = UILabel()
        label.text = "Current course (euro):"
        label.textColor = .specialCellLabel
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray // Устанавливаем цвет фона в серый
        return view
    }()
    
    func setupCell() {
        name.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(name)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(title)
        
        price.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(price)
        
        specialLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(specialLabel)
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(separatorView)
                
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(imageView)
        
        imageView.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 80),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -170),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 55),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -260)
        ])
        
        
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant:10)
        ])
        
        NSLayoutConstraint.activate([
                title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                title.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -15)
            ])
        
        NSLayoutConstraint.activate([
            price.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 110),
            price.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            price.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -165)
        ])
        
        NSLayoutConstraint.activate([
            specialLabel.bottomAnchor.constraint(equalTo: price.topAnchor, constant: -4),
            specialLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
        ])
        
        NSLayoutConstraint.activate([
                separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), // Задаем начальную точку слева
                separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), // Задаем конечную точку справа
                separatorView.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 30), // Сдвигаем вниз на 10 пунктов от центра по вертикали
                separatorView.heightAnchor.constraint(equalToConstant: 2)
            ])
        
        self.title.numberOfLines = 15
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        self.layer.cornerRadius = 40
            
    }
    
 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


