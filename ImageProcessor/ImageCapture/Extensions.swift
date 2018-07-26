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
}

