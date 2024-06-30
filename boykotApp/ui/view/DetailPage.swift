//
//  DetailPage.swift
//  boykotApp
//
//  Created by Feyzullah Durası on 29.06.2024.
//

import SwiftUI

struct DetailPage: View {
    
    var brand = Brands()
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/ayran.png")){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }.frame(width: 300, height: 300)
            
            Text(brand.brand_name!).font(.system(size: 50)).foregroundColor(.blue)
            
            Text(brand.brand_comment!)
            
        }.navigationTitle("Is \(brand.brand_name!) a boycott product?")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                /*ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {SettinngPage()}, label:{ Image(systemName: "gear")})
                }*/
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink(destination: SettinngPage()){
                        Image(systemName: "gear")
                    }
                }
            }
    }
}
/*
#Preview {
    DetailPage()
}*/
