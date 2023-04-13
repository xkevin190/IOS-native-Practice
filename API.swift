//
//  AP.swift
//  iNews
//
//  Created by Deka Primatio on 06/06/22.
//

import Foundation

class HTTPClient {
    private let session: URLSession
    
    init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        session = URLSession(configuration: config)
    }
    
    func sendRequest(url: String, method: String, body: NSDictionary?, completion: @escaping (Result<Data?, Error>) -> Void) {
        let jsonData = try! JSONSerialization.data(withJSONObject: body as Any, options: [])
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(HTTPError.invalidResponse))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(HTTPError.statusCode(httpResponse.statusCode)))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}

enum HTTPError: Error {
    case invalidResponse
    case statusCode(Int)
}
