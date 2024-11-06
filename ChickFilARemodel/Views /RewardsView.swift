//
//  RewardsView.swift
//  ChickFilARemodel
//
//  Created by Bryce King on 11/5/24.
//

import SwiftUI

struct RewardsView: View {
    @Binding var rewardData: [RewardItem]?
    
    var body: some View {
        if let rewards = rewardData {
            if (rewards.count > 0){
                ScrollView {
                    ForEach(rewards, id: \.item){item in
                        RewardItemView(rewards: $rewardData, itemObj: item)
                    }
                }
            } else {
                Text("No Rewards Available")
            }
            
        }
    }
}


