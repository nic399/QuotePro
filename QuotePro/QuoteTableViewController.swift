//
//  QuoteTableViewController.swift
//  QuotePro
//
//  Created by Nicholas Fung on 2017-11-09.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift

class QuoteTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    let realm = try! Realm()
    var quotes: Results<Quote>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quotes = self.realm.objects(Quote.self)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.allowsMultipleSelection = false
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath)
        
        let cellQuote = quotes[indexPath.row]
        cell.textLabel?.text = cellQuote.author
        cell.detailTextLabel?.text = cellQuote.quoteText
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    
    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toDetail" {
            let desination = segue.destination as? NewQuoteViewController
            let selectedQuote = quotes[(myTableView.indexPathForSelectedRow?.row)!]
            print("Original Quote: \(selectedQuote)")
            print("primary key to be passed <\(selectedQuote.quoteID)>")
            let myQuoteID = selectedQuote.quoteID
            let retrievedQuote = realm.object(ofType: Quote.self, forPrimaryKey: myQuoteID)
            print("Retrieved Quote: \(retrievedQuote)")
            desination?.dataQuoteID = selectedQuote.quoteID
            print("\(desination?.dataQuoteID)")
            print("Number of item in realm (on tableview): \(self.quotes.count)")
        }
    }
    

}
