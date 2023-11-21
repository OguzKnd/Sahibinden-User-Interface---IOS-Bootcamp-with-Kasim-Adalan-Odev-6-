//
//  Satirlar.swift
//  Odev7 Listeleme Arayuzu
//
//  Created by Oğuz Kanda on 10.10.2023.
//

import Foundation
import UIKit

class Satirlar {
    
    var id:Int?
    var isim:String?
    var aciklama:String?
    var resim:String?

    init(){
        
    }
    
    init(id: Int, isim: String, aciklama: String, resim: String) {
        self.id = id
        self.isim = isim
        self.aciklama = aciklama
        self.resim = resim
    }

}


