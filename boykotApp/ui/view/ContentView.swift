import SwiftUI

struct ContentView: View {
    
    @State private var searchWord = ""
    @ObservedObject var viewModel = ContentViewModel()
    @State private var isShowingScanner = false
    @State private var scannedCode: String?

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.brandList) { brand in
                    NavigationLink(destination: DetailPage(brand: brand)) {
                        BrandLine(brand: brand)
                    }
                }
            }
            .navigationTitle("Brands")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: RegisterPage()) {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        isShowingScanner = true
                    }) {
                        Image(systemName: "barcode.viewfinder")
                    }
                }
            }
            .onAppear() {
                viewModel.uploadsBrands()
            }
            .searchable(text: $searchWord, prompt: "Search")
            .onChange(of: searchWord) {
                if searchWord == "" {
                    viewModel.uploadsBrands()
                } else {
                    viewModel.search(searchWord: searchWord)
                }
            }
        }
        .sheet(isPresented: $isShowingScanner) {
            BarcodeScannerView {
                code in
                scannedCode = code
                isShowingScanner = false
                print("Scanned code is: \(code)")
                // Handle the scanned code here, e.g., search for the product
            }
        }
    }
}

#Preview {
    ContentView()
}
