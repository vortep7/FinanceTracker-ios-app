
import Foundation

struct ReportCell {
    var reason: String
    var amount: Int
    var date: Date
}

struct SourceTableView {
    let dataManager: MyDataManager

    //MARK: - DI pattern
    init(dataManager: MyDataManager) {
        self.dataManager = dataManager
    }
    
    func createDataArray(_ uid: String) -> [Request] {
        do {
            let array = try dataManager.newRequest(for: uid)
            return array
        } catch {
            return []
        }
    }
}
