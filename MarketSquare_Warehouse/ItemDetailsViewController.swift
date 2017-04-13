//
//  ItemDetailsViewController.swift
//  MarketSquare_Warehouse
//
//  Created by Husein Kareem on 4/2/17.
//  Copyright © 2017 MarketSquare. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    fileprivate let details = [
        "Photos",
        "Item Length",
        "Item Depth",
        "Item Height",
        "Seat Height",
        "Brand Label Photo",
        ]
    
    static func fromStoryboard() -> ItemDetailsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ItemDetailsViewController") as? ItemDetailsViewController
        return controller!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
    }

    @IBAction func saveButtonPressed(_ sender: Any) {
        //TODO: Persist and create item object
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        //TODO: Hit the endpoint and submit item
        self.present(ItemSubmissionViewController.fromStoryboard(), animated: true)
    }
}

extension ItemDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDetailIdentifier", for: indexPath)
        cell.textLabel?.text = self.details[indexPath.row]
        cell.detailTextLabel?.text = ""
        return cell
    }
}

extension ItemDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(ItemPhotosViewController.fromStoryboard(), animated: true)
        case 5:
            //TODO: Show image picker
            break
        default:
            let itemSpecsViewController = ItemSpecsViewController.fromStoryboard()
            itemSpecsViewController.specName = self.details[indexPath.row]
            self.navigationController?.pushViewController(itemSpecsViewController, animated: true)
        }
    }
}
