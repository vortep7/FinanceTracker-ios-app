
import UIKit
import CoreData


//CRUD pattern
public class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}
    
    private var appDelegate:AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
    public func createReport(_ id: Int16,_ amount: Int64,_ reason: String,_ uid: String,_ date:Date) throws {
        guard let entityReportDescription = NSEntityDescription.entity(forEntityName: "Request", in: context) else { throw DataErrors.entityCreationFailed}
        let report = Request(entity: entityReportDescription, insertInto: context)
        report.id = id
        report.amount = amount
        report.reason = reason
        report.uid = uid
        report.date = date
        
        appDelegate.saveContext()
    }
    
    public func fetchAllReport() -> [Request] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Request")
        do {
            return (try? context.fetch(fetchRequest) as? [Request]) ?? []
        }
    }
    
    public func fetchReport(_ id: Int16) throws  -> Request? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Request")
        do {
            let reports = try? context.fetch(fetchRequest) as? [Request]
            return reports?.first(where: {$0.id == id})
        }
    }
    
    public func deleteAllReport() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Request")
        do {
            let reports = try? context.fetch(fetchRequest) as? [Request]
            reports?.forEach{context.delete($0)}
            
        }
        appDelegate.saveContext()
    }
    
    public func deleteReport(with id: Int16) throws{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Request")
        do {
            guard let reports = try? context.fetch(fetchRequest) as? [Request],
                    let report = reports.first(where: {$0.id == id})
            else {throw DataErrors.invalidFetchRequest}
            
            context.delete(report)
        }
        appDelegate.saveContext()
    }

}


