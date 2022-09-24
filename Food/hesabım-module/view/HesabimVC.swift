//
//  HesabımVC.swift
//  Food
//
//  Created by melek türüdi on 24.09.2022.
//

import UIKit

class HesabimVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func cikisBtn(_ sender: Any) {
        
        let alert = UIAlertController(title: "Çıkış", message: "Oturum Kapatıldı ", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "Tamam", style: .default){ action in
                        self.performSegue(withIdentifier: "cikis", sender: nil)
                    }
                    alert.addAction(OKAction)
                    self.present(alert, animated: true)
      
       
        }
    @IBAction func takipBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "takip", sender: nil)
    }
}
    

