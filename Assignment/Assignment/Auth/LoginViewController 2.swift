//
//  LoginViewController.swift
//  Assignment Week1
//
//  Created by 이의진 on 2022/04/07.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    // MARK: - @IBOutlet
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var passwordBtn: UIButton!
    
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.loginEmail.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        self.loginPassword.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    //MARK: - UI
    private func configureUI(){
        loginEmail.clearButtonMode = .unlessEditing
        loginBtn.isEnabled = false
        passwordBtn.setImage(UIImage(named:"password_hidden"), for: .normal)
        loginBtn.backgroundColor = UIColor(displayP3Red: 100/255, green: 150/255, blue: 250/255, alpha: 1)
    }
    
    
    //MARK: - @IBAction
    @IBAction func tabLoginBtn(_ sender: Any) {
        login()
    }
    
    @IBAction func tabSignUpBtn(_ sender: Any) {
        guard let nextVC =
                self.storyboard?.instantiateViewController(withIdentifier: "UserNameViewController") as? UserNameViewController else {return}
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func tabPasswordBtn(_ sender: Any) {
        if passwordBtn.currentImage == UIImage(named: "password_hidden"){
            passwordBtn.setImage(UIImage(named:"password_shown"), for: .normal)
            loginPassword.isSecureTextEntry = false
        } else {
            passwordBtn.setImage(UIImage(named:"password_hidden"), for: .normal)
            loginPassword.isSecureTextEntry = true
        }
        
    }
    
    //MARK: Custom Methods
    
    /// 이메일 textField와 비밀번호 textField가 Filled되면 버튼 활성화 되는 메서드
    @objc func textFieldDidChange(_ sender: Any?) {
        if loginEmail.hasText == true && loginPassword.hasText == true {
              loginBtn.isEnabled = true
            
            } else {
            loginBtn.isEnabled = false
        }
      }
  
    
    private func makeAlert(_ message : String){
        let alertViewController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인",style: .default){ action in
            let storyboard = UIStoryboard(name: "TabBar", bundle: Bundle.main)
            guard let nextVC = storyboard.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController else {return}
            guard let delegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {return}
            delegate.window?.rootViewController = nextVC
            }

        alertViewController.addAction(okAction)
        present(alertViewController, animated: true)
    }
}


// MARK: - Network
extension LoginViewController{
    func login(){
        guard let name = loginEmail.text else { return }
        guard let email = loginEmail.text else { return }
        guard let password = loginPassword.text else { return }
        
        UserService.shared.login(name: name, email: email, password: password){ response in
            switch response {
            case .success(let data):
                guard let data = data as? LoginResponse else { return }
                print(data)
                self.makeAlert("로그인 되었습니다!")
                
            default:
                print(response)
                return
            }
        }
    }
}
    


