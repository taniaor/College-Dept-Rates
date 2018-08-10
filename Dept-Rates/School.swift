//
//  School.swift
//  Dept-Rates
//
//  Created by Tania Ortiz-Rosales on 7/24/18.
//  Copyright © 2018 Tania Ortiz-Rosales. All rights reserved.
//

import Foundation
import SwiftyJSON

struct School: Codable {
    
    let majorsInString: [String] = ["education", "engineering", "biological", "business_marketing", "psychology"]
    let niceMajors: [String] = ["Education", "Engineering", "Biology", "Business", "Psychology"]
    
    var majors: [String:String] = [:]
    var name: String
    var city: String
    var state: String
    var tuition: String!
    var amountOfStudents: String
    var acceptanceRate: Double
    var retentionRate: Double
    var completionRate: Double
    var schoolURL: String
    
    init(json: JSON) {
        self.name = json["school.name"].stringValue
//        self.tuition = json["2015.cost.tuition.in_state"].doubleValue
        if json["2015.cost.tuition.in_state"] == JSON.null {
            self.tuition = "Not Avaliable"
        } else {
            self.tuition = "$\(json["2015.cost.tuition.in_state"].stringValue)"
        }
        self.acceptanceRate = json["2015.admissions.admission_rate.overall"].doubleValue
        self.city = json["school.city"].stringValue
        self.state = json["school.state"].stringValue
        self.amountOfStudents = json["2015.student.size"].stringValue
        if json["2015.student.retention_rate.overall.full_time"] == JSON.null {
            self.retentionRate = 0.00
        } else {
            self.retentionRate = json["2015.student.retention_rate.overall.full_time"].doubleValue
        }
        self.completionRate = json["2015.completion.rate_suppressed.overall"].doubleValue
        
        for major in majorsInString {
            let majorRating = json["2015.academics.program_percentage.\(major)"]
            if  majorRating == JSON.null || majorRating == 0{
                self.majors[niceMajors[majorsInString.index(of: major)!]] = "Major Not Offered"
            } else {
                self.majors[niceMajors[majorsInString.index(of: major)!]] = (String(Int(majorRating.doubleValue * 100)) + "%")
            }
        }
        
        var url = json["school.school_url"].stringValue
        if url.hasPrefix("www.") {
            url = String(url.dropFirst("www.".count))
        }
        
        self.schoolURL = "https://logo.clearbit.com/\(url)"
//        print(self.schoolURL)
        
    }
    
    
    static func creatingRating(school: School) -> Int {
        var count = 0
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
        return count
    }
    
    
}
