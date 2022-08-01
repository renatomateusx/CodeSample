import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

class RequestsProvider {
    private let baseURL: URL
    private let tokenProvider: TokenProvider

    init?(baseURLString: String, tokenProvider: TokenProvider) {
        guard let url = URL(string: baseURLString) else { return nil }
        self.baseURL = url
        self.tokenProvider = tokenProvider
    }

    func createRequestFor(for endpoint: ApiEndpoint) -> URLRequest? {

        var request = URLRequest(url: self.baseURL)
        request.setValue(self.tokenProvider.token, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.timeoutInterval = 30

        switch(endpoint) {
            case .getMovies(let userId):
                let url = URL(string: "\(self.baseURL)\(endpoint.endpointString)?userId=\(userId)")
                request.url = url
                request.httpMethod = "GET"
            case .postRate(let movieRate):
                let url = URL(string: "\(self.baseURL)\(endpoint.endpointString)")
                request.url = url
                request.httpMethod = "POST"
                let encoder = JSONEncoder()
                encoder.outputFormatting = .prettyPrinted
                if let json = try? encoder.encode(movieRate) {
                    request.httpBody = json
                }
        }
        return request
    }
}
