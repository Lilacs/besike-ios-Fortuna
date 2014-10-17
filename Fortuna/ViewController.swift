//
//  ViewController.swift
//  Fortuna
//
//  Created by 张鹏 on 14-10-17.
//  Copyright (c) 2014年 gotoitem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let path = NSBundle.mainBundle().pathForResource("positiveQuotes", ofType: "json")
    
    @IBOutlet weak var quotationTextView: UITextView!
    var delegate: AppDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = UIApplication.sharedApplication().delegate as AppDelegate
        displayRandomQuote()
    }
    
    
    @IBAction func rootViewTapped(sender: UITapGestureRecognizer) {
        displayRandomQuote()
    }
    
    func displayRandomQuote() {
        let usePositive = Int(arc4random_uniform(2)) == 0
        if(usePositive){
            displayRandomQuoteFrom(delegate.positiveQuotes)
        }else{
            displayRandomQuoteFrom(delegate.negativeQuotes)
        }
    }
    
    func displayRandomQuoteFrom(quote: [String]) {
        var random = Int(arc4random_uniform(UInt32(quote.count)))
        quotationTextView.text = quote[random]
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

