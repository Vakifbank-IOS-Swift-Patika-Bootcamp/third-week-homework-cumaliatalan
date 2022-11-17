//
//  BaseResponse.swift
//  ServiceCall
//
//  Created by Cumali Atalan on 16.11.2022.
//

import Foundation

struct BaseResponse: Codable {
    let status: Int
    let error: String
}

extension BaseResponse: LocalizedError {
    var errorDescription: String? {
        return error
    }
}
