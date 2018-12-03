//
//  MainViewController.swift
//  Students
//
//  Created by Sergey Osipyan on 12/3/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        networkClient.fetchStudents { (students, error) in
            if let error = error {
                NSLog("Error geting recipes: \(error)")
                return
            }
            self.students = students ?? []
    }
    }
    
    private var students: [Student] = [] {
        didSet {
            updateSort()
        }
    }
    private let networkClient = NetworkClient()
    private var studentsTableViewController: StudentsTableViewController!
    
    private func updateSort() {
        DispatchQueue.main.async {
            
        let sortStudents: [Student]
        if self.sortSelector.selectedSegmentIndex == 0 {
            sortStudents = self.students.sorted { $0.firstName < $1.firstName }
        } else {
            
            sortStudents = self.students.sorted { ($0.lastName ?? "") < ($1.lastName ?? "") }
        }
        self.studentsTableViewController.students = sortStudents
    }
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedStudentsTableView" {
            let studentsTableVC = segue.destination as! StudentsTableViewController
            studentsTableViewController = studentsTableVC
        }
    }
    
    @IBAction func sort(_ sender: Any) {
        updateSort()
    }
    
    @IBOutlet weak var sortSelector: UISegmentedControl!
    
    
  
}



