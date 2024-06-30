//
//  SignUpPage.swift
//  boykotApp
//
//  Created by Feyzullah Durası on 29.06.2024.
//

import SwiftUI

struct RegisterPage: View {
    @State private var tfBrandName = ""
    
    @State private var tfBrandComment = ""
    
    @State private var isBoycott = false
    
    var viewModel = RegisterViewModel()
    
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
            
            
            Button("Save"){
                viewModel.register(brand_name: tfBrandName, brand_comment: tfBrandComment, brand_boycott: isBoycott)
                
            }.padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }.navigationTitle("New Brand")
    }
}

#Preview {
    RegisterPage()
}
