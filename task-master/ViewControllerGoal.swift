//
//  ViewController.swift
//  task-master
//
//  Created by Yohan Wongso on 08/04/20.
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
//dummy data to render --- struct and class
struct goalTmp {// konflik nama goal
    var goalName: String
    var goalTimeStart: String
    var goalTimeEnd: String
    var missionsList: [mission]
    var colaboratorsList: [collaborator]
}

// define dummy goals to render

var dummyGoals = [
    goalTmp(goalName: "berat badan turun 10Kg", // dummy data
    goalTimeStart: "1 Jan 2020",
    goalTimeEnd: "1 Dec 2020",
    missionsList: [
       mission(missionName: "push up 100x", missionIsCompleted: true),
       mission(missionName: "lari 100Km", missionIsCompleted: false)],
    colaboratorsList: [
       collaborator(collaboratorName: "Anton", collaboratorProgress: 20),
       collaborator(collaboratorName: "Marvin", collaboratorProgress: 70)]),
    goalTmp(goalName: "World class developer", // dummy data
    goalTimeStart: "11 Feb 2020",
    goalTimeEnd: "11 Oct 2021",
    missionsList: [
       mission(missionName: "Algorithm", missionIsCompleted: true),
       mission(missionName: "Data Structure", missionIsCompleted: false)],
    colaboratorsList: [
       collaborator(collaboratorName: "Yohan", collaboratorProgress: 0),
       collaborator(collaboratorName: "Titan", collaboratorProgress: 100)])
]
// dummy motivation message
let dummyMotivation = ["Do or do not, there is no try!","Hate leads to anger, anger leads to suffering","fghfghhgfhfghgff","qweqwewqeqew","asdasdsadsadsa"]

class ViewControllerGoal: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var goalsCV: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        ditambah 1 untuk motivation message
        return dummyGoals.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = goalsCV.dequeueReusableCell(withReuseIdentifier: "goalsCell", for: indexPath) as! GoalsCellCollectionViewCell
//        render goals
        if indexPath.row != 0{
            cell.imageViewGoal.image = #imageLiteral(resourceName: "Motivation Button")
            cell.labelGoals.text = dummyGoals[indexPath.row-1].goalName + "\nProgress Bar"
            return cell
        }else {
//            initiate motivation message
            cell.imageViewGoal.image = #imageLiteral(resourceName: "Goals Button")
            cell.labelGoals.text = "MOTIVATION MESSAGE : \n" + dummyMotivation[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            return
        }else{
            goalDetailVCIsForDetailIndex = indexPath.row - 1
            performSegue(withIdentifier: "toGoalDetail", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addGoalDidTab(_ sender: UIBarButtonItem) {
        goalDetailVCIsForDetailIndex = -1
        performSegue(withIdentifier: "toGoalDetail", sender: self)
    }
    
    @IBAction func unwindToGoals(unwindSegue: UIStoryboardSegue){
        self.goalsCV.reloadData()
    }
    
}
