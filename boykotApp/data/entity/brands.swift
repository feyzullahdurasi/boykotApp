//
//  brands.swift
//  boykotApp
//
//  Created by Feyzullah Durası on 29.06.2024.
//

import Foundation

class Brands : Identifiable {
    var brand_id:String?
    var brand_name:String?
    var brand_image:String?
    var brand_boycott:Bool?
    var brand_comment:String?
    
    init(){
        
    }
    
    init(brand_id: String? = nil, brand_name: String? = nil, brand_image: String? = nil, brand_boycott: Bool? = nil, brand_comment: String? = nil) {
        self.brand_id = brand_id
        self.brand_name = brand_name
        self.brand_image = brand_image
        self.brand_boycott = brand_boycott
        self.brand_comment = brand_comment
    }
}
