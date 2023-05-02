//
//  ContentView.swift
//  Planetree
//
//  Created by Haroon Maqsood on 8/30/22.
//

import SwiftUI
import SceneKit
struct PlanetVie: View {
    
    @State var model = [ImagesModel(name: "Earth", modelName: "Earth.usdz"),ImagesModel(name: "Mars", modelName: "Mars.usdz"),ImagesModel(name: "Jupiter", modelName: "Jupiter.usdz"),ImagesModel(name: "Mercury", modelName: "Mercury.usdz"),ImagesModel(name: "Neptune", modelName: "Neptune.usdz"),ImagesModel(name: "Saturn", modelName: "Saturn.usdz"), ImagesModel(name: "Venus", modelName: "Venus.usdz")
    ]
    
    @State var index = 0
    
    var body: some View {
        ScrollView {
            ScrollView(.horizontal, showsIndicators: false) {
                
                VStack {
                    VStack(spacing: 40) {
                        let scene = SCNScene()
                        ForEach(0...6, id: \.self) { nums in
                            SceneView(scene: SCNScene(named: model[nums].modelName), options: [.autoenablesDefaultLighting, .allowsCameraControl])
                          
                                .frame(width: 400, height: 400, alignment: .center)
                           
                               
                        }
                    }

                }
           
            }
      
        }
        .background(.black)
    }
}

struct ContentView_: PreviewProvider {
    static var previews: some View {
        PlanetVie()
    }
}

struct viewScene {
    @State var model = [ImagesModel(name: "Earth", modelName: "Earth.usdz"),ImagesModel(name: "Mars", modelName: "Mars.usdz"),ImagesModel(name: "Jupiter", modelName: "Jupiter.usdz"),ImagesModel(name: "Mercury", modelName: "Mercury.usdz"),ImagesModel(name: "Neptune", modelName: "Neptune.usdz"),ImagesModel(name: "Saturn", modelName: "Saturn.usdz"), ImagesModel(name: "Venus", modelName: "Venus.usdz")
    ]
    func sceneViewer() {
//        let scene = SCNScene(named: model[0].modelName)
        SceneView(scene: {
            let scene = SCNScene(named: "Earth.usdz")!
            scene.background.contents = UIColor.green /// here!
             return scene
            )
        }(), .option:)
    }
}


