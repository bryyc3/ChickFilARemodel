//
//  ContentView.swift
//  ChickFilARemodel
//
//  Created by Bryce King on 10/27/24.
//

import SwiftUI

struct ContentView: View {
    @State var userRewards: [MenuItem]?
    
    var body: some View {
        TabView{
            PurchaseItemsView()
                .tabItem{
                    Label("Menu", systemImage: "menucard")
                        .environment(\.symbolVariants, .none)
                }
                
            RewardsView(rewardData: $userRewards)
                .tabItem{
                    Label("Rewards", systemImage: "gift")
                        .environment(\.symbolVariants, .none)
                }
                .badge(userRewards?.count ?? 0)
            OperatorView(rewards: $userRewards)
                .tabItem{
                    Label("Operator", systemImage: "person.text.rectangle")
                        .environment(\.symbolVariants, .none)
                }
        }
        .accentColor(Color(#colorLiteral(red: 0.9277003407, green: 0.02060462162, blue: 0.2169939876, alpha: 1)))
        .task {
            do{
                userRewards = try await getRewards()
            }catch RewardsDataError.invalidURL {
                print ("invalid URL")
            }  catch RewardsDataError.invalidResponse {
                print ("invalid response")
            } catch RewardsDataError.decodingError {
                print ("decoding error")
            } catch {
                print ("unexpected error")
            }//get all rewards associated with user
        }
        
    }
}

#Preview {
    ContentView()
}
