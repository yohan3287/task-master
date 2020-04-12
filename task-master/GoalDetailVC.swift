//
//  GoalDetailVC.swift
//  task-master
//
//  Created by Yohan Wongso on 09/04/20.
//  Copyright © 2020 Yohan. All rights reserved.
//
// Referensi : https://www.swiftdevcenter.com/uidatepicker-as-input-view-to-uitextfield-swift/

import UIKit

struct mission {
    var missionName: String
    var missionIsCompleted: Bool
}
struct collaborator {
    var collaboratorName: String
    var collaboratorProgress: Float
}
struct goalTmp {// konflik nama goal
    var goalName: String
    var goalTimeStart: String
    var goalTimeEnd: String
    var missionsList: [mission]
    var colaboratorsList: [collaborator]
}
var goal01 = goalTmp(goalName: "berat badan turun 10Kg", // dummy data
                     goalTimeStart: "1 Jan 2020",
                     goalTimeEnd: "1 Dec 2020",
                     missionsList: [
                        mission(missionName: "push up 100x", missionIsCompleted: true),
                        mission(missionName: "lari 100Km", missionIsCompleted: false)],
                     colaboratorsList: [
                        collaborator(collaboratorName: "Anton", collaboratorProgress: 20),
                        collaborator(collaboratorName: "Marvin", collaboratorProgress: 70)])
var goal02 = goalTmp(goalName: "World class developer", // dummy data
                     goalTimeStart: "11 Feb 2020",
                     goalTimeEnd: "11 Oct 2021",
                     missionsList: [
                        mission(missionName: "Algorithm", missionIsCompleted: true),
                        mission(missionName: "Data Structure", missionIsCompleted: false)],
                     colaboratorsList: [
                        collaborator(collaboratorName: "Yohan", collaboratorProgress: 0),
                        collaborator(collaboratorName: "Titan", collaboratorProgress: 100)])
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
        goalList.append(goal01)
        goalList.append(goal02)
        
        self.goalTimeStartTextField.setInputViewDatePicker(target: self, selector: #selector(tapDoneFromGoalTimeStartDatePicker))
        self.goalTimeEndTextField.setInputViewDatePicker(target: self, selector: #selector(tapDoneFromGoalTimeEndDatePicker))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goal01.missionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MissionsListCell", for: indexPath)
        cell.textLabel?.text = goal01.missionsList[indexPath.row].missionName
        
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
