//
//  AppDelegate.swift
//  NYCSchoolCodingChallenge
//
//  Created by fawad akhtar on 4/20/22.
//


import Foundation
import ObjectMapper

struct SchoolDetailsModel : Mappable {
	var dbn : String?
	var school_name : String?
	var num_of_sat_test_takers : String?
	var sat_critical_reading_avg_score : String?
	var sat_math_avg_score : String?
	var sat_writing_avg_score : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		dbn <- map["dbn"]
		school_name <- map["school_name"]
		num_of_sat_test_takers <- map["num_of_sat_test_takers"]
		sat_critical_reading_avg_score <- map["sat_critical_reading_avg_score"]
		sat_math_avg_score <- map["sat_math_avg_score"]
		sat_writing_avg_score <- map["sat_writing_avg_score"]
	}
}
