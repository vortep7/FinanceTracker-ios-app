import UIKit
import Foundation
import Firebase

class MenuViewController: UIViewController {
    var menuView: MenuView {return self.view as! MenuView}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView.onButtonAction = { [weak self] in self?.actionForExitButton()}
    }
            
    override func loadView() {
        self.view = MenuView(frame: UIScreen.main.bounds)
        self.view.backgroundColor = .blue
    }
    
    @objc func actionForExitButton() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("error")
        }
    }
}
