//
//  NewQuoteViewController.swift
//  QuotePro
//
//  Created by Nicholas Fung on 2017-11-09.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

import UIKit

class NewQuoteViewController: UIViewController {

    @IBOutlet weak var quoteView: UIView!
    
    let quote = Quote()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        quoteView.backgroundColor = UIColor.red
        let reuseableQuoteView = QuoteView()
        quoteView = reuseableQuoteView
        getQuote(quote: quote)
    }
    
    func updateView() {
        let myView = quoteView as! QuoteView
        myView.quoteAuthor = self.quote.author
        myView.quoteText = self.quote.quoteText
        if self.quote.photoData != nil {
            myView.backgroundImage = UIImage(data: self.quote.photoData!)
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
