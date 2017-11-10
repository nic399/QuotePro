//
//  NewQuoteViewController.swift
//  QuotePro
//
//  Created by Nicholas Fung on 2017-11-09.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift

class NewQuoteViewController: UIViewController {

    @IBOutlet weak var quoteView: UIView!
    var quoteViewFromXib:QuoteView!
    
    
    var dataQuoteID:String = ""
    //let realm:Realm!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        quoteView.backgroundColor = UIColor.red
        quoteViewFromXib = QuoteView()
        quoteViewFromXib.translatesAutoresizingMaskIntoConstraints = false
        quoteView.addSubview(quoteViewFromXib)
        quoteViewFromXib.topAnchor.constraint(equalTo: quoteView.topAnchor).isActive = true
        quoteViewFromXib.bottomAnchor.constraint(equalTo: quoteView.bottomAnchor).isActive = true
        quoteViewFromXib.leftAnchor.constraint(equalTo: quoteView.leftAnchor).isActive = true
        quoteViewFromXib.rightAnchor.constraint(equalTo: quoteView.rightAnchor).isActive = true
        //getQuote(quote: quote)
        updateView()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        updateView()
//    }
    
    
    func updateView() {
        let realm = try! Realm()
        let quote = realm.objects(Quote.self).filter("quoteID == %@", self.dataQuoteID)
        print("passed primary key <\(self.dataQuoteID)>")
        print("Number of item in realm (on detail view): \(quote.count)")
        
        for testQuote in quote {
            print("\(testQuote)")
        }
        
//        let quote = realm.objects(Quote.self).filter("quoteID == %@", self.dataQuoteID).first!
//        let myView = quoteView as! QuoteView
        
        quoteViewFromXib.quoteAuthor = (quote.first?.author)!
        quoteViewFromXib.quoteText = (quote.first?.quoteText)!
        if quote.first?.photoData != nil {
            quoteViewFromXib.backgroundImage = UIImage(data: (quote.first?.photoData!)!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
