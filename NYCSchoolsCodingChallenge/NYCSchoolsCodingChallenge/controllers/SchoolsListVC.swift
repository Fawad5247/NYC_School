//
//  AppDelegate.swift
//  NYCSchoolCodingChallenge
//
//  Created by fawad akhtar on 4/20/22.
//

import UIKit

class SchoolsListVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var schoolListTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Variables
    var schoolList = [SchoolDetailsModel]()
    var selectedSchool: SchoolDetailsModel?
    
    //MARK: - ViewLife Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        fetchSchoolList() { _ in }
    }
    
    //MARK: - Private Methodes
    private func setUpView() {
        schoolListTableView.dataSource = self
        schoolListTableView.delegate = self
        activityIndicator.hidesWhenStopped = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! SchoolDetails
        destination.schoolDetails = selectedSchool
    }
}

//MARK: - UITableViewDelegate & UITableViewDataSource
extension SchoolsListVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = schoolListTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = schoolList[indexPath.row].school_name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSchool = schoolList[indexPath.row]
        self.performSegue(withIdentifier: "schoolDetail", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

//MARK: - SchoolDetailsProtocol
extension SchoolsListVC: SchoolDetailsProtocol {
    func fetchSchoolList(completion: @escaping (Result<[SchoolDetailsModel], Error>) -> Void) {
        activityIndicator.startAnimating()
        NetworkManager.shared.fetchSchoolList { [self] result in
            switch result {
            case .success(let details):
                schoolList = details
                DispatchQueue.main.async {
                    activityIndicator.stopAnimating()
                    self.schoolListTableView.reloadData()
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    activityIndicator.stopAnimating()
                    //can show alert on main thread related to error
                }
                print(error.localizedDescription)
            }
        }
    }
}
