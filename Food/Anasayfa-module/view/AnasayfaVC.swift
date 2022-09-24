//
//  ViewController.swift
//  Food
//
//  Created by melek türüdi on 17.09.2022.
//

import UIKit
import Firebase
import Alamofire
import Kingfisher

class AnasayfaVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var yemekListe = [Yemekler]()
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    var filterFoodList = [Yemekler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        self.navigationItem.title = "Yiyoz"
        appearance.backgroundColor = UIColor(named: "Color-4")
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "title-color")]
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 8, left: 5, bottom: 12, right: 5)
        tasarim.minimumLineSpacing = 10
        tasarim.minimumInteritemSpacing = 10
        let width = collectionView.frame.size.width
        let cellWidht = (width - 20) / 2
        tasarim.itemSize = CGSize(width: cellWidht, height: cellWidht*1.2)
       collectionView.collectionViewLayout = tasarim
        
        
        
        
        AnasayfaRouter.createModule(ref: self)
        searchBar.delegate = self
    }
    

    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.yemekleriYukle()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let yemek = sender as? Yemekler
           let gidilecekVC = segue.destination as! DetayVC
            gidilecekVC.yemek = yemek
        }
    }

    
    @IBAction func eklebtn(_ sender: Any) {
        performSegue(withIdentifier: "toSepet", sender: nil)
    }
    

}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
func vieweVeriGonder(yemekListesi: Array<Yemekler>) {
    self.yemekListe = yemekListesi
    self.filterFoodList = yemekListesi
    DispatchQueue.main.async {
        self.collectionView.reloadData()
    }
}
}

// SEARCH
extension AnasayfaVC : UISearchBarDelegate {
func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    self.filterFoodList = self.yemekListe.filter{yemek in
        if yemek.yemek_adi!.lowercased().contains(searchText.lowercased()){
            return true
        }
        if searchText == ""{
            return true
        }
        return false
    }
    self.collectionView.reloadData()
    
    anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
}
}


extension AnasayfaVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return filterFoodList.count
  
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
   
        return CGFloat(15)
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

   let collectionView = collectionView.dequeueReusableCell(withReuseIdentifier: "yemekHucre", for: indexPath) as! AnasayfaCollectionViewCell
        let yemek = filterFoodList[indexPath.row]
        let hucre = collectionView
        
    hucre.imageView.image = UIImage(named: yemek.yemek_resim_adi!)
    hucre.adLabel.text = yemek.yemek_adi
   hucre.fiyatLabel.text = "\(yemek.yemek_fiyat!) TL"
    hucre.resimGoster(resimAdi: "\(yemek.yemek_resim_adi!)")

    
    hucre.layer.borderColor = UIColor.clear.cgColor
    hucre.layer.borderWidth = 0.3
    hucre.layer.cornerRadius = 10.0

        return hucre
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
            print("Girdi")
        let yemek = filterFoodList[indexPath.row]
            performSegue(withIdentifier: "toDetay", sender: yemek)
            //collectionView.deselectRow(at: indexPath, animated: true)
    }
    
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView == collectionView {
        return CGSize(width: CGFloat(160), height: CGFloat(45))
    } else {
        return CGSize(width: CGFloat(202), height: CGFloat(241))
    }
    
}


