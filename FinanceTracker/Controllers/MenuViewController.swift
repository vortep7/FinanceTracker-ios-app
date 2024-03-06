import UIKit
import Foundation

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        self.view = MenuView(frame: UIScreen.main.bounds)
    }

}
