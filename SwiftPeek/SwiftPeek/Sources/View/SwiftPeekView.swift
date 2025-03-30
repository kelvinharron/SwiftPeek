//
//  SwiftPeekView.swift
//  SwiftPeek
//
//  Created by Kelvin Harron on 28/03/2025.
//

import SwiftUI

enum RequestRoute: Hashable {
    case requestDetail(NetworkRequest)
}

struct SwiftPeekView: View {
    @State private var networkRequests: [NetworkRequest] = []

    var body: some View {
        NavigationStack {
            Form {
                Section {
//                    if networkRequests.isEmpty {
//                        Text("No network requests recorded")
//                            .foregroundColor(.secondary)
//                    } else {
                    ForEach(networkRequests, id: \.id) { request in
                        NavigationLink(value: RequestRoute.requestDetail(request)) {
                            VStack {
                                Text("Unknown URL")
                                Text("HHH")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
//                    }
                }
            }
        }
        .navigationBarTitle("Network Requests", displayMode: .inline)
        .navigationDestination(for: RequestRoute.self) { route in
            switch route {
            case .requestDetail(let request):
                RequestDetailView(networkRquest: request)
            }
        }
    }
}
