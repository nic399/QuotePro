//
//  APIServices.swift
//  QuotePro
//
//  Created by Nicholas Fung on 2017-11-09.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

import Foundation

func getQuote(quote:Quote) {
    
    
    let urlStr = URL(string: "https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")
    
    if let url = urlStr {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Error: \(String(describing: error))")
            }
            else {
                if let usableData = data {
                    print("Data: \(usableData)")
                    guard let json = try? JSONSerialization.jsonObject(with: usableData, options: []) as! [String:Any] else {
                        print("Could not convert data to JSON")
                        return
                    }
                    let quoteText = json["quoteText"] as! String
                    var quoteAuthor = json["quoteAuthor"] as! String
                    if quoteAuthor.isEmpty {
                        quoteAuthor = "Unknown"
                    }
                    print("Quote: \(quoteText) ~By: \(quoteAuthor)")

                    quote.quoteText = quoteText
                    quote.author = quoteAuthor
                }
            }
        }
        task.resume()
    }
}
