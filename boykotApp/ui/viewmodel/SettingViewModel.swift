//
//  DetailViewModel.swift
//  boykotApp
//
//  Created by Feyzullah Durası on 29.06.2024.
//

import Foundation
import Firebase

class SettingViewModel {
    var refBrands = Database.database().reference().child("brands")
    
    func update(brand_id:String, brand_name:String, brand_comment:String, brand_boycott:Bool) {
        let updatedBrand = ["brand_name":brand_name, "brand_comment":brand_comment, "brand_boycott":brand_boycott] as [String : Any]
        refBrands.child(brand_id).updateChildValues(updatedBrand)
    }
    
    func delete(brand_id:String){
        refBrands.child(brand_id).removeValue()
    }
}
