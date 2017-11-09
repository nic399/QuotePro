//
//  ViewController.swift
//  QuotePro
//
//  Created by Nicholas Fung on 2017-11-08.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let quote = Quote()
        quote.author = "Me"
        quote.quoteText = "FML"
        

        
        try! self.realm.write {
            self.realm.add(quote)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var getQuote: UIButton!
    @IBAction func getQuotePressed(_ sender: Any) {
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
                        let quoteAuthor = json["quoteAuthor"] as! String
                        print("Quote: \(quoteText) ~By: \(quoteAuthor)")
                        
                    }
                }
            }
            task.resume()
        }
    }
    
}

