//
//  ColorsViewController.swift
//  Parsing_JSON_Lab
//
//  Created by Oscar Victoria Gonzalez  on 11/27/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var theColors = [ColorData]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    func loadData() {
        theColors = ColorData.getColors()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorDVC = segue.destination as? DetailColorController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("err,err")
        }
        
        let color = theColors[indexPath.row]
        colorDVC.color = color
    }

}

extension ColorsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        let colors = theColors[indexPath.row]
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
          
        
        cell.textLabel?.text = colors.name
        
        return cell
    }
}

extension ColorsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let colors = theColors[indexPath.row]
        let dictColors = colors.rgb
        let someColors = UIColor(red: CGFloat(dictColors["r"]!)/CGFloat(255),
                                 green: CGFloat(dictColors["g"]!)/CGFloat(255),
                                 blue: CGFloat(dictColors["b"]!)/CGFloat(255),
        alpha: 1)
        
        cell.backgroundColor = someColors
    }

}
