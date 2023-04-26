//
//  ContentView.swift
//  SwiftUILearning_01
//
//  Created by 韦小新 on 2023/4/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
