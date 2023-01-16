//
//  TransferViewController.swift
//  Basic Banking App
//
//  Created by Khater on 1/2/23.
//

import UIKit

class TransferViewController: UIViewController {
    
    @IBOutlet weak var receiverLabel: UITextField!
    @IBOutlet weak var amountLabel: UITextField!
    
    let dbManager = DBManager()
    var pickerView = UIPickerView()
    var selectedReceiver: Customer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        receiverLabel.inputView = pickerView
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        guard let receiver = receiverLabel.text, !receiver.isEmpty,
              let amount = amountLabel.text, !amount.isEmpty
        else {
            let alert = UIAlertController(title: "Woops", message: "Please fill all fileds", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        if let selectedReceiver = selectedReceiver {
            dbManager.transferMoney(to: selectedReceiver.id, amount: Int64(amount)!) { [weak self] error in
                guard let self = self else { return }
                
                if let error = error {
                    let alert = UIAlertController(title: "Woops", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }

                Accounts.customers = self.dbManager.getUsers()
                Accounts.transctions = self.dbManager.getTransfers()
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}


// MARK: - UIPickerView DataSource
extension TransferViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Accounts.customers.count
    }
}


// MARK: - UIPickerView Delegate
extension TransferViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Accounts.customers[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        view.endEditing(true)
        selectedReceiver = Accounts.customers[row]
        receiverLabel.text = Accounts.customers[row].name
    }
}
