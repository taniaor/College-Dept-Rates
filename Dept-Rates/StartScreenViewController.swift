//
//  StartScreenViewController.swift
//  Dept-Rates
//
//  Created by Tania Ortiz-Rosales on 7/23/18.
//  Copyright © 2018 Tania Ortiz-Rosales. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class StartScreenViewController: UIViewController {
    
    @IBOutlet weak var beginSearch: UIButton!
    var gradientLayer: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGradientLayer()
        
    }
    
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        let colorOne = UIColor(red: 44/255, green: 62/255, blue:80/255, alpha:1)
        let colorTwo = UIColor(red: 52/255, green: 152/255, blue:219/255, alpha:1)
        gradientLayer.colors = [colorOne.cgColor,colorTwo.cgColor]
        gradientLayer.locations = [0.1,1.0]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }


    @IBAction func beginSearchTapped(_ sender: UIButton) {
        
    }
    
    
}

