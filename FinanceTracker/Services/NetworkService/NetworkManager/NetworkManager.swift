import Foundation

protocol NetworkService {    
    func fetchDataExchange(completion: @escaping (Result<ExchangeRates,Error>) -> Void)
    func fetchDataMoney(completion: @escaping (Result<MoneyModel,Error>) -> Void)
}

class NetworkManager {
    public static let shared = NetworkManager()
    private init() {}
    private let decoder = JSONDecoder()
}

extension NetworkManager:NetworkService {
    public func fetchDataExchange(completion: @escaping (Result<ExchangeRates,Error>) -> Void) {
        let request = ApiService.getRequestExchange.requset
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data 
            else {
                return}
            do {
                let json = try self.decoder.decode(ExchangeRates.self, from: data)
                completion(.success(json))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    public func fetchDataMoney(completion: @escaping (Result<MoneyModel,Error>) -> Void) {
        let request = ApiService.getRequestMoney.requset
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else {return}
            do {
                let json = try self.decoder.decode(MoneyModel.self, from: data)
                completion(.success(json))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
