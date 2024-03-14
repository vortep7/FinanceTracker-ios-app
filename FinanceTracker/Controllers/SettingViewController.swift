

import UIKit

class SettingViewController: UIViewController {
    var settingView: SettingView { return self.view as! SettingView}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingView.onActionForDeleteButton = {[weak self] in self?.actionForButtonSetting()}

    }
    
    override func loadView() {
        self.view = SettingView(frame: UIScreen.main.bounds)
    }

}

extension SettingViewController {
    @objc func actionForButtonSetting() {
        CoreDataManager.shared.deleteAllReport()
    }
}
