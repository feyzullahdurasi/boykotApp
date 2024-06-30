//
//  BrandLine.swift
//  boykotApp
//
//  Created by Feyzullah Durası on 29.06.2024.
//

import SwiftUI

struct BrandLine: View {
    
    var brand = Brands()
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/kofte.png")){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }.frame(width: 100, height: 100)
            
            Text(brand.brand_name!)
            
            Spacer()
            
            if brand.brand_boycott == true {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.red)
                } else {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.green)
                }
                
            
        }
    }
}
/*
#Preview {
    BrandLine()
}*/
