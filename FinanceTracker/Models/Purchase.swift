import Foundation

enum PeoplePurchase: String {
    case food = "Food"
    case transport = "Transport"
    case medicine = "Medicine"
    case education = "Education"
    case shopping = "Shopping"
}

struct SourcePurchase {
    static let shared = SourcePurchase()
    private init() {}
    
    func sourceOfPurchase() -> [String] {
        let array = [PeoplePurchase.food.rawValue,PeoplePurchase.education.rawValue,
                     PeoplePurchase.medicine.rawValue,PeoplePurchase.shopping.rawValue,
                     PeoplePurchase.transport.rawValue]
        return array
    }
}
