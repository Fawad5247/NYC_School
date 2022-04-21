//
//  AppDelegate.swift
//  NYCSchoolCodingChallenge
//
//  Created by fawad akhtar on 4/20/22.
//
import Foundation

protocol SchoolDetailsProtocol {
    func fetchSchoolList(completion: @escaping (Result<[SchoolDetailsModel], Error>)->Void)
}
