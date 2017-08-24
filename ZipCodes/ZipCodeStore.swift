//
//  ZipCodeStore.swift
//  ZipCodes
//
//  Created by Erica Millado on 8/23/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import Foundation

struct ZipCodeStore {
    //1 -
    static func readJson(completion: @escaping ([Int]) -> Void) {
        do {
            //2 -
            if let file = Bundle.main.url(forResource: "zipcodes", withExtension: "json") {
                //3 -
                let data = try Data(contentsOf: file)
                //4 -
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                //5 -
                if let object = json as? [String: [Int]] {
                    //6 -
                    if let zipArray = object["zip"] {
                        //7 - 
                        completion(zipArray)
                    }
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}








