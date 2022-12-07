//
//  DetailsCatsViewController.swift
//  Cats
//
//  Created by Samir on 6/12/22.
//

import UIKit

class DetailsCatsViewController: UIViewController {

    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catName: UILabel!
    
    var name: String?
    var image: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = name {
            catName.text = name
        }
    }

}

