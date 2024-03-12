
import Foundation

struct ReportCell {
    var reason: String
    var amount: Int
    var date: Date
}

struct SourceTableView {
    
    static let shared = SourceTableView()
    private init() {}
    
    func createDataArray(_ uid: String) -> [Request] {
        do {
            let array = try CoreDataManager.shared.newR(for: uid)
            return array
        } catch {
            return []
        }
    }
//    
//    func createNewDataArray(_ uid: String) -> [Request?] {
//        do {
//            let element = try CoreDataManager.shared.fetchReport(uid)
//            
//            let array = [element]
//            print(array)
//            return array
//        } catch {
//            print("error1")
//            return []
//        }
//    }
//    
    
}
