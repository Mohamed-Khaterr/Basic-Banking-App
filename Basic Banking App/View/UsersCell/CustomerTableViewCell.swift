//
//  CustomerTableViewCell.swift
//  Basic Banking App
//
//  Created by Khater on 1/2/23.
//

import UIKit

class CustomerTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    static let idenifier = "CustomerTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: idenifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(customer: Customer){
        nameLabel.text = customer.name
        emailLabel.text = customer.email + ","
        idLabel.text = "ID: " + String(customer.id)
        balanceLabel.text = "\(customer.balance)$"
    }
}
