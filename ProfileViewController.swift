//
//  ProfileViewController.swift
//  MEDS App
//
//  Created by Roopak Phatak on 10/4/20.
//  Copyright © 2020 Roopak Phatak. All rights reserved.
//

import UIKit
import os.log

class ProfileViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumTextField: UITextField!
    @IBOutlet weak var phoneNumLabel: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var profile: ProfileData?
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        nameTextField.isHidden = true
        nameLabel.isUserInteractionEnabled = true
        emailTextField.delegate = self
        emailTextField.isHidden = true
        emailLabel.isUserInteractionEnabled = true
        phoneNumTextField.delegate = self
        phoneNumTextField.isHidden = true
        phoneNumLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(lblTapped))
        tapGesture.numberOfTapsRequired = 1
        nameLabel.addGestureRecognizer(tapGesture)
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(lbl2Tapped))
        tapGesture2.numberOfTapsRequired = 1
        emailLabel.addGestureRecognizer(tapGesture2)
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(lbl3Tapped))
        tapGesture3.numberOfTapsRequired = 1
        phoneNumLabel.addGestureRecognizer(tapGesture3)
    }

    @objc func lblTapped(){
        nameLabel.isHidden = true
        nameTextField.isHidden = false
        nameTextField.text = nameLabel.text
    }
    @objc func lbl2Tapped(){
        emailLabel.isHidden = true
        emailTextField.isHidden = false
        emailTextField.text = emailLabel.text
    }
    @objc func lbl3Tapped(){
        phoneNumLabel.isHidden = true
        phoneNumTextField.isHidden = false
        phoneNumTextField.text = phoneNumLabel.text
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
        let n = nameLabel.text ?? ""
        let e = emailLabel.text ?? ""
        let p = phoneNumLabel.text ?? ""
        profile = ProfileData(name: n, email: e, phoneNum: p)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        nameTextField.isHidden = true
        nameLabel.isHidden = false
        if nameTextField.text != "" {
            nameLabel.text = nameTextField.text
        }
        emailTextField.isHidden = true
        emailLabel.isHidden = false
        if emailTextField.text != "" {
            emailLabel.text = emailTextField.text
        }
        phoneNumTextField.isHidden = true
        phoneNumLabel.isHidden = false
        if phoneNumTextField.text != "" {
            phoneNumLabel.text = phoneNumTextField.text
        }
        return true
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
