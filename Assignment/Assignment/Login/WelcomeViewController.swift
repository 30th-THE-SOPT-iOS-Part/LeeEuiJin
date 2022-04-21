//
//  WelcomeViewController.swift
//  Assignment Week1
//
//  Created by 이의진 on 2022/04/08.
//

import UIKit

class WelcomeViewController: UIViewController {
    // MARK: - @IBOutlet
    @IBOutlet weak var welcomeMessage: UILabel!
    
    // MARK: - Properties
    var message2: String?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMessage()
    }
    
    // MARK: - UI
    private func setUpMessage(){
        if let message2 = message2 {
            welcomeMessage.text = message2 + "님, Instagram에\n오신 것을 환영합니다"
            welcomeMessage.sizeToFit()
            welcomeMessage.textAlignment = .center
            welcomeMessage.center.x = self.view.center.x
        }
    }
    
    // MARK: - @IBAction
    @IBAction func tabAnotherAccountBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tabFinalBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "TabBar", bundle: Bundle.main)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController else {return}
        self.present(nextVC, animated: true, completion: nil)
    }
}
