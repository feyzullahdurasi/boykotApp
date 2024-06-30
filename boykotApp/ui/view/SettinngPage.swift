//
//  SettinngPage.swift
//  boykotApp
//
//  Created by Feyzullah Durası on 30.06.2024.
//

import SwiftUI

struct SettinngPage: View {
    
    @State private var tfBrandName = ""
    
    @State private var tfBrandComment = ""
    @State private var isDeleteAlert = false
    @State private var isBoycott = false
    
    var viewModel = SettingViewModel()
    
    var brand = Brands()
    
    var body: some View {
        VStack(spacing: 50) {
            TextField("Brand Name",text: $tfBrandName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Toggle("Is the brand a boycott product?", isOn: $isBoycott)
                .toggleStyle(SwitchToggleStyle(tint: .red))
                .padding()
            
            TextField("Brand Comment",text: $tfBrandComment)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            
            HStack(spacing: 50) {
                Button("Delete"){
                    
                    isDeleteAlert = true
                }.padding()
                .background(.red)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .alert("Are you sure you want to delete?", isPresented: $isDeleteAlert) {
                    Button("Delete", role: .destructive){
                        viewModel.delete(brand_id: brand.brand_id!)
                    }
                    Button("Cancel", role: .cancel){
                        
                    }
                } message: {
                    Text("If you delete it from here, it will be deleted permanently.")
                }
                
                Button("Save Changes"){
                    viewModel.update(brand_id: brand.brand_id!, brand_name: tfBrandName, brand_comment: tfBrandComment, brand_boycott: isBoycott)
                    
                }.padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }.navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                tfBrandName = brand.brand_name!
                tfBrandComment = brand.brand_comment!
                isBoycott = brand.brand_boycott!
            }
    }
}
/*
#Preview {
    SettinngPage()
}*/
