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
        return dummyGoals[section].namaGoals
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyGoals[section].missions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDoTableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath)
        cell.textLabel?.text = dummyGoals[indexPath.section].missions[indexPath.row]
        
        return cell
    }
    
    
    

    override func viewDidLoad() {
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
