//
//  MainInteractor.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/3/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
import UIKit

// MARK: - URL Extension
extension URL{
    
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

class Request {
    
    // MARK: - Properties
    private var baseURL: URL?
    
    public static let shared = Request(baseURL: Configuration.getUrl(for: URLKey.request.rawValue) ?? Default.empty.rawValue)
    
    // MARK: - Enums
    enum NetworkingErrors: Error{
        case netWorkError
        case invalidData
        case invalidRequest
    }
    
    // MARK: - Initializers
    /**
     The init for the base URL.
     
     - Parameters:
        - baseURL: URL base for the API requests.
     */
    private init(baseURL: String) {
        guard let url = URL(string: baseURL) else { return }
        self.baseURL = url
    }
    
    // MARK: - Methods
    /**
     This method allows to make the request to a especific URL with components sendings by the extension URL on the top.
     
     - Parameters:
        - endpoint: The URL endpoints for make the request.
        - entity: The entity need it for test the data fetch.
        - completionHandler: This completion handler receive a result composed by a data and a case of the Networking Errors enum.
     */
    func request<T:Codable>(_ endpoint: String, entity: T.Type, completionHandler: @escaping (Result<Data, NetworkingErrors>) -> Void){
        guard let url = baseURL?.appendingPathComponent(endpoint) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = HTTP.get.rawValue
        URLSession.shared.dataTask(with: request) { data, reponse, error  in
            guard error == nil else{
                completionHandler(.failure(.netWorkError))
                return
            }
            guard let dataFetched = data, let _ : T = self.jsonDecode(data: dataFetched) else{
                completionHandler(.failure(.invalidData))
                return
            }
            completionHandler(.success(dataFetched))
            }.resume()
    }
    
    /**
     Method for download de image by a URL an create data.
     
     - Parameters:
        - urlImage: The URL image.
        - completionHandler: Completion handler.
     */
    func downloadImage(urlImage: String, completionHandler: @escaping (Result<Data, NetworkingErrors>) -> Void){
        guard let url = URL(string: urlImage) else {
            completionHandler(.failure(.invalidRequest))
            return
        }
        let requestImage = URLRequest(url: url)
        URLSession.shared.dataTask(with: requestImage){ data, response, error in
            guard error == nil else{
                completionHandler(.failure(.netWorkError))
                return
            }
            guard let fetchedData = data else{
                completionHandler(.failure(.invalidData))
                return
            }
            completionHandler(.success(fetchedData))
            }.resume()
    }
    
    
    /**
     This method decodes the DATA received by the completion Hander of the function request, using CODABLE and also the method expect to receive a generic type.
     
     - Parameters:
     - data: The data received by the completion handler.
     - Returns: Returns the json decode in an array.
     */
    func jsonDecode<T: Decodable>(data: Data) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            return try jsonDecoder.decode(T.self, from: data)
        } catch {
            // MARK: - ToDo
        }
        return nil
    }
}
