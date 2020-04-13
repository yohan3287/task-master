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
        return dummyGoals.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dummyGoals[section].goalName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyGoals[section].missionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDoTableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as! toDoTableViewCell
        cell.textLabel?.text = dummyGoals[indexPath.section].missionsList[indexPath.row].missionName
        cell.checkedView.isHidden = dummyGoals[indexPath.section].missionsList[indexPath.row].missionIsCompleted
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if dummyGoals[indexPath.section].missionsList[indexPath.row].missionIsCompleted == true{
            dummyGoals[indexPath.section].missionsList[indexPath.row].missionIsCompleted = false
        } else {
            dummyGoals[indexPath.section].missionsList[indexPath.row].missionIsCompleted = true
        }
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
