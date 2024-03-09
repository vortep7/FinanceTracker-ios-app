import UIKit
import Foundation
import Firebase

class MenuViewController: UIViewController {
    var menuView: MenuView {return self.view as! MenuView}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView.onButtonExitAction = { [weak self] in self?.actionForExitButton()}
        menuView.onSwitchAction
        = { [weak self] in self?.switchStateChanged()}
        menuView.onButtonGoAction
        = { [weak self] in self?.goButtonAction()}
        menuView.onButtonInfoAction
        = { [weak self] in self?.infoButtonAction()}
        
    }
            
    override func loadView() {
        self.view = MenuView(frame: UIScreen.main.bounds)
        self.view.backgroundColor = .blue
    }
}

extension MenuViewController {
    @objc func actionForExitButton() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("error")
        }
    }
    
    @objc func switchStateChanged() {
        if menuView.moodSwitch.isOn {
                menuView.blackImage()
            } else {
                menuView.lightImage()
            }
        }
    
    @objc func goButtonAction() {
        let nextController = GeneralViewController()
        navigationController?.pushViewController(nextController, animated: true)
    }
    
    @objc func infoButtonAction() {
        let nextController = InfoViewController()
        navigationController?.pushViewController(nextController, animated: true)
    }
}
