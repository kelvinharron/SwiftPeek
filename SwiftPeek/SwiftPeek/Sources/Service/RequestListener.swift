//
//  RequestListener.swift
//  SwiftPeek
//
//  Created by Kelvin Harron on 30/03/2025.
//

import Foundation

private let MAXIMUM_STORED_REQUESTS = 1000

protocol RequestListenerProtocol {
    func addRequest(_ model: NetworkRequest)
    func getRequests() -> [NetworkRequest]
    func removeAll()
    func remove(_ model: NetworkRequest)
}


final class RequestListener: RequestListenerProtocol {
    static let shared = RequestListener()
    
    private var requests: [NetworkRequest] = []
    private let queue = DispatchQueue(
        label: "com.kelvinharron.swiftpeek.httpdatasource",
        attributes: .concurrent
    )
    
    func addRequest(_ model: NetworkRequest) {
        guard let url = model.url, !url.absoluteString.isEmpty else {
            return
        }
    
        queue.sync(flags: .barrier) {
            if requests.count >= MAXIMUM_STORED_REQUESTS {
                requests.removeFirst()
            }
            
            guard !requests.contains(where: { $0.requestId == model.requestId }) else {
                return
            }
            
            requests.append(model)
        }
    }
    
    func getRequests() -> [NetworkRequest] {
        return queue.sync { requests }
    }
    
    func removeAll() {
        queue.async(flags: .barrier) {
            self.requests.removeAll()
        }
    }
    
    func remove(_ model: NetworkRequest) {
        queue.async(flags: .barrier) {
            self.requests.removeAll { $0.requestId == model.requestId }
        }
    }
}
