//
//  AnasayfaCollectionViewCell.swift
//  Food
//
//  Created by melek türüdi on 17.09.2022.
//

import UIKit
import Kingfisher
class AnasayfaCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var adLabel: UILabel!
    @IBOutlet weak var fiyatLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var hucre: UIView!
    func resimGoster(resimAdi:String){
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)"){
           
            
            DispatchQueue.main.async { //kingfisher kullanımı
                
                self.imageView.kf.setImage(with: url)

                
                
            }
            
        }
        
    }
}
