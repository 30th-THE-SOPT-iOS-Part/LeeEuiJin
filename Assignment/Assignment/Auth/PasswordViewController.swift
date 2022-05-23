//
//  PasswordViewController.swift
//  Assignment Week1
//
//  Created by 이의진 on 2022/04/08.
//

import UIKit

class PasswordViewController: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var userPassword: UITextField!
    
    // MARK: - Properties
    var userName :String?
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.userPassword.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    // MARK: - UI
    private func configureUI(){
        self.navigationController?.navigationBar.topItem?.title=""
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "icn_back_24")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icn_back_24")
        self.navigationController?.navigationBar.tintColor = .black
        nextBtn.isEnabled = false
        nextBtn.backgroundColor = UIColor(displayP3Red: 100/255, green: 150/255, blue: 250/255, alpha: 1)
        nextBtn.titleLabel?.textColor = .white
    }
    
    //MARK: - @IBAction
    @IBAction func tabNextBtn(_ sender: Any) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else {return}
        if let userName = userName{
            welcomeVC.userName = userName
            welcomeVC.password = userPassword.text
            welcomeVC.isSignUp = true
        }
        welcomeVC.modalPresentationStyle = .pageSheet
        welcomeVC.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    //MARK: - Custom Methods
    /// Password TextField가 Fiiled 되면 버튼 활성화하는 메서드
    @objc func textFieldDidChange(_ sender: Any?) {
           if userPassword.hasText {
                 nextBtn.isEnabled = true
               } else {
               nextBtn.isEnabled = false
           }
       }

}
