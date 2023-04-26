//
//  ModelData.swift
//  SwiftUILearning_01
//
//  Created by 韦小新 on 2023/4/25.
//

import Foundation
import Combine

//创建一个可观测的ModelData
final class ModelData: ObservableObject {
   @Published var landmarks: [Landmark] = load("landmarkData.json")
}




//Fetch an JSON Data from json files.
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    //guard fileName not nil
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    //load data
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error).")
    }
    
    
    //to decode date
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
