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

    static var schools = [School]()
    
    static func getSchools(completionHandler: @escaping ([School]) -> Void) {
        

        
        for pageNumber in 0...7 {
            
            //print("pageNumber:", pageNumber)
            
            let apiToContactGeneral = "https://api.data.gov/ed/collegescorecard/v1/schools?school.state=ca&_fields=2015.academics.program_percentage.education,2015.academics.program_percentage.psychology,2015.academics.program_percentage.engineering,2015.academics.program_percentage.biological,2015.academics.program_percentage.business_marketing,2015.academics.program.degree_or_certificate.education,2015.academics.program.degree_or_certificate.business_marketing,2015.academics.program.degree_or_certificate.biological,2015.academics.program.degree_or_certificate.psychology,school.school_url,2015.academics.program.degree_or_certificate.engineering,school.name,2015.cost.tuition.in_state,2015.admissions.admission_rate.overall,school.city,2015.student.size,2015.earnings.6_yrs_after_entry.mean_earnings.middle_tercile,2015.student.retention_rate.overall.full_time,2015.completion.rate_suppressed.overall&_per_page=100&_page=\(pageNumber)&api_key=vE5dAJyLi2fMwtsw7dPWAuhJTR1LxMTK9MbHDTxp"
            
            //print(apiToContactGeneral)
            
                        Alamofire.request(apiToContactGeneral).validate().responseJSON() { response in
            
                            switch response.result {
                            case .success:
                                if let value = response.result.value {
                                    let json = JSON(value)
                                    let results = json["results"].arrayValue
                                    for result in results {
                                        let school = School(json: result)
                                        if school.name.contains("Notre Dame de Namur") || school.name.contains("Life Pacific") {
                                            schools.append(school)
                                        }
                                        if school.acceptanceRate > 0.00 && School.creatingRating(school: school) != 1 {
                                            schools.append(school)
                                        }
                                        
                                    }
//                                   // print(schools.count)
//                                    for school in schools {
//                                    //    print(school.name)
//                                    }
                                    
                                    let sortedSchools = schools.sorted(by: { (previousSchool, currentSchool) in
                                        
                                        let previousSchoolRating = School.creatingRating(school: previousSchool) // ex: 2
                                        let currentSchoolRating = School.creatingRating(school: currentSchool) // ex: 3
                                        return previousSchoolRating < currentSchoolRating
                                        
                                    })
                                    
//                                    print(sortedSchools)
                                    return completionHandler(sortedSchools)
                                }
                            case .failure(let error):
                                print(error)
                            }
                        }
            
        }
        
    }
    
    static func getSchoolLogos(schools: [School]) {
        for school in schools {
            
            let apiToContact2 = "https://logo.clearbit.com/\(school.schoolURL)"
            print(apiToContact2)
            Alamofire.request(apiToContact2).validate().responseJSON() { response in
                switch response.result {
                case .success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        print(json)
                        
                        // Do what you need to with JSON here!
                        // The rest is all boiler plate code you'll use for API requests
                        
                        
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    

}


