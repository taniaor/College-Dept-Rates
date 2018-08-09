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
import Kingfisher


class DiscoverSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var aboutButton: UIBarButtonItem!
    
    
    // MARK: - Properties
    var schools = [School]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var schoolsTableView: UITableView!
    

//    var isFavorited = false
    
    
    // MARK: - IBOutlets
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
//            NetworkServices.getSchoolLogos(schools: schools)
        }
        
        
        
        
    }
    
    // MARK: - IBActions
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolCell", for: indexPath) as! SchoolTableViewCell
        let school = schools[indexPath.row]
        cell.school = school
//        let imageURL = school.schoolURL
//        cell.imageOfSchool.kf.setImage(with: imageURL as? Resource)

        let url = URL(string: school.schoolURL)
        cell.imageOfSchool.kf.setImage(with: url)
        cell.imageOfSchool.layer.masksToBounds = true
        cell.imageOfSchool.layer.cornerRadius = 15
//        cell.heartButton.tag = indexPath.row
        
//        cell.heartButton.addTarget(self, action: #selector(printSchool), for: .touchUpInside)
        
        
//        cell.nameOfSchool.text = school.name
//        cell.imageOfSchool.image = #imageLiteral(resourceName: "make")
//        cell.ratingLabel.text = creatingRating(school: school)
//        cell.heartButton.tag = indexPath.row
//        cell.heartButton.addTarget(self, action: #selector(heartButtonTapped(_:)), for: .touchUpInside)
        return cell
    }


//    @objc func printSchool(sender: UIButton) {
//        guard let school = self.schools[sender.tag] as School? else {
//            return
//        }
//        let schoolToSave = CoreDataHelper.newSchool()
//
//    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let school = schools[indexPath.row]
        self.performSegue(withIdentifier: "displaySchoolInfo", sender: school)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools.count
    }
    
    func SchoolTableViewCellDidTapHeart(_ sender: SchoolTableViewCell) {
        guard let tappedIndexPath = tableView.indexPath(for: sender) else { return }
        print("Heart", sender, tappedIndexPath)
       // schools[tappedIndexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "displaySchoolInfo" {
            let school = sender as! School
            let displayAllInfoViewController = segue.destination as! DisplayAllInfoViewController
            displayAllInfoViewController.school = school
        }
//        if segue.identifier == "Favorites" {
//            let favorite = sender as! School
//            let favoritesViewController = segue.destination as! FavoritesViewController
//            FavoritesViewController
//        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
   
    
    func heartTapped(_ sender: Any) {
        print("Heart Tapped", sender)
    }
    

}//class
