//
//  Networking.swift
//  HueMuse
//
//  Created by Pete Connor on 2/21/21.
//

import Foundation

class Networking {
    func getData() {
        
    var resultDisctionary = [NSDictionary]()
        
    let url = URL(string: "https://api.artic.edu/api/v1/artworks?page=1&limit=100")
    let request = URLRequest(url: url! as URL)
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    
    let task: URLSessionDataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
        if let data = data {
            if let responseDictionary = try! JSONSerialization.jsonObject(with: data, options:[]) as? NSDictionary {
                //NSLog("response: \(responseDictionary)")
                //print("response: \(responseDictionary)")
                
                //print(responseDictionary["results"] as? [NSDictionary])
                resultDisctionary.append(responseDictionary)
                print(resultDisctionary)
            }
        }
    })
    
    task.resume()
    }
}
