//
//  RewardItemView.swift
//  ChickFilARemodel
//
//  Created by Bryce King on 11/6/24.
//

import SwiftUI

struct RewardItemView: View {
    let itemObj: MenuItem
    
    var body: some View{
        HStack {
            Image("\(itemObj.picture)")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            VStack{
                Text("\(itemObj.item)")
                    .frame(maxWidth: 170, alignment: .center)
                Button("Redeem"){
                    /*Task{
                     do{
                     user = try await userPurchase(item: itemObj)
                     }catch UserDataError.invalidURL {
                     print ("invalid URL")
                     }  catch UserDataError.invalidResponse {
                     print ("invalid response")
                     } catch UserDataError.decodingError {
                     print ("decoding error")
                     } catch {
                     print ("unexpected error")
                     }//update users points with the item that was purchased
                     }*/
                }
                .buttonStyle(.borderedProminent)
                .tint(Gradient(colors: [Color(#colorLiteral(red: 0.93030864, green: 0.02452407591, blue: 0.2150815427, alpha: 1)), Color(#colorLiteral(red: 0.816718936, green: 0.05412308127, blue: 0.1189717725, alpha: 1))]))
                .foregroundColor(.white)
                .buttonBorderShape(.capsule)
            }
            
        }
    }
}
