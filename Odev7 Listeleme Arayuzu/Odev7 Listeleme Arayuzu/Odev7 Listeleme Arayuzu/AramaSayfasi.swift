//
//  ViewController.swift
//  Odev7 Listeleme Arayuzu
//
//  Created by Oğuz Kanda on 9.10.2023.
//

import UIKit

class AramaSayfasi: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar?
    @IBOutlet weak var satirlarTableView: UITableView?
    
    var satirlistesi = [Satirlar]()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        satirlarTableView?.dataSource = self
        satirlarTableView?.delegate = self
        searchBar?.delegate = self
        
        let s1 = Satirlar(id: 1, isim: "Emlak", aciklama: "Konut,İş yeri,Arsa,Konut Projeleri,Bina, Devre Mülk", resim: "emlak")
        let s2 = Satirlar(id: 2, isim: "Vasıta", aciklama: "Otomobil, Arazi, SUV & Pickup, Motorsikler, Minibüs", resim: "vasıta")
        let s3 = Satirlar(id: 3, isim: "Yedek Parça, Aksesuar, Donanım & Tuning", aciklama: "Otomotiv Ekipmanları, motorsikler Ekipmanları", resim: "yedekparca")
        let s4 = Satirlar(id: 4, isim: "İkinci El ve Sıfır Alışveriş", aciklama: "Bilgisayar, Cep Telefonu, Fotoğraf Makinesi", resim: "ikinciel")
        let s5 = Satirlar(id: 5, isim: "İş Makineleri & Sanayi", aciklama: "İş Makineleri, Tarım Makineleri, Sanayi, Elektrik Makineleri", resim: "ismakinaları")
        let s6 = Satirlar(id: 6, isim: "Ustalar ve Hizmetler", aciklama: "Ev Tadilatı & Dekorasyon, Nakliye, Araç Servisleri", resim: "ustalar")
        let s7 = Satirlar(id: 7, isim: "Özel Ders Verenler", aciklama: "Lise & Üniversite, İlkokul, & Ortaokul, Yabancı Dil Eğitimleri", resim: "ozeldersverenler")
        let s8 = Satirlar(id: 8, isim: "İş İlanları", aciklama: "Avukatlık & Hukuki Danışmanlık, Eğitim, Eğlence Sektörü", resim: "isilanları")
        let s9 = Satirlar(id: 9, isim: "Yardımcı Arayanlar", aciklama: "Bebek & Çocuk Bakıcısı, Hasta & Yaşlı Bakıcısı", resim: "yardımcıarayanlar")
        let s10 = Satirlar(id: 10, isim: "Hayvanlar Alemi", aciklama: "Evcil Hayvanlar, Akvaryum Balıkları, Aksesuar Balıkları", resim: "hayvanlaralemi")
        
        satirlistesi.append(s1)
        satirlistesi.append(s2)
        satirlistesi.append(s3)
        satirlistesi.append(s4)
        satirlistesi.append(s5)
        satirlistesi.append(s6)
        satirlistesi.append(s7)
        satirlistesi.append(s8)
        satirlistesi.append(s9)
        satirlistesi.append(s10)
        
        self.navigationItem.title = "Arama"
        
        let appearence = UINavigationBarAppearance()
        appearence.backgroundColor = UIColor.secondarySystemFill
        
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor.secondarySystemFill
        renkDegistir(itemAppearance: tabBarAppearance.stackedLayoutAppearance)
        renkDegistir(itemAppearance: tabBarAppearance.inlineLayoutAppearance)
        renkDegistir(itemAppearance: tabBarAppearance.compactInlineLayoutAppearance)
        tabBarController?.tabBar.standardAppearance = tabBarAppearance
        tabBarController?.tabBar.scrollEdgeAppearance = tabBarAppearance

    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Anasayfaya Dönüldü")
    }

    func renkDegistir(itemAppearance:UITabBarItemAppearance){
        itemAppearance.selected.iconColor = UIColor.black
        itemAppearance.selected.titleTextAttributes =                                               [.foregroundColor:UIColor.black]
        itemAppearance.selected.badgeBackgroundColor = UIColor.systemRed
        itemAppearance.normal.iconColor = UIColor.darkGray
        itemAppearance.normal.titleTextAttributes =                                                 [.foregroundColor:UIColor.darkGray]
        itemAppearance.normal.badgeBackgroundColor = UIColor.systemRed
    }

}

extension AramaSayfasi : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return satirlistesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let satir = satirlistesi[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "satirlarHucre", for: indexPath) as! satirlarHucre
        if let resim = satir.resim {
            hucre.imageViewSatir.image = UIImage(named: resim)
        }
        hucre.isimLabel.text = satir.isim
        hucre.aciklamaLabel.text = satir.aciklama
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        hucre.hucreArkaPlan.layer.cornerRadius = 10
        hucre.selectionStyle = .none
        return hucre
   
    }
    
}

extension AramaSayfasi : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Kişi Ara : \(searchText)")
        
    }
}
