//
//  SingUpPage.swift
//  boykotApp
//
//  Created by Feyzullah Durası on 29.06.2024.
//

import Foundation
import Firebase

class RegisterViewModel {
    var refBrands = Database.database().reference().child("brands")
    
    func register(brand_name:String, brand_comment:String, brand_boycott:Bool) {
        let newBrand = ["brand_id":"","brand_name":brand_name, "brand_comment":brand_comment, "brand_boycott":brand_boycott] as [String : Any]
        refBrands.childByAutoId().setValue(newBrand)
        
    }
}
