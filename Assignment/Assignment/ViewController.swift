//
//  ViewController.swift
//  Assignment Week1
//
//  Created by 이의진 on 2022/04/07.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // MARK - 
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var tabPasswordBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginEmail.clearButtonMode = .unlessEditing
        loginBtn.isEnabled = false
        self.loginEmail.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        self.loginPassword.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        tabPasswordBtn.setImage(UIImage(named:"password_hidden"), for: .normal)
        loginBtn.backgroundColor = UIColor(displayP3Red: 100/255, green: 150/255, blue: 250/255, alpha: 1)
        
    }
    @objc func textFieldDidChange(_ sender: Any?) {
        if loginEmail.hasText == true && loginPassword.hasText == true {
              loginBtn.isEnabled = true
            
            }
        else {
            loginBtn.isEnabled = false
        }
    }
  
    @IBAction func tabLoginBtn(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else {return}
        nextVC.modalPresentationStyle = .pageSheet
        nextVC.modalTransitionStyle = .crossDissolve
        nextVC.message2 = loginEmail.text
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func tabSigninBtn(_ sender: Any) {
        guard let nextVC =
                self.storyboard?.instantiateViewController(withIdentifier: "UserNameViewController") as? UserNameViewController else {return}
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func tabPasswordBtn(_ sender: Any) {
        if tabPasswordBtn.currentImage == UIImage(named: "password_hidden"){
            tabPasswordBtn.setImage(UIImage(named:"password_shown"), for: .normal)
            loginPassword.isSecureTextEntry = false
        }
        else {
            tabPasswordBtn.setImage(UIImage(named:"password_hidden"), for: .normal)
            loginPassword.isSecureTextEntry = true
        }
        
    }
}

