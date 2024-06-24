//
//  PlaceHolderListRow.swift
//  SwiftUiWithCombine
//
//  Created by Vijaya Lakshmi on 6/21/24.
//

import SwiftUI

struct PlaceHolderListRow: View {
    let item: PlaceholderResponseModelElement
    var body: some View {
        VStack {
            Text(item.title)
                .font(.title)
                .foregroundColor(.red)
            Spacer()
            Text(item.body)
        }
    }
}

#Preview {
    PlaceHolderListRow(item: PlaceholderResponseModelElement(userId: 1, id: 1, title: "dummy title", body: "dummy body"))
}
