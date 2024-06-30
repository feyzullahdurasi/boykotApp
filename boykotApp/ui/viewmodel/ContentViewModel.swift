//
//  ContentViewModel.swift
//  boykotApp
//
//  Created by Feyzullah Durası on 29.06.2024.
//

import Foundation
import Firebase

class ContentViewModel : ObservableObject {
    @Published var brandList = [Brands]()
    
    var refBrands = Database.database().reference().child("brands")
    
    func uploadsBrands() {
        refBrands.observe(.value, with: { snapshot in
            var list = [Brands]()
            
            if let incomingData = snapshot.value as? [String:AnyObject] {
                for line1 in incomingData {
                    if let d = line1.value as? NSDictionary {
                        let brand_id = line1.key
                        let brand_name = d["brand_name"] as? String ?? ""
                        let brand_image = d["brand_image"] as? String ?? ""
                        let brand_boycott = d["brand_boycott"] as? Bool
                        let brand_comment = d["brand_comment"] as? String ?? ""
                        
                        let brand = Brands(brand_id: brand_id, brand_name: brand_name, brand_image: brand_image, brand_boycott: brand_boycott, brand_comment: brand_comment)
                        list.append(brand)
                    }
                }
            }
            DispatchQueue.main.async {
                self.brandList = list
            }
            
        })
    }
    
    func search(searchWord:String){
        refBrands.observe(.value, with: { snapshot in
            var list = [Brands]()
            
            if let incomingData = snapshot.value as? [String:AnyObject] {
                for line1 in incomingData {
                    if let d = line1.value as? NSDictionary {
                        let brand_id = line1.key
                        let brand_name = d["brand_name"] as? String ?? ""
                        let brand_image = d["brand_image"] as? String ?? ""
                        let brand_boycott = d["brand_boycott"] as? Bool
                        let brand_comment = d["brand_comment"] as? String ?? ""
                        
                        if brand_name.lowercased().contains(searchWord.lowercased()) {
                            let brand = Brands(brand_id: brand_id, brand_name: brand_name, brand_image: brand_image, brand_boycott: brand_boycott, brand_comment: brand_comment)
                            list.append(brand)
                        }
                        
                    }
                }
            }
            DispatchQueue.main.async {
                self.brandList = list
            }
            
        })
    }
}
