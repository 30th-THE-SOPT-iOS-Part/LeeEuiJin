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
    let passwordBtn = UIButton(type:.system)

    
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.loginEmail.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        self.loginPassword.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        self.passwordBtn.addTarget(self, action: #selector(self.tabPasswordBtn(_:)), for: .touchUpInside)
    }
    
    //MARK: - UI
    private func configureUI(){
        loginEmail.clearButtonMode = .unlessEditing
        loginBtn.isEnabled = false
        passwordBtn.setImage(UIImage(named:"password_hidden"), for: .normal)
        passwordBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        passwordBtn.contentMode = .scaleAspectFit
        loginPassword.rightView = passwordBtn
        loginPassword.rightViewMode = .always
        passwordBtn.tintColor = .gray
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
    

    //MARK: Custom Methods
    
    /// 이메일 textField와 비밀번호 textField가 Filled되면 버튼 활성화 되는 메서드
    @objc func textFieldDidChange(_ sender: Any?) {
        if loginEmail.hasText && loginPassword.hasText {
              loginBtn.isEnabled = true
            
            } else {
            loginBtn.isEnabled = false
        }
      }
    @objc func tabPasswordBtn(_ sender: Any) {
        if passwordBtn.currentImage == UIImage(named: "password_hidden"){
            passwordBtn.setImage(UIImage(named:"password_shown"), for: .normal)
            loginPassword.isSecureTextEntry = false
        } else {
            passwordBtn.setImage(UIImage(named:"password_hidden"), for: .normal)
            loginPassword.isSecureTextEntry = true
        }
        
    }
  
    
    private func makeAlert(_ message : String){
        let alertViewController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인",style: .default){ action in
            let storyboard = UIStoryboard(name: "TabBar", bundle: Bundle.main)
            guard let nextVC = storyboard.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController else {return}
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first else {return}
            window.rootViewController = nextVC
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {}, completion: nil)
            windowScene.windows.first?.makeKeyAndVisible()
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


    


