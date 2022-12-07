//
//  CatsViewController.swift
//  Cats
//
//  Created by Samir on 6/12/22.
//

import UIKit

class CatsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    
    @IBOutlet weak var table: UITableView!
    
    var catsModel = CatsData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self
        table.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "CatsCell", for: indexPath) as! CatsViewCell
        
        cell.label.text = String(indexPath.row+1)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // Get in touch with the DetailViewController
        let detailViewController = segue.destination as! DetailsCatsViewController
        catsModel.getCats()
        // Pass on the data to the Detail ViewController by setting it's indexPathRow value
        detailViewController.name = "Hola"
    }
    

}
