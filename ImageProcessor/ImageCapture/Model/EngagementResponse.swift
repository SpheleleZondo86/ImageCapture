//
//  EngagementResponse.swift
//  ImageCapture
//
//  Created by Sphelele Zondo on 2018/07/26.
//  Copyright © 2018 ABBYY. All rights reserved.
//

import Foundation

struct EngagementResponse:Codable{
    var SubFlowTitle:String?
    var SubFlow:Int?
    var Fields:[Field]?
    var File:String?
    var FileName:String?
    var FileMimeType:String?
    var ReplyStatus:Int?
    var ReplyMessage:String?
    var UniqueIdentifier:String?
    var TransactionRef:Int?
}
