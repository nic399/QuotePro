//
//  QuoteView.swift
//  QuotePro
//
//  Created by Nicholas Fung on 2017-11-08.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

import UIKit

class QuoteView: UIView {
    
    // MARK: Public properties
    
    var quoteText:String = "Quote text here" {
        didSet {
            setupView()
        }
    }
    
    var quoteAuthor:String = "Quote author name" {
        didSet {
            setupView()
        }
    }
    
    var backgroundImage:UIImage? = nil {
        didSet {
            setupView()
        }
    }
    
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    
    @IBOutlet private weak var quoteLabel: UILabel!
    
    @IBOutlet private weak var authorLabel: UILabel!
    

    // MARK: Private properties
    
    private var contentView: UIView!
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        // Called when view is created from code
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Called when view is created from XIB
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func prepareForInterfaceBuilder() {
        // Called when view is live rendered on Storyboard
        super.prepareForInterfaceBuilder()
        commonInit()
    }
    
    fileprivate func setupView() {
        quoteLabel.text = quoteText
        authorLabel.text = quoteAuthor
        backgroundImageView.image = backgroundImage
    }
    
    private func commonInit() {
        setupFromXib()
        setupView()
    }
    private func setupFromXib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "QuoteView", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {
            assertionFailure("Unable to load XIB file for QuoteView")
            return
        }
        
        contentView = view
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

}
