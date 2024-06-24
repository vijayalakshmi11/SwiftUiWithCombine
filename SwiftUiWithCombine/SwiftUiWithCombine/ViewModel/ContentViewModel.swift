//
//  ContentViewModel.swift
//  SwiftUiWithCombine
//
//  Created by Vijaya Lakshmi on 6/21/24.
//

import Foundation
import Combine
class ContentViewModel: ObservableObject {
    @Published var arrayItems: PlaceholderResponseModel = []
    var cancellable = Set<AnyCancellable>()
    let service: ContentService
    init(service: ContentService) {
        self.service = service
        getServerData()
    }
    func getServerData() {
        service.getPlaceholderData()
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("error",error)
                case .finished:
                    print("completion")
                }
            } receiveValue: { [weak self] response in
                self?.arrayItems = response
            }
            .store(in: &cancellable)
    }
    func getData() {
        let item = PlaceholderResponseModelElement(userId: 1, id: 1, title: "test", body: "test description")
        let item2 = PlaceholderResponseModelElement(userId: 2, id: 2, title: "test2", body: "test2 description")
        arrayItems .append(item)
        arrayItems .append(item2)

    }
}
