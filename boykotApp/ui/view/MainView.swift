import SwiftUI

struct MainView: View {
    let buttonTitles = ["Marka Ara", "QR Code Okut", "QR Kodu Yaz", "Haberler", "Hakkında", "Destek"]
    let colors: [Color] = [.black, .red, .green]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("BoycotApp")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    
                    Button(action: {
                        // Action for button tap
                    }) {
                        Text("Marka Ara")
                            .frame(height: 150)
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding()
                    }
                    Button(action: {
                        // Action for button tap
                    }) {
                        Text("QR Code Okut")
                            .frame(height: 150)
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding()
                    }
                    Button(action: {
                        // Action for button tap
                    }) {
                        Text("Marka Ara")
                            .frame(height: 150)
                            .background(.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding()
                    }
                    Button(action: {
                        // Action for button tap
                    }) {
                        Text("Marka Ara")
                            .frame(height: 150)
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .padding()
                    }
                    Button(action: {
                        // Action for button tap
                    }) {
                        Text("Marka Ara")
                            .frame(height: 150)
                            .background(.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding()
                    }
                    Button(action: {
                        // Action for button tap
                    }) {
                        Text("Marka Ara")
                            .frame(height: 150)
                            .background(.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding()
                    }
                    
                }
                .padding()
            }
            .background(.gray)
        }
    }
}

#Preview {
    MainView()
}
