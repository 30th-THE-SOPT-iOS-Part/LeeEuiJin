//
//  ThirdViewController.swift
//  Assignment Week1
//
//  Created by 이의진 on 2022/04/08.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var welcomeMessage: UILabel!
    var message2: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMessage()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func tabFinalBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setMessage(){
        if let message2 = message2 {
            welcomeMessage.text = message2 + "님, Instagram에\n오신 것을 환영합니다"
            welcomeMessage.sizeToFit()
            welcomeMessage.textAlignment = .center
            welcomeMessage.center.x = self.view.center.x
        }
    }
}
