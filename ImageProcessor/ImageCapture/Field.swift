//
//  Field.swift
//  ImageCapture
//
//  Created by Sphelele Zondo on 2018/07/26.
//  Copyright © 2018 ABBYY. All rights reserved.
//

import Foundation

struct Field: Codable {
    var fieldId:Int?
    var label:String?
    var value:Int?
    var fieldControlType:Int?
    var fieldDataType:Int?
    var choices:[String:String]?
    var fieldValidations:[FieldValidations]?
    var lookupType:Int?
    var lookupParent:Int?
    var validationMessage:String?
    var sliderMin:Int?
    var sliderMax:Int?
    var sliderInterval:Int?
}
