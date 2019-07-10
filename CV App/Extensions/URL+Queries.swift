
import Foundation

// MARK: - URL Extension
extension URL {
    
    /// The method
    ///
    /// - Parameter queries: recive the queries that de URL needs
    /// - Returns: returns the URL with the queries
    func withQueries(_ queries: [String:String]) -> URL?{
        
        guard queries.isEmpty == false else { return self }
        
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
