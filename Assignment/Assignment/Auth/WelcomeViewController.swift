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
    var userName: String?
    var password: String?
    var isSignUp: Bool = false
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMessage()
        setUpHideBackBtn()
    }
    
    // MARK: - UI
    private func setUpMessage(){
        if let userName = userName {
            welcomeMessage.text = userName + "님, Instagram에\n오신 것을 환영합니다"
            welcomeMessage.sizeToFit()
        
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
        signup()
    }
    
    // MARK: - Custom Methods
    
    private func makeAlert(_ message : String){
        let alertViewController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인",style: .default){ action in
            self.dismiss(animated: true){
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        alertViewController.addAction(okAction)
        present(alertViewController, animated: true)
    }
    
    
    
}
// MARK: - Network
extension WelcomeViewController{
    func signup(){
        guard let name = self.userName else { return }
        guard let password = self.password else { return }
        
        UserService.shared.signup(name: name, email: name, password: password){ response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
                print(data)
                self.makeAlert("회원가입 완료")
                
            default:
                print(response)
                return
            }
        }
    }
}


