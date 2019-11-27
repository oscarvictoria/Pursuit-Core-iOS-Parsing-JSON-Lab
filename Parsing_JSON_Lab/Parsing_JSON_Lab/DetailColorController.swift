//
//  DetailColorController.swift
//  Parsing_JSON_Lab
//
//  Created by Oscar Victoria Gonzalez  on 11/26/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class DetailColorController: UIViewController {
    
    @IBOutlet weak var detailHexLabel: UILabel!
    @IBOutlet weak var detailrgbLabel: UILabel!
    
    var color: ColorData?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    func updateUI() {
        guard let colors = color else {
            fatalError("err,err")
        }
        var hexString = colors.hexString
        hexString.removeFirst()
        detailHexLabel.text = "HexString: \(hexString)"
        detailrgbLabel.text = "Red: \(colors.rgb["r"] ?? 0), Green: \(colors.rgb["g"] ?? 0), Blue: \(colors.rgb["b"] ?? 0)"
    }
}

