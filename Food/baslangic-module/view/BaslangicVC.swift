//
//  BaslangicVC.swift
//  Food
//
//  Created by melek türüdi on 22.09.2022.
//

import UIKit

class BaslangicVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let appearance = UINavigationBarAppearance()
        self.navigationItem.title = "Yiyoz "
        appearance.backgroundColor = UIColor(named: "Color-4")
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "title-color")]
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    

  
    @IBAction func kayitbtn(_ sender: Any) {
        
        performSegue(withIdentifier: "kayit", sender: nil)
    }
    
    
    @IBAction func girisbtn(_ sender: Any) {
        self.performSegue(withIdentifier: "giris", sender: nil)
    }
    
}
