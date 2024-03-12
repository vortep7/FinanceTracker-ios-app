import Foundation
import CoreData


@objc(Request)
public class Request: NSManagedObject {

}
extension Request {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Request> {
        return NSFetchRequest<Request>(entityName: "Request")
    }

    @NSManaged public var id: Int16
    @NSManaged public var amount: Int64
    @NSManaged public var date: Date?
    @NSManaged public var reason: String?
    @NSManaged public var uid: String?

}

extension Request : Identifiable {

}
