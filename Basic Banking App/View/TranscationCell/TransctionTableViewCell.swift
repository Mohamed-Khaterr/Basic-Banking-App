//
//  TransctionTableViewCell.swift
//  Basic Banking App
//
//  Created by Khater on 1/2/23.
//

import UIKit

class TransctionTableViewCell: UITableViewCell {

    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var receiverLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    static let idenifier = "TransctionTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: idenifier, bundle: nil)
    }
    
    func setup(sender: String, receiver: String, amount: Int){
        senderLabel.text = sender
        receiverLabel.text = receiver
        amountLabel.text = "\(amount)$"
    }
}
