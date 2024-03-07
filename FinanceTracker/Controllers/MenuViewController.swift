import UIKit
import Foundation

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.fetchDataExchange { result in
            switch result {
            case .success(let data):
                print(data.date)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
        
        NetworkManager.shared.fetchDataMoney { result in
            switch result {
            case .success(let data): print(data)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    override func loadView() {
        self.view = MenuView(frame: UIScreen.main.bounds)
    }
}
