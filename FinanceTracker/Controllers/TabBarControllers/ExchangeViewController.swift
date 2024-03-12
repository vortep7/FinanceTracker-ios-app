import UIKit

class ExchangeViewController: UIViewController {
    
    var count = 1
    var exchangeView:ExchangeView {return self.view as! ExchangeView}
    var source = [Stocks]()

    override func viewDidLoad() {
        exchangeView.onButtonAction = {[weak self] in self?.actionForHomeButton()}
        
        exchangeView.collectionView.dataSource = self
        fetchData()
        exchangeView.collectionView.register(ExchangeCell.self, forCellWithReuseIdentifier: "\(ExchangeCell.self)")
    }
    
    override func loadView() {
        self.view = ExchangeView(frame: UIScreen.main.bounds)
    }
    
    @objc func actionForHomeButton() {
        let nextViewController = HomeVIewController()
        present(nextViewController, animated: true, completion: nil)
    }
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
        }
        else {
            cell.imageView.image = self.source[indexPath.item].Image
            cell.name.text = self.source[indexPath.item].name
            cell.title.text = self.source[indexPath.item].title
            cell.price.text = self.source[indexPath.item].price
            cell.backgroundColor = .cellColor
        }
       
        return cell
    }

}

extension ExchangeViewController {
    func fetchData() {
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
