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
import CoreData


class DiscoverSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Properties
    var schools = [School]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    var isFavorited = false
    let image1 = UIImage(named: "blank_heart") as UIImage?
    let image2 = UIImage(named: "filled_heart") as UIImage?
    let image4 = UIImage(named: "star_filled") as UIImage?
    let image5 = UIImage(named: "star_blank") as UIImage?
    
    // MARK: - IBOutlets
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var starLabel: UILabel!

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
    
    // MARK: - IBActions
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolCell", for: indexPath) as! SchoolTableViewCell
        let school = schools[indexPath.row]
        cell.nameOfSchool.text = school.name
        cell.imageOfSchool.image = #imageLiteral(resourceName: "make")
        cell.ratingLabel.text = creatingRating(school: school)
        //cell.starLabel.text = creatingRating(school: school)
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
    
//    @IBAction func heartButtonTapped(_ sender: UIButton) {
//        if isFavorited == true {
//            let image = UIImage(named: "blank_heart")
//            sender.setImage(image, for: .normal)
//        } else {
//            let image = UIImage(named: "filled_heart")
//            sender.setImage(image, for: .normal)
//        }
//        isFavorited = !isFavorited
//        UserDefaults.standard.set(isFavorited, forKey: "isFavorited")
//        UserDefaults.standard.synchronize()
//    }
    
    

    func creatingRating(school: School) -> String {
        var count = 0
        var rating = ""
        let acp = (100*school.acceptanceRate)
        let ret = (100*school.retentionRate)
        let comp = (100*school.completionRate)
        if acp == 0 {
            count = 1
        } else if acp <= 100 && acp > 80{
            count = 1
        } else if acp <= 80 && acp > 60 {
            count = 2
        } else if acp <= 60 && acp > 40 {
            count = 3
        } else if acp <= 40 && acp > 20 {
            count = 4
        } else {
            count = 5
        }
        if ret == 0 {
            count += 1
        } else if ret <= 100 && ret > 90 {
            count += 5
        } else if ret <= 90 && ret > 80 {
            count += 4
        } else if ret <= 80 && ret > 70 {
            count += 3
        } else if ret <= 70 && ret > 60 {
            count += 2
        } else {
            count += 1
        }
        if comp == 0 {
            count += 1
        } else if comp <= 100 && comp > 90 {
            count += 5
        } else if comp <= 90 && comp > 80 {
            count += 4
        } else if comp <= 80 && comp > 70 {
            count += 3
        } else if comp <= 70 && comp > 60 {
            count += 2
        } else {
            count += 1
        }
        count = count / 3
        rating = String(count)
        return rating
    }
    
//    func createImage(rating: String) -> UIImage {
//
//    }
    

}//class
