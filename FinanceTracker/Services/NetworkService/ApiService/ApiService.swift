import Foundation


//MARK: - create request
enum ApiService:String {
    case getRequestMoney
    case getRequestExchange
    case postRequest
    case updateRequest
    case deleteRequest
    
    var baseUrl: String {
        return "https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@"
    }
    
    var header: [String:String] {
        switch self {
        case .deleteRequest:
            return ["123":"321"]
        default:
            return [:]
        }
    }
    
    var path: String {
        switch self{
        case .getRequestMoney:
            return "latest/v1/currencies.json"
        case .getRequestExchange:
            return "latest/v1/currencies/eur.json"
        case .postRequest:
            return ""
        case .updateRequest:
            return ""
        case .deleteRequest:
            return ""
        }
    }
    
    
    var requset: URLRequest {
        let result = baseUrl + path
        let url = URL(string: result)
        var request = URLRequest(url: url!)
        request.allHTTPHeaderFields = header
        switch self {
        case .getRequestMoney:
            request.httpMethod = "GET"
            return request
        case .getRequestExchange:
            request.httpMethod = "GET"
            return request
        case .postRequest:
            request.httpMethod = "POST"
            return request
        case .updateRequest:
            request.httpMethod = "UPDATE"
            return request
        case .deleteRequest:
            request.httpMethod = "DELETE"
            return request
        }
    }
    
}
