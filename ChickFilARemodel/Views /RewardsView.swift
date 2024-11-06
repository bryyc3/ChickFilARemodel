//
//  RewardsView.swift
//  ChickFilARemodel
//
//  Created by Bryce King on 11/5/24.
//

import SwiftUI

struct RewardsView: View {
    @Binding var rewardData: [MenuItem]?
    
    var body: some View {
        if let rewards = rewardData {
            ScrollView {
                ForEach(rewards, id: \.item){item in
                    RewardItemView(itemObj: item)
                }
            }
        } else {
            Text("No Rewards Available")
        }
    }
}


