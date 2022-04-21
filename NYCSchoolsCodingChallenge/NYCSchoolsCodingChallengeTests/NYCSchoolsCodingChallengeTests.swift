//
//  AppDelegate.swift
//  NYCSchoolCodingChallenge
//
//  Created by fawad akhtar on 4/20/22.
//


import XCTest
@testable import NYCSchoolsCodingChallenge

class NYCSchoolsCodingChallengeTests: XCTestCase {

    func test_Verify_API_URL() {
        //Arrange
        let apiURL = APIRoutes.fetchSchoolsAPIURL
        //Act
        
        //Assert
        XCTAssertEqual(apiURL, "https://data.cityofnewyork.us/resource/734v-jeq5.json")
    }
    
    
    func test_Check_SchoolList_Request_Failure() {
        NetworkManager.shared.fetchSchoolList { result in
            switch result {
            case .failure(_):
                    XCTFail()
            case .success(_): break
            }
        }
    }
}
