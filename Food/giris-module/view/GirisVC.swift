//
//  GirisVC.swift
//  Food
//
//  Created by melek türüdi on 22.09.2022.
//

import UIKit
import Firebase

class GirisVC: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var LoginPagePresenterObject : ViewToPresenterLoginPageProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginPageRouter.createModule(ref: self)
    }
    @IBAction func signUpButton(_ sender: Any) {
        performSegue(withIdentifier: "kayit", sender: nil)
    }
    @IBAction func loginButton(_ sender: Any) {
        //login firebase
        if emailTextField.text == "" || passwordTextField.text == "" {
            let alert = UIAlertController(title: "UYARI", message: "Alanları Doldurunuz", preferredStyle: .alert)
                        let OKAction = UIAlertAction(title: "Tamam", style: .default){ action in
                        
                        }
                        alert.addAction(OKAction)
                        self.present(alert, animated: true)
        }
        let auth = Auth.auth()
        
            if let emailText = emailTextField.text,
               let passwordText = passwordTextField.text {
                LoginPagePresenterObject?.loginAll(email: emailText, password: passwordText)
            }
                auth.addStateDidChangeListener(){ (auth,user) in
                    if user != nil {
                        print("Login Success: " + (user?.email)! )
                        self.performSegue(withIdentifier: "HomePage", sender: nil)
                    }
                    else {
                        //Logın error
                        let alert = UIAlertController(title: "Error", message: "Please enter the information correctly. If you think there is an error, please contact us", preferredStyle: .alert)
                        let OKAction = UIAlertAction(title: "Okay", style: .default){ action in
                            self.navigationController?.popToRootViewController(animated: true)}
                        alert.addAction(OKAction)
                        self.present(alert, animated: true)
                        
                    }
                }
            }
        }


