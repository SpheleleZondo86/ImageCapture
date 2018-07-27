//
//  WebAPI.swift
//  ImageCapture
//
//  Created by Sphelele Zondo on 2018/07/25.
//  Copyright © 2018 ABBYY. All rights reserved.
//

import Foundation

class WebAPI {
    
    var token:String = ""
    var engagementResponse = EngagementResponse()
    
    
    func getToken(username:String, password:String){
        let session = URLSession.shared
        let url = "https://fcdev03af.getbucks.com/api/ServiceAuthentication/ServiceLogin"
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let serviceLogin = ServiceLoginRequest(userName: username, password: password)
        
        request.httpBody = try! JSONEncoder().encode(serviceLogin)
        let task = session.dataTask(with: request as URLRequest){
            data, response, error in
            guard error == nil && data != nil else{
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200{
                print("Error Code: \(httpStatus)")
            }
            let jsonResponseString = String(data: data!, encoding:String.Encoding.utf8)!
            let serviceLoginResponse = jsonResponseString.parseFromJSON(to: ServiceLoginResponse.self)
            self.token = serviceLoginResponse!.UniqueIdentifier!
            print("Token: \(self.token)")
        }
        task.resume()
    }
    
    func sendImage(token:String, base64Image:String){
        let currentDate = String()
        let session = URLSession.shared
        let url = "https://fcdev03af.getbucks.com/api/Engagement/GetEngagementFlow"
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("GetBucks \(token)", forHTTPHeaderField: "Authorization")
        let engagementRequest = EngagementRequest(Channel: 4, ClientIdentifier: "560BD441A11944C4B0A20BF607E30F85", MessageId: "65271a27681e4b508b3b80667963ce5", Fields: [], SubFlow: 0, ResetSession: false, Input: "", FileURL: "", Base64File: base64Image, FileName: "AbbyBankStatement\(currentDate.getCurrentDateAsString())", FileMimeType: "", IsNotice: false, ChannelId: 3, ClientChannelId: "560BD441A11944C4B0A20BF607E30F85")
        
        request.httpBody = try! JSONEncoder().encode(engagementRequest)
        let task = session.dataTask(with: request as URLRequest){
            data, response, error in
            guard error == nil && data != nil else{
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200{
                print("Error Code: \(httpStatus)")
            }
            let jsonResponseString = String(data: data!, encoding:String.Encoding.utf8)!
            self.engagementResponse = jsonResponseString.parseFromJSON(to: EngagementResponse.self)!
            print("Engagement Response: \(self.engagementResponse)")
        }
        task.resume()
    }
    
    
}
