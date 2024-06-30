//
//  ContentView.swift
//  boykotApp
//
//  Created by Feyzullah Durası on 29.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchWord = ""
    
    @ObservedObject var viewModel = ContentViewModel()
    
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.brandList){brand in
                    NavigationLink(destination: DetailPage(brand: brand)){
                        BrandLine(brand: brand)
                    }
                }
            }.navigationTitle("Brands")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(destination: RegisterPage()){
                            Image(systemName: "plus")
                        }
                        
                    }
                    
                }.onAppear(){
                    viewModel.uploadsBrands()
                }
        }.searchable(text: $searchWord, prompt: "Search")
            .onChange(of: searchWord){
                
                if searchWord == "" {
                    viewModel.uploadsBrands()
                    
                } else {
                    viewModel.search(searchWord: searchWord)
                }
            }
    }
}

#Preview {
    ContentView()
}
