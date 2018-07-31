//
//  DisplayAllInfoViewController.swift
//  Dept-Rates
//
//  Created by Tania Ortiz-Rosales on 7/23/18.
//  Copyright © 2018 Tania Ortiz-Rosales. All rights reserved.
//

import UIKit

class DisplayAllInfoViewController: UIViewController {
    
    @IBOutlet weak var displayAmountOfStudents: UILabel!
    @IBOutlet weak var displayAceRateLabel: UILabel!
    @IBOutlet weak var displayTuitionLabel: UILabel!
    @IBOutlet weak var displayCityLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var school : School!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayAmountOfStudents.text = school.amountOfStudents
        displayTuitionLabel.text = ("$\(school.tuition!)")
        displayAceRateLabel.text = String(school.acceptanceRate)
        displayCityLabel.text = ("\(school.city), CA")
        navigationItem.title = school.name
        imageView.image = #imageLiteral(resourceName: "make")
        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
