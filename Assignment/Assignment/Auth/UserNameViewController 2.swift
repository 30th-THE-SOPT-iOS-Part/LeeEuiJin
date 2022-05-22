//
//  UserNameViewController.swift
//  Assignment Week1
//
//  Created by 이의진 on 2022/04/08.
//

import UIKit

class UserNameViewController: UIViewController {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var userName: UITextField!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBarUI()
        setUpNextBtn()
        self.userName.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    // MARK: - UI
    
    private func configureNavigationBarUI(){
        self.navigationController?.navigationBar.topItem?.title=""
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "icn_back_24")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icn_back_24")
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    private func setUpNextBtn(){
        nextBtn.isEnabled = false
        nextBtn.backgroundColor = UIColor(displayP3Red: 100/255, green: 150/255, blue: 250/255, alpha: 1)
    }
    
    // MARK: - @IBAction
    @IBAction func tabToPassword(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "PasswordViewController") as? PasswordViewController else {return}
        nextVC.userName = userName.text
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    // MARK: - Custom Methods
    /// textField가 Filled 되면 Next 버튼을 활성화하는 메서드
    @objc func textFieldDidChange(_ sender: Any?) {
        if userName.hasText == true {
              nextBtn.isEnabled = true
            } else {
            nextBtn.isEnabled = false
        }
    }
}
