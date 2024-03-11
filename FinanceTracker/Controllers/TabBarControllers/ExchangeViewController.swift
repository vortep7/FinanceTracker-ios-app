import UIKit

class ExchangeViewController: UIViewController {
    
    var count = 1
    var exchangeView:ExchangeView {return self.view as! ExchangeView}
    var source = [Stocks]()

    override func viewDidLoad() {
    
        exchangeView.collectionView.dataSource = self
        exchangeView.collectionView.delegate = self
        y()
        exchangeView.collectionView.register(ExchangeCell.self, forCellWithReuseIdentifier: "\(ExchangeCell.self)")
    }
    
    override func loadView() {
        self.view = ExchangeView(frame: UIScreen.main.bounds)
    }
    
    func y() {
        ConfigStocks.shared.requestForCollection { myArray in
            if let myArray = myArray{
                if self.count == 1 {
                    self.source = myArray
                    self.count -= 1
                    DispatchQueue.main.async {
                        self.exchangeView.collectionView.reloadData()

                    }
                }
            }
        }
    }

}

extension ExchangeViewController: UICollectionViewDelegate {
    
}

extension ExchangeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ExchangeCell.self)", for: indexPath) as? ExchangeCell else {
            print("error")
            return UICollectionViewCell()
        }

        if self.source.isEmpty {
            cell.imageView.image = UIImage(named: "placeholder_image")
            cell.name.text = "Loading..."
            cell.title.text = ""
            cell.price.text = ""
            cell.backgroundColor = .green
        } else {
         
            cell.imageView.image = self.source[indexPath.item].Image
            cell.name.text = self.source[indexPath.item].name
            cell.title.text = self.source[indexPath.item].title
            cell.price.text = self.source[indexPath.item].price
            cell.backgroundColor = .green
        }
       
        return cell
    }

}




//extension ProjectsViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        source.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionViewCell.self)", for: indexPath) as? CollectionViewCell else {
//            print("Ошибка: Не удалось создать ячейку")
//            return UICollectionViewCell()
//        }
//        
//        cell.imageView.image = source[indexPath.item].image
//        cell.lableFirst.text = source[indexPath.item].title
//        cell.lableSecond.text = source[indexPath.item].review
//
//        
//        cell.layer.cornerRadius = 20
//        
//        if indexPath.item % 2 == 0 {
//            cell.backgroundColor = UIColor.lightGray
//        } else {
//            cell.backgroundColor = UIColor.white
//        }
//        
//        return cell
//    }
//}
