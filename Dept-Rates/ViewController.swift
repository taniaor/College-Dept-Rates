////
////  ViewController.swift
////  Dept-Rates
////
////  Created by Tania Ortiz-Rosales on 7/23/18.
////  Copyright © 2018 Tania Ortiz-Rosales. All rights reserved.
////
//
//import UIKit
//import Alamofire
//import SwiftyJSON
//
//class ViewController: UIViewController {
//    
//    override func viewDidLoad() {
//        let apiToContact = "http://api.data.gov/ed/collegescorecard/v1/schools.json?api_key=vE5dAJyLi2fMwtsw7dPWAuhJTR1LxMTK9MbHDTxp"
//        // This code will call the iTunes top 25 movies endpoint listed above
//        Alamofire.request(apiToContact).validate().responseJSON() { response in
//            switch response.result {
//            case .success:
//                if let value = response.result.value {
//                    let json = JSON(value)
//                    
//                    // Do what you need to with JSON here!
//                    // The rest is all boiler plate code you'll use for API requests
//                    
//                    
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//}

