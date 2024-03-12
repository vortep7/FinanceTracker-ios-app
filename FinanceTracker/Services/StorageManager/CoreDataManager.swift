
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
    
//    public func fetchReport(_ uid: String) throws  -> Request? {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Request")
//        do {
//            let reports = try? context.fetch(fetchRequest) as? [Request]
//            return reports?.first(where: {$0.uid == uid})
//        }
//    }
    
    public func newR(for uid: String) throws -> [Request] {
        let fetchRequest: NSFetchRequest<Request> = Request.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uid == %@", uid)
        
        do {
            guard let reports = try context.fetch(fetchRequest) as? [Request] else {
                throw DataErrors.invalidFetchRequest
            }
            return reports
        } catch {
            throw error
        }
    }
    
    public func fetchReports(for uid: String) -> [Request] {
        let fetchRequest: NSFetchRequest<Request> = Request.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uid == %@", uid)
        
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Error fetching reports: \(error.localizedDescription)")
            return []
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
    
    public func deleteReport(with uid: String) throws{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Request")
        do {
            guard let reports = try? context.fetch(fetchRequest) as? [Request],
                    let report = reports.first(where: {$0.uid == uid})
            else {throw DataErrors.invalidFetchRequest}
            
            context.delete(report)
        }
        appDelegate.saveContext()
    }

}


