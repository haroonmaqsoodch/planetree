//
//  ContentView.swift
//  Planetree
//
//  Created by Haroon Maqsood on 8/30/22.
//

import SwiftUI
import SceneKit
struct PlanetView: View {
    
    @State var model = [ImagesModel(name: "Earth", modelName: "Earth.usdz"),ImagesModel(name: "Mars", modelName: "Mars.usdz"),ImagesModel(name: "Jupiter", modelName: "Jupiter.usdz"),ImagesModel(name: "Mercury", modelName: "Mercury.usdz"),ImagesModel(name: "Neptune", modelName: "Neptune.usdz"),ImagesModel(name: "Saturn", modelName: "Saturn.usdz"), ImagesModel(name: "Venus", modelName: "Venus.usdz")
    ]
    
    @State var index = 0
    
    var body: some View {
 
      
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(0...6, id: \.self) { nums in
                        
                        SceneView(
                            scene: {
                                let scene = SCNScene(named: model[nums].modelName)!
                                scene.background.contents = UIColor(named: "Sat")
                                return scene
                            }(),
                            options: [.autoenablesDefaultLighting,.allowsCameraControl]
                        )
                        .clipShape(Circle())
                        
                        .frame(width: 220, height: 300)
                        .shadow(radius: 10)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                }
                
                .background(
                    LinearGradient(gradient: Gradient(colors: [.blue, .red, .brown, .gray, .cyan, .brown, .orange]), startPoint: .top, endPoint: .bottom)
                  )
        }
            .ignoresSafeArea()
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView()
    }
}


