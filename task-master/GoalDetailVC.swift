//
//  GoalDetailVC.swift
//  task-master
//
//  Created by Yohan Wongso on 09/04/20.
//  Copyright © 2020 Yohan. All rights reserved.
//
// Referensi : https://www.swiftdevcenter.com/uidatepicker-as-input-view-to-uitextfield-swift/

import UIKit

var goalTemp: goalTmp = goalTmp(goalName: "test", goalTimeStart: "test", goalTimeEnd: "", missionsList: [], colaboratorsList: [])
var goalDetailVCIsForDetailIndex: Int = -1

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
//        goalList = dummyGoals
        if goalDetailVCIsForDetailIndex >= 0 {
            self.navigationItem.title = "Goal Detail"
            goalTemp = dummyGoals[goalDetailVCIsForDetailIndex]
        }
        else{
            self.navigationItem.title = "Add Goal"
        }
        
        goalNameTextField.text = goalTemp.goalName
        goalTimeStartTextField.text = goalTemp.goalTimeStart
        goalTimeEndTextField.text = goalTemp.goalTimeEnd
        
        self.missionsListTableView.isEditing = !self.missionsListTableView.isEditing
        self.missionsListTableView.allowsSelectionDuringEditing = true
        
        self.goalTimeStartTextField.setInputViewDatePicker(target: self, selector: #selector(tapDoneFromGoalTimeStartDatePicker))
        self.goalTimeEndTextField.setInputViewDatePicker(target: self, selector: #selector(tapDoneFromGoalTimeEndDatePicker))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalTemp.missionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MissionsListCell", for: indexPath)
        cell.textLabel?.text = goalTemp.missionsList[indexPath.row].missionName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) { // delete row & the data
        if editingStyle == .delete {
            goalTemp.missionsList.remove(at: indexPath.row)
            self.missionsListTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveObjTemp = goalTemp.missionsList[sourceIndexPath.item]
        goalTemp.missionsList.remove(at: sourceIndexPath.item)
        goalTemp.missionsList.insert(moveObjTemp, at: destinationIndexPath.item)
    }
    
    @IBAction func collaboratorButtonDidTab(_ sender: Any) {
        performSegue(withIdentifier: "toCollab", sender: self)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        inputMissionAlert(indexPath.row)
    }
    
    @IBAction func addMissionButton(_ sender: UIButton) {
        inputMissionAlert(-1)
    }
    
    public func inputMissionAlert(_ index : Int){
        var alertTitle: String = ""
        if index >= 0 {
            alertTitle = "Edit Mission"
        }
        else{
            alertTitle = "Add Mission"
        }
        let alertController = UIAlertController(title: alertTitle, message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addTextField(configurationHandler: nil)
        
        let addMissionAction = UIAlertAction(title: "Done", style: .default) { _ in
            if let missionTextField = alertController.textFields?.first?.text {
                let errorLabel = UILabel(frame: CGRect(x: 0, y: 40, width: 270, height: 18))
                errorLabel.textAlignment = .center
                errorLabel.textColor = .red
                errorLabel.font =  errorLabel.font.withSize(12)
                alertController.view.addSubview(errorLabel)
                
                if missionTextField.isEmpty {
                    //alertController.message = "jangan kosong"
                    errorLabel.text = "Please fill the mission"
                    self.present(alertController, animated: true, completion: nil)
                }else {
                    if index >= 0 {
                        goalTemp.missionsList[index].missionName = missionTextField
                    }
                    else{
                        let missionTemp = mission(missionName: missionTextField, missionIsCompleted: false)
                        goalTemp.missionsList.append(missionTemp)
                    }
                    self.missionsListTableView.reloadData()
                }
            }
        }
        alertController.addAction(addMissionAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        if let a = goalTimeStartTextField.text,
            let b = goalTimeEndTextField.text,
            let c = goalNameTextField.text
        {
            goalTemp.goalTimeStart = a
            goalTemp.goalTimeEnd = b
            goalTemp.goalName = c
        }
        
        if goalDetailVCIsForDetailIndex >= 0 {
            dummyGoals[goalDetailVCIsForDetailIndex] = goalTemp
        }
        else{
            dummyGoals.append(goalTemp)
        }
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
