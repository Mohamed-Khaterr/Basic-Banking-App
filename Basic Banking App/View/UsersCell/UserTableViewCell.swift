//
//  UserTableViewCell.swift
//  Basic Banking App
//
//  Created by Khater on 1/2/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    static let idenifier = "UserTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: idenifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(customer: Customer){
        idLabel.text = String(customer.id)
        nameLabel.text = customer.name
        emailLabel.text = customer.email
        balanceLabel.text = "\(customer.balance)$"
    }
}
