//
//  DisplayAllInfoViewController.swift
//  Dept-Rates
//
//  Created by Tania Ortiz-Rosales on 7/23/18.
//  Copyright © 2018 Tania Ortiz-Rosales. All rights reserved.
//

import UIKit

class DisplayAllInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var displayAmountOfStudents: UILabel!
    @IBOutlet weak var displayAceRateLabel: UILabel!
    @IBOutlet weak var displayTuitionLabel: UILabel!
    @IBOutlet weak var displayCityLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mTableView: UITableView!
    
    var school : School?
    var majorArray: [String] = []
    
//    let majors = ["Business (Marketing)", "Psychology", "Education", "Engineering", "Biology"]

    override func viewDidLoad() {
        super.viewDidLoad()
        if let school = school {
            let studentSize = String(school.amountOfStudents)
            let accRate = 100*(school.acceptanceRate)
            displayAmountOfStudents.text = ("\(studentSize)")
            displayTuitionLabel.text = ("\(school.tuition!)")
            displayAceRateLabel.text = ("\(accRate)%")
            displayCityLabel.text = ("\(school.city), CA")
            navigationItem.title = school.name
            imageView.image = #imageLiteral(resourceName: "make")
            for major in school.majors.keys {
                majorArray.append(major)
            }
            let url = URL(string: school.schoolURL)
            imageView.kf.setImage(with: url)
        }
        else {
            print("No school found")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "majorCell", for: indexPath) as! MajorTableViewCell
        
        let key = majorArray[indexPath.row]
        
        cell.majorLabel.text = key
        cell.majorRatingLabel.text = school?.majors[key]

        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return majorArray.count
    }
    
//    func createMajorRating(school: School) -> String {
//        let business = (100*(school.businessSize))
//        let psych = (100*(school.psychologySize))
//        let education = (100*(school.educationSize))
//        let biology = (100*(school.biologySize))
//        let engineering = (100*(school.engineeringSize))
//        if business >= 90 {
//            business == 1
//        }
//        return
//    }
    
    
}
