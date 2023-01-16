//
//  HomeViewController.swift
//  Basic Banking App
//
//  Created by Khater on 1/2/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let dbManager = DBManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CustomerTableViewCell.nib(), forCellReuseIdentifier: CustomerTableViewCell.idenifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.reloadData()
    }
    
    // Show Transcation History
    @IBAction func historyButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "fromHomeToTranscations", sender: self)
    }
    
    @IBAction func plusButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "formHomeToTransfer", sender: self)
    }
    
}


// MARK: - UITableView DataSource
extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Accounts.customers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomerTableViewCell.idenifier, for: indexPath) as! CustomerTableViewCell
        cell.setup(customer: Accounts.customers[indexPath.row])
        return cell
    }
}


// MARK: - UITableView Delegate
extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

