//
//  GoalDetailVC.swift
//  task-master
//
//  Created by Yohan Wongso on 09/04/20.
//  Copyright © 2020 Yohan. All rights reserved.
//
// Referensi : https://www.swiftdevcenter.com/uidatepicker-as-input-view-to-uitextfield-swift/

import UIKit


var goalList: [goalTmp] = []

class GoalDetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var titleVC: UINavigationItem!
    @IBOutlet weak var goalNameTextField: UITextField!
    @IBOutlet weak var goalTimeStartTextField: UITextField!
    @IBOutlet weak var goalTimeEndTextField: UITextField!
    @IBOutlet weak var missionsListTableView: UITableView!
    
    @objc func tapDoneFromGoalTimeStartDatePicker() { // controller of done button from goal time start date picker
        if let datePicker = self.goalTimeStartTextField.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "dd MMM yyyy"
//            dateformatter.dateStyle = .medium
            self.goalTimeStartTextField.text = dateformatter.string(from: datePicker.date)
        }
        self.goalTimeStartTextField.resignFirstResponder()
    }
        
    @objc func tapDoneFromGoalTimeEndDatePicker() { // controller of done button from goal time end date picker
        if let datePicker = self.goalTimeEndTextField.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "dd MMM yyyy"
//            dateformatter.dateStyle = .medium
            self.goalTimeEndTextField.text = dateformatter.string(from: datePicker.date)
        }
        self.goalTimeEndTextField.resignFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        goalList = dummyGoals
        
        self.goalTimeStartTextField.setInputViewDatePicker(target: self, selector: #selector(tapDoneFromGoalTimeStartDatePicker))
        self.goalTimeEndTextField.setInputViewDatePicker(target: self, selector: #selector(tapDoneFromGoalTimeEndDatePicker))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalList[section].missionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MissionsListCell", for: indexPath)
        cell.textLabel?.text = goalList[indexPath.section].missionsList[indexPath.row].missionName
        
        return cell
    }
    
    @IBAction func collaboratorButtonDidTab(_ sender: Any) {
        performSegue(withIdentifier: "toCollab", sender: self)
    }
    
        
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
