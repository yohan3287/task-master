//
//  GoalDetailVC.swift
//  task-master
//
//  Created by Yohan Wongso on 09/04/20.
//  Copyright © 2020 Yohan. All rights reserved.
//

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

class GoalDetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var titleVC: UINavigationItem!
    @IBOutlet weak var goalNameTextField: UITextField!
    @IBOutlet weak var goalTimeStartTextField: UITextField!
    @IBOutlet weak var goalTimeEndTextField: UITextField!
    @IBOutlet weak var missionsListTableView: UITableView!
   
        var datePickerView  : UIDatePicker = UIDatePicker()
        var datePickerView2 : UIDatePicker = UIDatePicker()
        @objc func dismissKeyboard() {
             //Causes the view (or one of its embedded text fields) to resign the first responder status.
             view.endEditing(true)
         }
         func didTap(sender: UITapGestureRecognizer) {
            _ = sender.location(in: view)
         }
         
        @objc func datePickerChanged(sender: UIDatePicker) {
                             let formatter = DateFormatter()
                         
            
                        formatter.dateFormat = "yyyy MM dd"
                       
                            goalTimeStartTextField.text = formatter.string(from: sender.date)
                          
                       }
    
    @objc func datePickerChanged2(sender: UIDatePicker) {
                          
                            let formatter2 = DateFormatter()
           
                   
                       formatter2.dateFormat = "yyyy MM dd"
                         
                           goalTimeEndTextField.text = formatter2.string(from: sender.date)
           
                      }
        func textFieldDidBeginEditing(_ textField: UITextField) {
            let datePicker = UIDatePicker()
            let datePicker2 = UIDatePicker()
            textField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
            datePicker2.addTarget(self, action: #selector(datePickerChanged2(sender:)), for: .valueChanged)
        }
//        @objc func donePick(){
//
//               let dateFormatter = DateFormatter()
//               dateFormatter.dateFormat = "yyyy-MM-dd"
//               goalTimeStartTextField.text = dateFormatter.string(from: datePickerView.date)
//               self.view.endEditing(true)
//           }
//
//        func displayDate(){
//                  let toolbar = UIToolbar()
//                  toolbar.sizeToFit()
//
//                  let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePick))
//                  toolbar.setItems([doneBtn], animated: false)
//
//                  goalTimeStartTextField.inputAccessoryView = toolbar
//
//                  goalTimeStartTextField.inputView = datePickerView
//              }
          
          

       
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        goalList.append(goal01)
        goalList.append(goal02)
        
        goalNameTextField.text = goal01.goalName
        goalTimeStartTextField.text = goal01.goalTimeStart
        goalTimeEndTextField.text = goal01.goalTimeEnd
    
    goalTimeStartTextField.delegate = self
        goalTimeEndTextField.delegate = self
        datePickerView2.datePickerMode = UIDatePicker.Mode.date
           datePickerView.datePickerMode = UIDatePicker.Mode.date
           goalTimeStartTextField.inputView = datePickerView
        goalTimeEndTextField.inputView = datePickerView2
      
           datePickerView.addTarget(self, action:
               Selector(("datePickerChanged:")), for: UIControl.Event.valueChanged)
        
           datePickerView2.addTarget(self, action:
           Selector(("datePickerChanged2:")), for: UIControl.Event.valueChanged)
        
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
               view.addGestureRecognizer(tap)
           let datePicker2 = UIDatePicker()
           let datePicker = UIDatePicker()
             
               datePickerView.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
               datePickerView2.addTarget(self, action: #selector(datePickerChanged2(sender:)), for: .valueChanged)
               goalTimeStartTextField.inputView = datePicker
               goalTimeEndTextField.inputView = datePicker2

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goal01.missionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MissionsListCell", for: indexPath)
        cell.textLabel?.text = goal01.missionsList[indexPath.row].missionName
        
        return cell
    }
    
    @IBAction func colaboratorButtonDidTab(_ sender: UIBarButtonItem) {
        
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
