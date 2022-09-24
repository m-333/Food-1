//
//  KayitVC.swift
//  Food
//
//  Created by melek türüdi on 22.09.2022.
//

import UIKit

class KayitVC: UIViewController {
    
    @IBOutlet var telTextField: UITextField!
    @IBOutlet var nameTaxtField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var registerPresenterObject: ViewToPresenterRegisterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RegisterRouter.createModule(ref: self)
    }
    @IBAction func signUpButton(_ sender: Any) {
        if emailTextField.text == "" || passwordTextField.text == "" || telTextField.text == "" || nameTaxtField.text == "" {
            let alert = UIAlertController(title: "UYARI", message: "Alanları Doldurunuz", preferredStyle: .alert)
                        let OKAction = UIAlertAction(title: "Tamam", style: .default){ action in
                        
                        }
                        alert.addAction(OKAction)
                        self.present(alert, animated: true)
        }
        if let emailText = emailTextField.text,
           let passwordText = passwordTextField.text {
                registerPresenterObject?.registerAll(email: emailText, password: passwordText)
            let alert = UIAlertController(title: "Giriş", message: "Lüften Giriş Yapın!", preferredStyle: .alert)
                        let OKAction = UIAlertAction(title: "Tamam", style: .default){ action in
                            self.performSegue(withIdentifier: "kGiris", sender: nil)
                        }
                        alert.addAction(OKAction)
                        self.present(alert, animated: true)
          
           
            }
       
        }


}
