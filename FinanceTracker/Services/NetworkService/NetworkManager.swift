import Foundation

protocol ManagerProtocol {
    func createUrl()
    func createData()
}

final class NetworkManager {
    //MARK: - singleton
    public static let shared = NetworkManager()
    private let decoder = JSONDecoder()
    
    //HARDCODE
    private func createUrl() -> String {
        let tunnel = ""
        let server = ""
        let endPoint = ""
        return tunnel + server + endPoint
    }
    
    private func fetchData() async throws -> SingleUser {
        guard let url = URL(string: createUrl()) else {
            throw ErrorsOfNetworkManager.badURL}
       
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let json = try decoder.decode(SingleUser.self, from: data)
            return json
        } catch {
            throw ErrorsOfNetworkManager.deafultError
        }
    }
}

extension NetworkManager: ManagerProtocol {
    func createUrl() {
    }
    
    func createData() {
    }
}
