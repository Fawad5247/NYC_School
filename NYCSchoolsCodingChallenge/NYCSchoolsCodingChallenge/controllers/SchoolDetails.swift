//
//  AppDelegate.swift
//  NYCSchoolCodingChallenge
//
//  Created by fawad akhtar on 4/20/22.
//

import UIKit

class SchoolDetails: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var numOfSATLabel: UILabel!
    @IBOutlet weak var SATCriticalLabel: UILabel!
    @IBOutlet weak var SATMathLabel: UILabel!
    @IBOutlet weak var SATWritingLabel: UILabel!
    
    
    //MARK: - Variables
    var schoolDetails: SchoolDetailsModel?
    
    //MARK: - ViewLife Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    //MARK: - Private Methodes
    private func setUpView() {
        self.title = schoolDetails?.school_name
        if let schoolDetails = schoolDetails, let satTest = schoolDetails.num_of_sat_test_takers, let criticalAvg  = schoolDetails.sat_critical_reading_avg_score, let mathAvg = schoolDetails.sat_math_avg_score, let writingAvg = schoolDetails.sat_writing_avg_score  {
            numOfSATLabel.text = "Num of SAT" + " : " + satTest
            SATCriticalLabel.text = "SAT Critical Reading" + " : " + criticalAvg
            SATMathLabel.text = "SAT Math Avg." + " : " + mathAvg
            SATWritingLabel.text = "SAT Writting Avg." + " : " +  writingAvg
        }
    }
}



