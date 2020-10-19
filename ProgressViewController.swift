//
//  ProgressViewController.swift
//  MEDS App
//
//  Created by Roopak Phatak on 9/16/20.
//  Copyright © 2020 Roopak Phatak. All rights reserved.
//

import UIKit
import os.log

class ProgressViewController: UIViewController, UITextFieldDelegate {
    var data = [DailyData]()
    var pf: ProfileData?
    var dict : [String: DailyData] = [:]
    
    @IBOutlet weak var meditationLabel: UILabel!
    @IBOutlet weak var meditationField: UITextField!
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var exerciseField: UITextField!
    @IBOutlet weak var dietLabel: UILabel!
    @IBOutlet weak var dietField: UITextField!
    @IBOutlet weak var sleepLabel: UILabel!
    @IBOutlet weak var sleepField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        meditationField.delegate = self
        meditationField.isHidden = true
        meditationLabel.isUserInteractionEnabled = true
        exerciseField.delegate = self
        exerciseField.isHidden = true
        exerciseLabel.isUserInteractionEnabled = true
        dietField.delegate = self
        dietField.isHidden = true
        dietLabel.isUserInteractionEnabled = true
        sleepField.delegate = self
        sleepField.isHidden = true
        sleepLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(lblTapped))
        tapGesture.numberOfTapsRequired = 1
        meditationLabel.addGestureRecognizer(tapGesture)
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(lbl2Tapped))
        tapGesture2.numberOfTapsRequired = 1
        exerciseLabel.addGestureRecognizer(tapGesture2)
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(lbl3Tapped))
        tapGesture3.numberOfTapsRequired = 1
        dietLabel.addGestureRecognizer(tapGesture3)
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(lbl4Tapped))
        tapGesture3.numberOfTapsRequired = 1
        sleepLabel.addGestureRecognizer(tapGesture4)

        // Do any additional setup after loading the view.
        if data.isEmpty {
            meditationLabel.text = ""
            exerciseLabel.text = ""
            dietLabel.text = ""
            sleepLabel.text = ""
        }
    }
    @objc func lblTapped(){
        meditationLabel.isHidden = true
        meditationField.isHidden = false
        meditationField.text = meditationLabel.text
    }
    @objc func lbl2Tapped(){
        exerciseLabel.isHidden = true
        exerciseField.isHidden = false
        exerciseField.text = exerciseLabel.text
    }
    @objc func lbl3Tapped(){
        dietLabel.isHidden = true
        dietField.isHidden = false
        dietField.text = dietLabel.text
    }
    @objc func lbl4Tapped(){
        sleepLabel.isHidden = true
        sleepField.isHidden = false
        sleepField.text = sleepLabel.text
    }

    @IBAction func unwindToEntryList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ProfileViewController, let profile = sourceViewController.profile {
            // Add a new data entry.
            pf = profile
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        meditationField.isHidden = true
        meditationLabel.isHidden = false
        if meditationField.text != "" {
            meditationLabel.text = meditationField.text
        }
        exerciseField.isHidden = true
        exerciseLabel.isHidden = false
        if exerciseField.text != "" {
            exerciseLabel.text = exerciseField.text
        }
        dietField.isHidden = true
        dietLabel.isHidden = false
        if dietField.text != "" {
            dietLabel.text = dietField.text
        }
        sleepField.isHidden = true
        sleepLabel.isHidden = false
        if sleepField.text != "" {
            sleepLabel.text = sleepField.text
        }
        return true
    }
    @IBAction func sendData(_ sender: Any) {
        let m = meditationField.text ?? ""
        let e = exerciseField.text ?? ""
        let d = dietField.text ?? ""
        let s = sleepField.text ?? ""
        let entry1 = DailyData(meditation: m, exercise: e, diet: d, sleep: s)
        data.append(entry1)
        dict.updateValue(entry1, forKey: (pf?.getPhoneNum())!)
    }
    
}

