//
//  AppDelegate.swift
//  NYCSchoolCodingChallenge
//
//  Created by fawad akhtar on 4/20/22.
//

import Foundation
import ObjectMapper


class NetworkManager {
    
    static let shared = NetworkManager()
    let session = URLSession.shared
    let url = URL(string: APIRoutes.fetchSchoolsAPIURL)!
    
    private init () {}
    
}

extension NetworkManager: SchoolDetailsProtocol {
    func fetchSchoolList(completion: @escaping (Result<[SchoolDetailsModel], Error>) -> Void) {
        let task = session.dataTask(with: url) { data, _ , error in
            //handle error here
            if let error = error {
                //log error and return
                completion(.failure(error))
                return
            }
            //get data from reposnse
            if let data = data {
                //get JSON from data
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                    //parse JSON to Model
                    if let parsedData = Mapper<SchoolDetailsModel>().mapArray(JSONObject: json) {
                        //retuen pasred Data
                        completion(.success(parsedData))
                    }
                }
            } else {
                //return error
                completion(.failure(error!))
            }
        }
        task.resume()
    }
}
