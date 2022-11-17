//
//  ViewController.swift
//  Quotes
//
//  Created by Cumali Atalan on 16.11.2022.
//

/*
 • Tek bir ekran üzerinde multiline(Uzunluğa göre satır sayısı değişmeli) label ve button olacak.
 • Buttona her bastığımda yeni bir random quote çekecek ve label içerisinde değeri gösterecek.
 • Uygulama ilk açıldığında random quote göstererek başlamalı.
 */
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quotesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.quotesLabel.numberOfLines = 0
        self.quotesLabel.sizeToFit()
        
        Client.getQuotes { quotes, error in
            let randomInt = Int.random(in: 0..<501)
            guard let firstQuotes = quotes?[randomInt] else { return }
            self.quotesLabel.text = String(firstQuotes.en ?? "")
        }
    }
    
    @IBAction func randomButtonClicked(_ sender: Any) {
        Client.getQuotes { quotes, weeoe in
            let randomInt = Int.random(in: 0..<501)
            guard let quotes = quotes?[randomInt] else { return }
            self.quotesLabel.text = String(quotes.en ?? "")
        }
    }
}
