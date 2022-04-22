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
    var isSignUp: Bool = false
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMessage()
        setUpHideBackBtn()
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
    
    private func setUpHideBackBtn(){
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // MARK: - @IBAction
    @IBAction func tabAnotherAccountBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func tabFinalBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "TabBar", bundle: Bundle.main)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController else {return}
        guard let delegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {return}
        delegate.window?.rootViewController = nextVC
        // 여기에서 애니메이션을 주고 싶은데 어떻게 넣지.... ㅠㅠ
    }
}

