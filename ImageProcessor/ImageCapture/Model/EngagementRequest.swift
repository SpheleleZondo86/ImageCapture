//
//  EngagementRequest.swift
//  ImageCapture
//
//  Created by Sphelele Zondo on 2018/07/25.
//  Copyright © 2018 ABBYY. All rights reserved.
//

import Foundation

struct EngagementRequest:Codable {
    var Channel:Int
    var ClientIdentifier:String
    var MessageId:String
    var Fields:[Field]
    var SubFlow:Int
    var ResetSession:Bool
    var Input:String
    var FileURL:String
    var Base64File:String
    var FileName:String
    var FileMimeType:String
    var IsNotice:Bool
    var ChannelId:Int
    var ClientChannelId:String
}
