//
//  LovAPI.swift
//  LovTemp
//
//  Created by Joakim Antman on 02/01/2017.
//  Copyright © 2017 Lovsala. All rights reserved.
//

import Foundation
    class LovAPI {
        let API_KEY = "SECRET"
        let BASE_URL = "https://api.lovsala.com"
        
        func fetchLatestImage(user: String, success: @escaping (Data) -> Void) {
            let loginString = String(format: "%@:%@", "jokke", API_KEY)
            let loginData = loginString.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            
            let url = URL(string: "https://api.lovsala.com/image/latest?user=front")!
            let config = URLSessionConfiguration.default
            let authString = "Basic \(base64LoginString)"
            config.httpAdditionalHeaders = ["Authorization" : authString]
            let session = URLSession(configuration: config)
            
            let task = session.dataTask(with: url)
                { (data, response, err) in
                    if let error = err {
                        NSLog("API error: \(error)")
                    }
                    if let httpResponse = response as? HTTPURLResponse {
                        switch httpResponse.statusCode {
                        case 200: // all good!
                            if let imageData = data {
                                success(imageData)
                            }
                        case 401: // unauthorized
                            NSLog("Unautorized")
                        default:
                            NSLog("API returned response: %d %@", httpResponse.statusCode, HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))
                        }
                    }
                
                }
            task.resume()
        }
    }

