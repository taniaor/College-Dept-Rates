//
//  SchoolTableViewCell.swift
//  Dept-Rates
//
//  Created by Tania Ortiz-Rosales on 7/26/18.
//  Copyright © 2018 Tania Ortiz-Rosales. All rights reserved.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {

    var school: School? = nil {
        didSet {
            nameOfSchool.text = school?.name
            ratingLabel.text = creatingRating(school: school!)
            imageOfSchool.image = #imageLiteral(resourceName: "make")
            
        }
    }
    
    @IBOutlet weak var nameOfSchool: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var imageOfSchool: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    
    var isFavorited = false
    
    
    //weak var delegate: SchoolTableViewCellDelegate?
    
    
//    @IBAction func heartTapped(_ sender: UIButton) {
////        var newCoreDataSchool = CoreDataHelper.newSchool()
////        newCoreDataSchool.acceptanceRate = school!.acceptanceRate
////        newCoreDataSchool.rententionRate = school!.retentionRate
////        newCoreDataSchool.amountOfStudents = school?.amountOfStudents
////        newCoreDataSchool.name = school!.name
////        newCoreDataSchool.city = school!.city
////        newCoreDataSchool.completionRate = school!.completionRate
////        newCoreDataSchool.state = school!.state
////        newCoreDataSchool.tuition = school!.tuition
////        newCoreDataSchool.isFavorited = school!.isFavorited
////        CoreDataHelper.saveSchool()
////        print()
//        //delegate?.SchoolTableViewCellDidTapHeart(self)
//    }
    
}

extension SchoolTableViewCell {
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
}
