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
        let session = URLSession.shared
        let url = "https://fcdev03af.getbucks.com/api/Engagement/GetEngagementFlow"
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("GetBucks \(token)", forHTTPHeaderField: "Authorization")
        let engagementRequest = EngagementRequest(channel: 4, clientIdentifier: "560BD441-A119-44C4-B0A2-0BF607E30F85", messageId: "65271a27-681e-4b50-8b3b-80667963ce5", fields: [], subFlow: 0, resetSession: false, input: "", fileURL: "", base64File: base64Image, fileName: "AbbyImage3", fileMimeType: "", isNotice: false, channelId: 0, clientChannelId: "560BD441-A119-44C4-B0A2-0BF607E30F85")
        
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
