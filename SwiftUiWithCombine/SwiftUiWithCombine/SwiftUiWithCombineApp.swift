//
//  SwiftUiWithCombineApp.swift
//  SwiftUiWithCombine
//
//  Created by Vijaya Lakshmi on 6/21/24.
//

import SwiftUI

@main
struct SwiftUiWithCombineApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel(service: ContentService()))
        }
    }
}
