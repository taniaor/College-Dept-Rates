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
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGradientLayer()
        beginSearch.layer.cornerRadius = 7
        imageView.image = UIImage(named:"finalbear")
    }
    
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        let colorOne = UIColor(red: 95/255, green: 95/255, blue:95/255, alpha:1)
        let colorTwo = UIColor(red: 229/255, green: 229/255, blue:229/255, alpha:1)
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

