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
    var collaboratorProgressPercentage: Float
}
//dummy data to render --- struct and class
struct goal {// konflik nama goal
    var goalName: String
    var goalProgressPercentage: Float
    var goalTimeStart: String
    var goalTimeEnd: String
    var missionsList: [mission]
    var colaboratorsList: [collaborator]
}

//func countGoalProgressPercentageForGoalIndex (_ goalIndex: Int) -> Float {
//    var goalProgressPercentage: Float = 0
//    var checkedMission: Int = 0
//
//    for mission in goalsList[goalIndex].missionsList {
//        if mission.missionIsCompleted == true {
//            checkedMission += 1
//        }
//    }
//
//    goalProgressPercentage = Float(checkedMission / goalsList[goalIndex].missionsList.count * 100)
//
//    return goalProgressPercentage
//}

// define dummy goals to render

var goalsList = [
    goal(goalName: "berat badan turun 10Kg", // dummy data
    goalProgressPercentage: 50,
    goalTimeStart: "1 Jan 2020",
    goalTimeEnd: "1 Dec 2020",
    missionsList: [
       mission(missionName: "push up 100x", missionIsCompleted: true),
       mission(missionName: "lari 100Km", missionIsCompleted: false)],
    colaboratorsList: [
       collaborator(collaboratorName: "Anton", collaboratorProgressPercentage: 20),
       collaborator(collaboratorName: "Marvin", collaboratorProgressPercentage: 70)]),
    goal(goalName: "World class developer", // dummy data
        goalProgressPercentage: 50,
    goalTimeStart: "11 Feb 2020",
    goalTimeEnd: "11 Oct 2021",
    missionsList: [
       mission(missionName: "Algorithm", missionIsCompleted: true),
       mission(missionName: "Data Structure", missionIsCompleted: false)],
    colaboratorsList: [
       collaborator(collaboratorName: "Yohan", collaboratorProgressPercentage: 0),
       collaborator(collaboratorName: "Titan", collaboratorProgressPercentage: 100)])
]

// dummy motivation message
let dummyMotivation = ["Do or do not, there is no try!","Hate leads to anger, anger leads to suffering","fghfghhgfhfghgff","qweqwewqeqew","asdasdsadsadsa"]

class ViewControllerGoal: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var goalsCV: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        ditambah 1 untuk motivation message
        return goalsList.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = goalsCV.dequeueReusableCell(withReuseIdentifier: "goalsCell", for: indexPath) as! GoalsCellCollectionViewCell
//        render goals
        if indexPath.row != 0{
            cell.imageViewGoal.image = #imageLiteral(resourceName: "Motivation Button")
            var progressCount : Float = 0.0
            //count progress
            for missionProgress in goalsList[indexPath.row-1].missionsList {
                if missionProgress.missionIsCompleted == true {
                    progressCount += 1
                }
            }
            //progress percentage
            goalsList[indexPath.row-1].goalProgressPercentage = progressCount / Float(goalsList[indexPath.row-1].missionsList.count) * 100
            
            if progressCount/Float(goalsList[indexPath.row-1].missionsList.count) == 1.0 {
                cell.labelGoals.text = goalsList[indexPath.row-1].goalName + "\nCompleted !"
                cell.progressBarGoal.isHidden = true
            } else {
                cell.progressBarGoal.isHidden = false
                cell.labelGoals.text = goalsList[indexPath.row-1].goalName + "\n\(Int(goalsList[indexPath.row-1].goalProgressPercentage)) %"
                cell.progressBarGoal.progress = progressCount/Float(goalsList[indexPath.row-1].missionsList.count)
            }
            
//            if  goalsList[indexPath.row-1].goalProgressPercentage == 100 {
//                cell.labelGoals.text = goalsList[indexPath.row-1].goalName + "\nCompleted !"
//                cell.progressBarGoal.isHidden = true
//            } else {
//                cell.progressBarGoal.isHidden = false
//                cell.labelGoals.text = goalsList[indexPath.row-1].goalName + "\n\(Int(goalsList[indexPath.row-1].goalProgressPercentage)) %"
//                cell.progressBarGoal.progress = goalsList[indexPath.row-1].goalProgressPercentage / 100
//            }
            
            return cell
        }else {
//            initiate motivation message
            cell.imageViewGoal.image = #imageLiteral(resourceName: "Goals Button")
            cell.labelGoals.text = "MOTIVATION MESSAGE : \n" + dummyMotivation[indexPath.row]
            cell.progressBarGoal.isHidden = true
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.goalsCV.reloadData()
    }
    
    override func viewDidLoad() {
        self.goalsCV.reloadData()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addGoalDidTab(_ sender: UIBarButtonItem) {
        goalDetailVCIsForDetailIndex = -1
        performSegue(withIdentifier: "toGoalDetail", sender: self)
        self.goalsCV.reloadData()
    }
    
    @IBAction func unwindToGoals(unwindSegue: UIStoryboardSegue){
        self.goalsCV.reloadData()
    }
    
}
