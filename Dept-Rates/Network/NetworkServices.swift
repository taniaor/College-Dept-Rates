//
//  NetworkServices.swift
//  Dept-Rates
//
//  Created by Tania Ortiz-Rosales on 7/24/18.
//  Copyright © 2018 Tania Ortiz-Rosales. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct NetworkServices {
    
    static func getSchools(completionHandler: @escaping ([School]) -> Void) {
        
        var schools = [School]()
        
        let apiToContact = "https://api.data.gov/ed/collegescorecard/v1/schools?school.state=ca&_fields=school.name,2015.cost.tuition.in_state,2015.admissions.admission_rate.overall,school.city,2015.student.size,2015.earnings.6_yrs_after_entry.mean_earnings.middle_tercile,2015.student.retention_rate.overall.full_time,2015.completion.rate_suppressed.overall&_per_page=100&_page=0&api_key=vE5dAJyLi2fMwtsw7dPWAuhJTR1LxMTK9MbHDTxp"
        
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            
            switch response.result {
            case .success:
                if let value = response.result.value {
                    
                    let json = JSON(value)
                    let results = json["results"].arrayValue
                    
                    for result in results {
                        let school = School(json: result)
                            schools.append(school)
                        }
                    print(schools.count)
                    print(schools)
                    return completionHandler(schools)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

