import UIKit
import FirebaseAuth

class StatisticViewController: UIViewController {
    
    var statisticView: StatisticView { return self.view as! StatisticView}
    var uid: String?
    var source = [Request?]()
    var kind: String?
    let dataManager = CoreDataManager.shared

    
    override func viewDidLoad() {
        statisticView.tableView.dataSource = self
        statisticView.tableView.delegate = self
        
        statisticView.onReloadButtonAction = {[weak self] in self?.actionForButtonReload()}
        statisticView.onPersonButtonAction = {[weak self] in self?.actionForButtonPerson()}
        
        statisticView.tableView.register(TableViewCell.self, forCellReuseIdentifier: "\(TableViewCell.self)")
        uid = Auth.auth().currentUser?.uid
        source = SourceTableView(dataManager: dataManager).createDataArray(uid ?? "")
        
    }
    
    override func loadView() {
        self.view = StatisticView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        uid = Auth.auth().currentUser?.uid
        source = SourceTableView(dataManager: dataManager).createDataArray(uid ?? "")
        super.viewWillAppear(animated)
        var fullSum:Int64 = 0
        
        var foodSum:Int64 = 0
        var educationSum:Int64 = 0
        var medicineSum:Int64 = 0
        var shoppingSum:Int64 = 0
        var transportSum:Int64 = 0

        for element in source {
            fullSum += element?.amount ?? 0
        }
        
        for element in source {
            if element?.id == 1 {
                foodSum += element?.amount ?? 0
            } else if element?.id == 2 {
                educationSum += element?.amount ?? 0
            }else if element?.id == 3 {
                medicineSum += element?.amount ?? 0
            }else if element?.id == 4 {
                shoppingSum += element?.amount ?? 0
            }else if element?.id == 5 {
                transportSum += element?.amount ?? 0
            }
        }
        
        statisticView.tableView.reloadData()
        statisticView.amountLabel.text = "Full price: \(fullSum)"
        statisticView.sumsLabel.text = """
        🍔 Food price: \(foodSum)
        
        🎓 Education price: \(educationSum)
        
        ⚕️ Medicine price: \(medicineSum)
        
        🛍️ Shopping price: \(shoppingSum)
        
        🚗 Transport price: \(transportSum)
        
        """
    }
}

//MARK: - table delegate/data source
extension StatisticViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension StatisticViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(TableViewCell.self)", for: indexPath) as! TableViewCell
        let reversedArr = Array(source.reversed())
        let element = reversedArr[indexPath.row]
                
        cell.amount.text = "Amount: \(element!.amount) rub"
        cell.reason.text = "Reason: \(element!.reason ?? "")"
        
        switch element!.id {
        case 1: kind = KindOfPurchase.food.rawValue
        case 2: kind = KindOfPurchase.education.rawValue
        case 3: kind = KindOfPurchase.medicine.rawValue
        case 4: kind = KindOfPurchase.shopping.rawValue
        case 5: kind = KindOfPurchase.transport.rawValue
        default:
            kind = KindOfPurchase.def.rawValue
        }
        
        cell.kind.text = kind
                
        if let date = element!.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let dateString = dateFormatter.string(from: date)
            cell.date.text = "Date: \(dateString)"
        } else {
            cell.date.text = "Date: N/A"
        }
         
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .tableViewColorNew
        } else {
            cell.backgroundColor = .pickerColor
        }
        
        return cell
    }
}

//MARK: - reload nutton action
extension StatisticViewController {
    @objc func actionForButtonReload() {
        uid = Auth.auth().currentUser?.uid
        source = SourceTableView(dataManager: dataManager).createDataArray(uid ?? "")
        statisticView.tableView.reloadData()
        statisticView.animationForButton()
    }
    
    @objc func actionForButtonPerson() {
        let nextController = SettingViewController()
        present(nextController, animated: true)
    }
}

enum KindOfPurchase: String {
    case food = "Food"
    case education = "Education"
    case medicine = "Medicine"
    case shopping = "Shopping"
    case transport = "Transport"
    case def = "Default"
}


