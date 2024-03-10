import UIKit

class ExchangeViewController: UIViewController {
    
    var exchangeView:ExchangeView {return self.view as! ExchangeView}

    override func viewDidLoad() {
        exchangeView.collectionView.dataSource = self
        exchangeView.collectionView.delegate = self
    }
    
    override func loadView() {
        self.view = ExchangeView(frame: UIScreen.main.bounds)
    }

}

extension ExchangeViewController: UICollectionViewDelegate {
    
}

extension ExchangeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ConfigStocks.shared.requestForCollection()
        return ConfigStocks.shared.myArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: <#T##String#>, for: <#T##IndexPath#>)
    }
    
}
