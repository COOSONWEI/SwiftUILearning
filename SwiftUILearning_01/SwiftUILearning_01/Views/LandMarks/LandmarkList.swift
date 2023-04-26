//
//  LandmarkList.swift
//  SwiftUILearning_01
//
//  Created by 韦小新 on 2023/4/25.
//

import SwiftUI

//create a landmark list
struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State var showFavoritesOnly =  false
    
    //通过检查showFavoritesOnly属性和每个landmark.isFavorite值，计算出一个过滤版的地标列表。
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                //添加切换键
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favories only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                       LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
        
       
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        //previews different device
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
//                   LandmarkList()
//                       .previewDevice(PreviewDevice(rawValue: deviceName))
//                       .previewDisplayName(deviceName)
//               }
        LandmarkList()
            .environmentObject(ModelData())
        
    }
}
