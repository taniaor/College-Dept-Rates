//
//  DiscoverSearchViewController.swift
//  Dept-Rates
//
//  Created by Tania Ortiz-Rosales on 7/23/18.
//  Copyright © 2018 Tania Ortiz-Rosales. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class DiscoverSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Properties
    var schools = [School]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    var rating: String = ""
    
    // MARK: - IBOutlets
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.reloadData()
//        tableView.delegate = self
//        tableView.dataSource = self
        NetworkServices.getSchools { (schools) in
            self.schools = schools
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolCell", for: indexPath) as! SchoolTableViewCell
        let school = schools[indexPath.row]
        
        cell.nameOfSchool.text = school.name
        cell.imageOfSchool.image = #imageLiteral(resourceName: "make")
        cell.ratingLabel.text = rating
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let school = schools[indexPath.row]
        self.performSegue(withIdentifier: "displaySchoolInfo", sender: school)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "displaySchoolInfo" {
            
            let school = sender as! School
            let displayAllInfoViewController = segue.destination as! DisplayAllInfoViewController
            displayAllInfoViewController.school = school
        }
    }
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        //code to save to other table view controller
    }
    
    func creatingRating() {
        var count = 0
        var rating = ""
        for overallRating in schools {
            if overallRating.acceptanceRate <= 1 && overallRating.acceptanceRate >= 0.8 {
                count = 1
                } else if overallRating.acceptanceRate <= 0.79 && overallRating.acceptanceRate > 0.60 {
                    count = 2
                } else if overallRating.acceptanceRate <= 0.59 && overallRating.acceptanceRate > 0.40 {
                    count = 3
                } else if overallRating.acceptanceRate < 0.39 && overallRating.acceptanceRate > 0.20 {
                    count = 4
                } else {
                    count = 5
            }
            if overallRating.completionRate < 1.0 && overallRating.completionRate >= 0.8 {
                count += 5
                } else if overallRating.completionRate <= 0.79 && overallRating.completionRate > 0.60 {
                    count += 4
                } else if overallRating.completionRate <= 0.59 && overallRating.completionRate > 0.40 {
                    count += 3
                } else if overallRating.completionRate < 0.39 && overallRating.completionRate > 0.20 {
                    count += 2
                } else {
                    count += 1
            }
            if overallRating.retentionRate <= 1 && overallRating.retentionRate >= 0.8 {
                count += 5
                } else if overallRating.retentionRate <= 0.79 && overallRating.retentionRate > 0.60 {
                    count += 4
                } else if overallRating.retentionRate <= 0.59 && overallRating.retentionRate > 0.40 {
                    count += 3
                } else if overallRating.retentionRate < 0.39 && overallRating.retentionRate > 0.20 {
                    count += 2
                } else {
                    count += 1
                }
            count = count / 3
        }
        if count <= 15 && count > 12{
            rating = String(count)
        } else if count <=  12 && count > 9 {
            rating = String(count)
        } else if count <= 9 && count > 6 {
            rating = String(count)
        } else if count <= 6 && count > 3 {
            rating = String(count)
        } else {
            rating = String(count)
        }
        print(rating)
    }
    
    
}//class
