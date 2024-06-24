//
//  ContentView.swift
//  SwiftUiWithCombine
//
//  Created by Vijaya Lakshmi on 6/21/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(viewModel.arrayItems) {item in
                        PlaceHolderListRow(item: item)
                    }
                }
            }.navigationTitle("Contents List")
        }
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel(service: ContentService()))
}
