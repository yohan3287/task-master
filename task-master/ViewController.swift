//
//  ViewController.swift
//  task-master
//
//  Created by Yohan Wongso on 08/04/20.
//  Copyright © 2020 Yohan. All rights reserved.
//

import UIKit

//dummy data to render, harusnya dibikin class and struct
let dummyGoals = ["a","b","c","d"]
let dummyMotivation = ["xcbxcxvxcvxcbxvxc","rtyrtyrtytryrty","fghfghhgfhfghgff","qweqwewqeqew","asdasdsadsadsa"]

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var goalsCV: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyGoals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = goalsCV.dequeueReusableCell(withReuseIdentifier: "goalsCell", for: indexPath) as! GoalsCellCollectionViewCell
        if indexPath.row != 0{
            cell.backgroundColor = .blue
            cell.labelGoals.text = dummyGoals[indexPath.row] + "\nProgress Bar"
        }else {
            cell.backgroundColor = .red
            cell.labelGoals.text = "MOTIVATION MESSAGE : \n" + dummyMotivation[indexPath.row]
        }
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
