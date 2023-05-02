//
//  HomeView.swift
//  Planetree
//
//  Created by Haroon Maqsood on 8/30/22.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.openURL) var openURL
    @ObservedObject var networkManager = NetworkManager()
    @State var selectedPlanet: PlanetsModel?
    @State var shouldSheetShow = false
    @State var showDescription = false
    
    
    var body: some View {
        
        ZStack {
            
            Image("Stars")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .opacity(1)
            
            
            VStack {
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
                        ForEach(networkManager.arrayOfData, id: \.self) { planet in
                            
                            Button {
                                
                                withAnimation(.easeOut(duration: 2)) { selectedPlanet = planet
                                    showDescription = true
                                }
                                
                                
                            } label: {
                                
                                AsyncImage(url: URL(string: planet.imgSrc.first?.img ?? "")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                .clipShape(RoundedRectangle(cornerRadius: 40))
                                .frame(width: 200, height: 200)
                                
                            }
                            
                        }
                        
                    }
                    
                    .padding(.bottom, 80)
                }
                
                
                ScrollView {
                    
                    VStack(alignment: .leading, spacing: 20) {
                        if showDescription {
                            Text("Planet Description")
                                .bold()
                                .font(.system(size: 40))
                                .cornerRadius(12)
                                .foregroundColor(.white)
                            Text(selectedPlanet?.name ?? "")
                                .font(.largeTitle)
                            
                            Text(selectedPlanet?.planetsDataModelDescription ?? "")
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                }
                Button(action: {
                    if let url = URL(string: selectedPlanet?.wikiLink ?? "") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Image(systemName: "link.circle.fill")
                        .font(.largeTitle)
                }
                
                Button {
                    shouldSheetShow = true
                    
                } label: {
                    Text(" View 3D model ")
                        .bold()
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(12)
                        .padding()
                    
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onAppear {  networkManager.serviceCall() }
        .sheet(isPresented: $shouldSheetShow) {
            PlanetView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
