//
//  OperatorView.swift
//  ChickFilARemodel
//
//  Created by Bryce King on 11/5/24.
//

import SwiftUI

struct OperatorView: View {
    @Binding var rewards: [MenuItem]?
    
    var body: some View {
        Button("Send Reward"){
            Task{
                do{
                    rewards = try await sendReward()
                }catch RewardsDataError.invalidURL {
                    print ("invalid URL")
                }  catch RewardsDataError.invalidResponse {
                    print ("invalid response")
                } catch RewardsDataError.decodingError {
                    print ("decoding error")
                } catch {
                    print ("unexpected error")
                }//send reward to customers 
            }
        }
        .buttonStyle(.borderedProminent)
        .tint(Gradient(colors: [Color(#colorLiteral(red: 0.93030864, green: 0.02452407591, blue: 0.2150815427, alpha: 1)), Color(#colorLiteral(red: 0.816718936, green: 0.05412308127, blue: 0.1189717725, alpha: 1))]))
        .foregroundColor(.white)
        .buttonBorderShape(.capsule)
    }
}

