//
//  GetStarted.swift
//  Planetree
//
//  Created by Haroon Maqsood on 9/3/22.
//

import SwiftUI

struct GetStarted: View {
    @State var animate: Bool = false
    @State var networkManager: NetworkManager?
    let primaryColor = Color("ButtonColor")
    let secondaryColor = Color("ButtonSecondary")
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("PlanetEarth")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    NavigationLink {
                       HomeView()
                    }
                       label: {
                        Text("Get Started")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: animate ? UIScreen.main.bounds.width / 1.5 : UIScreen.main.bounds.width / 2)
                            .background(animate ? primaryColor : secondaryColor)
                            .cornerRadius(10)
                            
                    
                        }
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .shadow(color: animate ? primaryColor.opacity(0.5) : secondaryColor.opacity(0.5),
                            radius: animate ? 30:10,
                            x: 0,
                            y: animate ? 50:30)
                    .offset(y: animate ? -10:0)
                }.onAppear(perform: addAnimation)
            }
        }
    }
    
    func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
            Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct GetStarted_Previews: PreviewProvider {
    static var previews: some View {
        GetStarted()
    }
}
