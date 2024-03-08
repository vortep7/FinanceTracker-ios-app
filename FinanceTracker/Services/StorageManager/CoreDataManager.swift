
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
    
    public func createReport(_ id: Int16,_ amount: Int32,_ reason: String, _ date: Date) throws {
        //create description of object
        guard let entityReportDescription = NSEntityDescription.entity(forEntityName: "Report", in: context) else { throw DataErrors.entityCreationFailed}
        //create object
        let report = Report(entity: entityReportDescription, insertInto: context)
        report.id = id
        report.amount = amount
        report.reason = reason
        report.date = date
        
        appDelegate.saveContext()
    }
    
    public func fetchAllReport() -> [Report] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Report")
        do {
            return (try? context.fetch(fetchRequest) as? [Report]) ?? []
        }
    }
    
    public func fetchReport(_ id: Int16) throws  -> Report? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Report")
        do {
            let reports = try? context.fetch(fetchRequest) as? [Report]
            return reports?.first(where: {$0.id == id})
        }
    }
    
    public func deleteAllReport() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Report")
        do {
            let reports = try? context.fetch(fetchRequest) as? [Report]
            reports?.forEach{context.delete($0)}
            
        }
        appDelegate.saveContext()
    }
    
    public func deleteReport(with id: Int16) throws{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Report")
        do {
            guard let reports = try? context.fetch(fetchRequest) as? [Report],
                    let report = reports.first(where: {$0.id == id})
            else {throw DataErrors.invalidFetchRequest}
            
            context.delete(report)
        }
        appDelegate.saveContext()
    }
    
}


