//
//  Extensions.swift
//  ImageCapture
//
//  Created by Sphelele Zondo on 2018/07/25.
//  Copyright © 2018 ABBYY. All rights reserved.
//

import Foundation

extension String {
        
    func parseFromJSON<D>(to type: D.Type) -> D? where D: Codable {
            
        let data: Data = self.data(using: .utf8)!
            
        let decoder = JSONDecoder()
            
        do {
            let _object = try decoder.decode(type, from: data)
            return _object
                
        } catch {
            return nil
        }
    }
    
    func getCurrentDateAsString() -> String {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        let second = components.second
        
        let todayString = String(year!) + "-" + String(month!) + "-" + String(day!) + "-" + String(hour!) + "-" + String(minute!) + "-" + String(second!)
        
        return todayString
    }
}

