//
//  ViewController.swift
//  task-master
//
//  Created by Yohan Wongso on 08/04/20.
//  Copyright © 2020 Yohan. All rights reserved.
//

import UIKit

//dummy data to render --- struct and class
struct goal {
    var namaGoals: String
    var missions: [String]
//    add goal property here ! ( if needed ! )
}
// define dummy goals to render
let dummyGoals = [
    goal(namaGoals: "Turun 10 Kg",
         missions: ["Makan kurang dari 2000 kalori","Minum Air putih setiap hari","lari pagi setiap hari"]),
    goal(namaGoals: "Belajar Swift",
         missions: [" Learn if-else"," Learn Loop"," Learn OOP"]),
    goal(namaGoals: "Punya Pacar",
         missions: ["buka tinder","jadi ganteng / cantik","jadi tajir"])
]
// dummy motivation message
let dummyMotivation = ["xcbxcxvxcvxcbxvxc","rtyrtyrtytryrty","fghfghhgfhfghgff","qweqwewqeqew","asdasdsadsadsa"]

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var goalsCV: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        ditambah 1 untuk motivation message
        return dummyGoals.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = goalsCV.dequeueReusableCell(withReuseIdentifier: "goalsCell", for: indexPath) as! GoalsCellCollectionViewCell
//        render goals
        if indexPath.row != 0{
            cell.backgroundColor = .blue
            cell.labelGoals.text = dummyGoals[indexPath.row-1].namaGoals + "\nProgress Bar"
            return cell
        }else {
//            initiate motivation message
            cell.backgroundColor = .red
            cell.labelGoals.text = "MOTIVATION MESSAGE : \n" + dummyMotivation[indexPath.row]
            return cell
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
