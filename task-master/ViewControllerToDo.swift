//
//  ViewControllerToDo.swift
//  task-master
//
//  Created by Antonius F Aulia on 09/04/20.
//  Copyright © 2020 Yohan. All rights reserved.
//

import UIKit

class ViewControllerToDo: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var toDoTableView: UITableView!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return goalsList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return goalsList[section].goalName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalsList[section].missionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDoTableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as! toDoTableViewCell
        cell.textLabel?.text = goalsList[indexPath.section].missionsList[indexPath.row].missionName
        cell.checkedView.isHidden = goalsList[indexPath.section].missionsList[indexPath.row].missionIsCompleted
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if goalsList[indexPath.section].missionsList[indexPath.row].missionIsCompleted == true{
            goalsList[indexPath.section].missionsList[indexPath.row].missionIsCompleted = false
        } else {
            goalsList[indexPath.section].missionsList[indexPath.row].missionIsCompleted = true
        }
//        goalsList[indexPath.section].goalProgressPercentage = countGoalProgressPercentageForGoalIndex(indexPath.section)
        self.toDoTableView.reloadData()
    }

    override func viewDidLoad() {
        self.toDoTableView.delegate = self
        self.toDoTableView.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
