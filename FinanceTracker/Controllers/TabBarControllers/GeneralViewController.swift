

import UIKit
import Firebase

class GeneralViewController: UIViewController {
    var generalView: GeneralView {return self.view as! GeneralView}
    let array = SourcePurchase.shared.sourceOfPurchase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generalView.picker.delegate = self
        generalView.picker.dataSource = self
    }
    
    
    override func loadView() {
        self.view = GeneralView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension GeneralViewController:UIPickerViewDelegate {
    //MARK: - element in row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "\(self.array[row])"
        return result
    }
    
    //MARK: - selected row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(array[row])
        print(array)
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 70.0
    }
}

extension GeneralViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        array.count
    }
    
    
}
