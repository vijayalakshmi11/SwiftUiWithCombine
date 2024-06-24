//
//  ContentService.swift
//  SwiftUiWithCombine
//
//  Created by Vijaya Lakshmi on 6/21/24.
//

import Foundation
import Combine

class ContentService {
    var cancellable = Set<AnyCancellable>()
    func getPlaceholderData() -> Future<PlaceholderResponseModel, PlaceholderError> {
        
        return Future { promise in
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")else {
                return promise(.failure(.networkError(description: "invalid URL")))
            }
            URLSession.shared.dataTaskPublisher(for: url)
                .receive(on: DispatchQueue.main)
                .tryMap{(data, response) in
                    guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                        throw PlaceholderError.networkError(description: "invalid response")
                    }
                    return data
                }
                .decode(type: PlaceholderResponseModel.self, decoder: JSONDecoder())
                .sink { completion in
                    if case let .failure(error) = completion {
                        switch error {
                        case _ as DecodingError:
                            promise(.failure(.parsingError(description: "Failed to pass the data")))
                        default:
                            promise(.failure(.parsingError(description: "not able to get the data")))
                        }
                    }
                } receiveValue: { response in
                    return promise(.success(response))
                }
                .store(in: &self.cancellable)
        }
    }
}
