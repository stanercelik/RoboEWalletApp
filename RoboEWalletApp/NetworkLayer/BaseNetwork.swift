//
//  BaseNetwork.swift
//  RoboEWalletApp
//
//  Created by Taner Çelik on 25.06.2024.
//

import Foundation

enum HTTPMethod: String {
    case GET, POST, PUT, DELETE
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case parsingError
}

class Network {
    func get<R>(_ endpoint: String, parameters: [String: Any] = [:], headers: [String: String] = [:], method: HTTPMethod = .GET, completion: @escaping (Result<R, Error>) -> Void) where R: Decodable {
        guard var urlComponents = URLComponents(string: AppConst.apiBaseURL + endpoint) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        
        guard let url = urlComponents.url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy)
        urlRequest.httpMethod = method.rawValue

        urlRequest.setValue(AppConst.apiKey, forHTTPHeaderField: "x-rapidapi-key")
        urlRequest.setValue(AppConst.apiHost, forHTTPHeaderField: "x-rapidapi-host")
        
        for (key, value) in headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }

        if !parameters.isEmpty && method != .GET {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            guard let data = data else {
                print("No data returned from API")
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let result = try JSONDecoder().decode(R.self, from: data)
                completion(.success(result))
            } catch {
                print("Error parsing data: \(error)")
                completion(.failure(NetworkError.parsingError))
            }
        }.resume()
    }
}
