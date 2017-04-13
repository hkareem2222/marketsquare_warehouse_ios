//
//  ItemSpecsViewController.swift
//  MarketSquare_Warehouse
//
//  Created by Husein Kareem on 3/22/17.
//  Copyright © 2017 MarketSquare. All rights reserved.
//

import UIKit

class ItemSpecsViewController: UIViewController {
    
    var specName: String = ""
    
    @IBOutlet private var titleLabel: UILabel!
    
    static func fromStoryboard() -> ItemSpecsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ItemSpecsViewController") as? ItemSpecsViewController
        return controller!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.specName
        self.titleLabel.text = self.specName
    }
}
