//
//  ItemSubmissionViewController.swift
//  MarketSquare_Warehouse
//
//  Created by Husein Kareem on 4/2/17.
//  Copyright © 2017 MarketSquare. All rights reserved.
//

import UIKit

class ItemSubmissionViewController: UIViewController {
    
    var isSuccessful: Bool = true
    
    static func fromStoryboard() -> ItemSubmissionViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ItemSubmissionViewController") as? ItemSubmissionViewController
        return controller!
    }
}
