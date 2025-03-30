//
//  NetworkRequest.swift
//  SwiftPeek
//
//  Created by Kelvin Harron on 29/03/2025.
//

import Foundation

enum RequestSerializer: UInt {
    case json = 0
    case form
}

struct NetworkRequest: Equatable, Hashable {
    let id: UUID = UUID()
    let url: URL?
    let requestData: Data?
    let responseData: Data?
    let requestId: String?
    let method: String?
    let statusCode: String?
    let mineType: String?
    let startTime: String?
    let endTime: String?
    let totalDuration: String?
    let isImage = false
    let requestHeaderFields: [String: Any]?
    let responseHeaderFields: [String: Any]?
    let isTag = false
    let isSelected = false
    let requestSerializer: RequestSerializer = .json
    let errorDescription: String?
    let errorLocalizedDescription: String?
    let size: String?
    var index: Int = .zero

    var isSuccess: Bool {
        errorDescription == nil || errorDescription?.isEmpty == true
    }

    static func == (lhs: NetworkRequest, rhs: NetworkRequest) -> Bool {
        return lhs.requestId == rhs.requestId &&
            lhs.method == rhs.method &&
            lhs.statusCode == rhs.statusCode &&
            lhs.startTime == rhs.startTime &&
            lhs.endTime == rhs.endTime &&
            lhs.totalDuration == rhs.totalDuration &&
            lhs.isImage == rhs.isImage &&
            lhs.isTag == rhs.isTag &&
            lhs.isSelected == rhs.isSelected &&
            lhs.requestSerializer == rhs.requestSerializer &&
            lhs.errorDescription == rhs.errorDescription &&
            lhs.errorLocalizedDescription == rhs.errorLocalizedDescription
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(requestId)
        hasher.combine(method)
        hasher.combine(statusCode)
        hasher.combine(startTime)
        hasher.combine(endTime)
        hasher.combine(totalDuration)
        hasher.combine(isImage)
        hasher.combine(isTag)
        hasher.combine(isSelected)
        hasher.combine(requestSerializer)
        hasher.combine(errorDescription)
        hasher.combine(errorLocalizedDescription)
    }
}
