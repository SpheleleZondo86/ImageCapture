//
//  Field.swift
//  ImageCapture
//
//  Created by Sphelele Zondo on 2018/07/26.
//  Copyright © 2018 ABBYY. All rights reserved.
//

import Foundation

struct Field: Codable {
    var FieldId:Int?
    var Label:String?
    var Value:Int?
    var FieldControlType:Int?
    var FieldDataType:Int?
    var Choices:[String:String]?
    var FieldValidations:[FieldValidations]?
    var LookupType:Int?
    var LookupParent:Int?
    var ValidationMessage:String?
    var SliderMin:Int?
    var SliderMax:Int?
    var SliderInterval:Int?
}
