//
//  StartViewController.swift
//  ImageCapture
//
//  Created by Sphelele Zondo on 2018/07/25.
//  Copyright © 2018 ABBYY. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    var api = WebAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.getToken(username: "GB_ZA_App", password: "zxcc$nkjl!90m")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is RTRViewController{
            let rtrViewController = segue.destination as? RTRViewController
            rtrViewController?.token = api.token
            //let image:UIImage = UIImage(named: "Sea - rainy")!
            //let imageData:NSData = (UIImagePNGRepresentation(image)! as NSData)
            //let base64ImageString = imageData.base64EncodedString(options: .lineLength64Characters)
            //self.api.sendImage(token: self.api.token, base64Image: base64ImageString)
        }
    }
}
