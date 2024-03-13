

import UIKit
import Firebase

class GeneralViewController: UIViewController {
    var generalView: GeneralView {return self.view as! GeneralView}
    
    let array = SourcePurchase.shared.sourceOfPurchase()
    var currentDate = Date()
    var currentKind:String?
    var uid = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generalView.picker.delegate = self
        generalView.picker.dataSource = self
        generalView.firstTextField.delegate = self
        generalView.secondtTextField.delegate = self
        
        generalView.onAddButtonAction = {[weak self] in self?.addButtonAction()}
    }
    
    
    override func loadView() {
        self.view = GeneralView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension GeneralViewController {
    @objc func addButtonAction() {
        let amount = Int64(generalView.firstTextField.text!) ?? 0
        let reason = generalView.secondtTextField.text!
        var id:Int16 = 0
        
        switch currentKind{
        case PeoplePurchase.food.rawValue:
            id = 1
        case PeoplePurchase.education.rawValue:
            id = 2
        case PeoplePurchase.medicine.rawValue:
            id = 3
        case PeoplePurchase.shopping.rawValue:
            id = 4
        case PeoplePurchase.transport.rawValue:
            id = 5
        default:
            id = 0
        }
        
        if amount == 0 || reason == "" {
            print("error")
        } else {
            do {
                try CoreDataManager.shared.createReport(id, amount, reason, self.uid!, currentDate)
                let t = CoreDataManager.shared.fetchAllReport()

                generalView.firstTextField.text = ""
                generalView.secondtTextField.text = ""
            } catch {
                print("error data")
            }
        }
        generalView.animationForButton()
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
        self.currentKind = array[row]
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


extension GeneralViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
