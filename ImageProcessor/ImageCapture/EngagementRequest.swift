//
//  EngagementRequest.swift
//  ImageCapture
//
//  Created by Sphelele Zondo on 2018/07/25.
//  Copyright © 2018 ABBYY. All rights reserved.
//

import Foundation

struct EngagementRequest:Codable {
    var channel:Int
    var clientIdentifier:String
    var messageId:String
    var fields:[Field]
    var subFlow:Int
    var resetSession:Bool
    var input:String
    var fileURL:String
    var base64File:String
    var fileName:String
    var fileMimeType:String
    var isNotice:Bool
    var channelId:Int
    var clientChannelId:String
}
