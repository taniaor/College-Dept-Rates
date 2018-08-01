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
    let name: String
    let city: String
    let state: String
    let tuition: String?
    var amountOfStudents: String!
    let acceptanceRate: Double
    let retentionRate: Double
    let completionRate: Double
    let earning: String?
    

    init(json: JSON) {
        self.name = json["school.name"].stringValue
        self.tuition = json["2015.cost.tuition.in_state"].stringValue
        self.acceptanceRate = (json["2015.admissions.admission_rate.overall"].doubleValue)
        self.city = json["school.city"].stringValue
        self.state = json["school.state"].stringValue
        self.amountOfStudents = json["2015.student.size"].stringValue
        self.retentionRate = json["2015.student.retention_rate.overall.full_time"].doubleValue
        self.completionRate = json["2015.completion.rate_suppressed.overall"].doubleValue
        self.earning = json["2015.earnings.6_yrs_after_entry.mean_earnings.middle_tercile"].stringValue
    }

    
}
