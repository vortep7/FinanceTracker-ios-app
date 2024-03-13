import UIKit
import FirebaseAuth

class StatisticViewController: UIViewController {
    var statisticView: StatisticView { return self.view as! StatisticView}
    var uid: String?
    var source = [Request?]()
    
    override func viewDidLoad() {
        statisticView.tableView.dataSource = self
        statisticView.tableView.delegate = self
        
        statisticView.onReloadButtonAction = {[weak self] in self?.actionForButtonReload()}
        
        statisticView.tableView.register(TableViewCell.self, forCellReuseIdentifier: "\(TableViewCell.self)")
        uid = Auth.auth().currentUser?.uid
        source = SourceTableView.shared.createDataArray(uid ?? "")
        
        print(source)
    }
    
    override func loadView() {
        self.view = StatisticView(frame: UIScreen.main.bounds)
    }
}

extension StatisticViewController {
    @objc func actionForButtonReload() {
        uid = Auth.auth().currentUser?.uid
        source = SourceTableView.shared.createDataArray(uid ?? "")
        statisticView.tableView.reloadData()
    }
}

extension StatisticViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension StatisticViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(source.count)
        return source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(TableViewCell.self)", for: indexPath) as! TableViewCell
        print(source)
        let reversedArr = Array(source.reversed())
        let element = reversedArr[indexPath.row]
                
        cell.amount.text = "Amount: \(element!.amount) rub"
        cell.reason.text = "Reason: \(element!.reason ?? "")"
        
        if let date = element!.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let dateString = dateFormatter.string(from: date)
            cell.date.text = "Date: \(dateString)"
        } else {
            cell.date.text = "Date: N/A"
        }
        
        cell.backgroundColor = .tableViewColorNew
        
        return cell
    }
}



