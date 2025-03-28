//
//  SwiftPeekView.swift
//  SwiftPeek
//
//  Created by Kelvin Harron on 28/03/2025.
//

import SwiftUI

struct SwiftPeekView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("SwiftPeek - Network Traffic")
                    .font(.largeTitle)
                    .padding()
                Spacer()

                Button("Close") {
                    SwiftPeekManager.shared.dismiss()
                }
                .padding()
            }
            .navigationBarTitle("SwiftPeek", displayMode: .inline)
        }
    }
}
