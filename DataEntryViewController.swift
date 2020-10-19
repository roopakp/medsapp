//
//  DataEntryViewController.swift
//  MEDS App
//
//  Created by Roopak Phatak on 9/18/20.
//  Copyright © 2020 Roopak Phatak. All rights reserved.
//

import UIKit
import os.log

class DataEntryViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var meditation: UITextField!
    @IBOutlet weak var exercise: UITextField!
    @IBOutlet weak var diet: UITextField!
    @IBOutlet weak var sleep: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var entry: DailyData?
    override func viewDidLoad() {
        super.viewDidLoad()
        meditation.delegate = self
        exercise.delegate = self
        diet.delegate = self
        sleep.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let m = meditation.text ?? ""
        let e = exercise.text ?? ""
        let d = diet.text ?? ""
        let s = sleep.text ?? ""
        entry = DailyData(meditation: m, exercise: e, diet: d, sleep: s)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
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
