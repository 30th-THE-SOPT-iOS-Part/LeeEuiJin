//
//  SecondViewController.swift
//  Assignment Week1
//
//  Created by 이의진 on 2022/04/08.
//

import UIKit

class SecondViewController: UIViewController {
    var message1 :String?
    @IBOutlet weak var tabNextBtn: UIButton!
    @IBOutlet weak var userPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title=""
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "icn_back_24")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icn_back_24")
        self.navigationController?.navigationBar.tintColor = .black
        tabNextBtn.isEnabled = false
        tabNextBtn.backgroundColor = UIColor(displayP3Red: 100/255, green: 150/255, blue: 250/255, alpha: 1)
        tabNextBtn.titleLabel?.textColor = .white
        self.userPassword.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
        
    
    }
    @objc func textFieldDidChange(_ sender: Any?) {
           if userPassword.hasText == true {
                 tabNextBtn.isEnabled = true
               }
           else {
               tabNextBtn.isEnabled = false
           }
       }
    


    @IBAction func tabNextBtn(_ sender: Any) {
        guard let nextVC2 = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else {return}
        if let message1 = message1{
            nextVC2.message2 = message1
        }
        nextVC2.modalPresentationStyle = .pageSheet
        nextVC2.modalTransitionStyle = .crossDissolve
        self.present(nextVC2, animated: true, completion: nil)
    }
    
  
}
