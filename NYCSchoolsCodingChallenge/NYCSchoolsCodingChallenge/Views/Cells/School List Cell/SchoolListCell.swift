//
//  AppDelegate.swift
//  NYCSchoolCodingChallenge
//
//  Created by fawad akhtar on 4/20/22.
//

import UIKit

class SchoolListCell: UITableViewCell {
    
    
    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var schoolNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUpCell() {
        cellBackground.layer.cornerRadius = 8
    }
    
    func configCell(schoolName: String) {
        schoolNameLabel.text = schoolName
    }
    
}
