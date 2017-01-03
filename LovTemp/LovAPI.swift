//
//  LovAPI.swift
//  LovTemp
//
//  Created by Joakim Antman on 02/01/2017.
//  Copyright © 2017 Lovsala. All rights reserved.
//

import Foundation

public typealias ImageCallback = (Data) -> Void

public final class LovAPI: NSObject {
    public static let session = LovAPI()
    
    let configuration = LovApiConfiguration()
    
    var client: LovAPIClient!

    public override init() {
        super.init()
        self.client = LovAPIClient(parent: self)
    }
    
    func fetchLatestImage(user: String, callback: ImageCallback? = nil) {
        self.client.fetchLatestImage(user: user, callback: callback)
    }
}

public class LovApiConfiguration {
    let BASE_URL = "https://api.lovsala.com"
    var user: String!
    var api_key: String!
}

public class LovAPIClient {
    weak var parent: LovAPI!
    
    let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
    
    init(parent: LovAPI) {
        self.parent = parent
    }
    
    func fetchLatestImage(user: String, callback: ImageCallback? = nil) {
        let url = URL(string: "\(self.parent.configuration.BASE_URL)/image/latest?user=\(user)")!
        let config = URLSessionConfiguration.default
        
        config.httpAdditionalHeaders = ["Authorization" : authHeader()]
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url) { (data, response, err) in
            if let error = err {
                NSLog("API error: \(error)")
            }
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200:
                    if let imageData = data {
                        callback!(imageData)
                    }
                case 401:
                    NSLog("Unautorized")
                default:
                    NSLog("API returned response: %d %@", httpResponse.statusCode, HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))
                }
            }
        }
        
        task.resume()
    }
    
    private
    
    func authHeader() -> String {
        let loginString = String(format: "%@:%@", self.parent.configuration.user, self.parent.configuration.api_key)
        let loginData = loginString.data(using: String.Encoding.utf8)!

        return "Basic \(loginData.base64EncodedString())"
    }
}

