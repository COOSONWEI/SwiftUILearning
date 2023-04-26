//
//  SwiftUILearning_01App.swift
//  SwiftUILearning_01
//
//  Created by 韦小新 on 2023/4/22.
//

import SwiftUI

@main
struct SwiftUILearning_01App: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
