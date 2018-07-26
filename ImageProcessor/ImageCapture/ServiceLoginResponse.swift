//
//  ServiceLoginResponse.swift
//  ImageCapture
//
//  Created by Sphelele Zondo on 2018/07/25.
//  Copyright © 2018 ABBYY. All rights reserved.
//

import Foundation

struct ServiceLoginResponse:Codable {
    var ReplyStatus:Int?
    var ReplyMessage:String?
    var UniqueIdentifier:String?
    var TransactionRef:Int?
    
}
