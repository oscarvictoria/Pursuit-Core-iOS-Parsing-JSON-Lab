//
//  RandomUserController.swift
//  Parsing_JSON_Lab
//
//  Created by Oscar Victoria Gonzalez  on 11/27/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class RandomUserController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var randomUser = [UserData]() {
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        randomUser = RandomUserData.getData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userDataDVC = segue.destination as? DetailRandomUserController,
            let IndexPath = tableView.indexPathForSelectedRow else {
                fatalError("err,err")
        }
        let userData = randomUser[IndexPath.row]
        userDataDVC.theData = userData
    }

}

extension RandomUserController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "randomCell", for: indexPath)
        
        let userData = randomUser[indexPath.row]
        cell.textLabel?.text = "\(userData.name["first"] ?? "") \(userData.name["last"] ?? "") "
        cell.detailTextLabel?.text = userData.email
        
        return cell
    }
}
