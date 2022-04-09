//
//  FirstViewController.swift
//  Assignment Week1
//
//  Created by 이의진 on 2022/04/08.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tabNextBtn: UIButton!
    @IBOutlet weak var userName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title=""
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "icn_back_24")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icn_back_24")
        self.navigationController?.navigationBar.tintColor = .black
        tabNextBtn.isEnabled = false
        tabNextBtn.backgroundColor = UIColor(displayP3Red: 100/255, green: 150/255, blue: 250/255, alpha: 1)
        self.userName.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
        

        // Do any additional setup after loading the view.
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        if userName.hasText == true {
              tabNextBtn.isEnabled = true
            }
        else {
            tabNextBtn.isEnabled = false
        }
    }
    

    @IBAction func tabToVC2Btn(_ sender: Any) {
        guard let nextVC =
                self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        nextVC.message1 = userName.text
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
}
