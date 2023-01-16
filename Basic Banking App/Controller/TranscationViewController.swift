//
//  TranscationViewController.swift
//  Basic Banking App
//
//  Created by Khater on 1/2/23.
//

import UIKit

class TranscationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let dbManager = DBManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TransctionTableViewCell.nib(), forCellReuseIdentifier: TransctionTableViewCell.idenifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}


extension TranscationViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Accounts.transctions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransctionTableViewCell.idenifier, for: indexPath) as! TransctionTableViewCell
        
        let transcation = Accounts.transctions[indexPath.row]
        
        // Get sender ID
//        let sender = Accounts.customers.filter({ $0.id == transcation.sender })[0]
        // Get Receiver ID
        let receiver = Accounts.customers.filter({ $0.id == transcation.receiver })[0]
        
        cell.setup(receiver: receiver.name, amount: Int(transcation.amount))
        
        return cell
    }
}

extension TranscationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
