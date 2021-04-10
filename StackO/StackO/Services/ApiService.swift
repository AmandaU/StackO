//
//  ApiService.swift
//  StackO
//
//  Created by Amanda Baret on 2021/04/10.
//

import Foundation
import Combine

struct ApiService {
    struct Response<T> {
        let value: T
        let response: URLResponse
    }

    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request) // 3
            .tryMap { result -> Response<T> in
                let value = try decoder.decode(T.self, from: result.data) // 4
                return Response(value: value, response: result.response) // 5
            }
            .receive(on: DispatchQueue.main) // 6
            .eraseToAnyPublisher() // 7
    }
}

enum StackApi {
    static let apiService = ApiService()
}

extension StackApi {

    static func getStacks(searchText: String) -> AnyPublisher<StackModel, Error> {
        var request = URLRequest(url:  URL(string: "https://api.stackexchange.com/2.2/questions?pagesize=20&order=desc&sort=activity&tagged=" + searchText + "%203&site=stackoverflow&filter=withbody")!)
        let headers = [
            // "Authorization": "Bearer \(accessToken)",
            "Accept": "*/*",
            "Content-Type": "application/json"
        ]
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        return apiService.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
