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
    
    // MARK: - Properties
    var schools = [School]()
    var filteredSchols: [School] = []
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var aboutButton: UIBarButtonItem!
    // MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkServices.getSchools { (schools) in
            self.schools = schools
            self.filteredSchols = schools
            self.tableView.reloadData()

        }
        
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        guard let input = searchTextField.text,
        !input.isEmpty else {
            filteredSchols = schools
            tableView.reloadData()
            return
        }
        filteredSchols = schools.filter({ (school: School) -> Bool in
            if school.name.lowercased().contains(input.lowercased()) {
                return true
            }
            return false
        })
        tableView.reloadData()
    }
    
    // MARK: - IBActions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filteredSchols.count == 0 {
            return schools.count
        } else {
            return filteredSchols.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolCell", for: indexPath) as! SchoolTableViewCell
        
        var school: School
        
        if filteredSchols.count == 0 {
            school = schools[indexPath.row]
            
        } else {
            school = filteredSchols[indexPath.row]
        }
        
        let url = URL(string: school.schoolURL)
        
        cell.school = school
        cell.imageOfSchool.kf.setImage(with: url)
        cell.imageOfSchool.layer.masksToBounds = true
        cell.imageOfSchool.layer.cornerRadius = 15
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var school: School
        if filteredSchols.count == 0 {
            school = schools[indexPath.row]
        } else {
            school = filteredSchols[indexPath.row]
        self.performSegue(withIdentifier: "displaySchoolInfo", sender: school)
        }
    }
    

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        searchTextField.text = ""
        filteredSchols = schools
        tableView.reloadData()
        
        
    }

//
//    func SchoolTableViewCellDidTapHeart(_ sender: SchoolTableViewCell) {
//        guard let tappedIndexPath = tableView.indexPath(for: sender) else { return }
//        print("Heart", sender, tappedIndexPath)
//       // schools[tappedIndexPath.row]
//    }
//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "displaySchoolInfo" {
            let school = sender as! School
            let displayAllInfoViewController = segue.destination as! DisplayAllInfoViewController
            displayAllInfoViewController.school = school
        }
    }
    
        
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    

}
