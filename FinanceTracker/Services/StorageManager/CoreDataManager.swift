
import Foundation
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
    
}

