//
//  MemberStatusView.swift
//  ChickFilARemodel
//
//  Created by Bryce King on 10/28/24.
//

import SwiftUI

struct MemberStatusView: View{
    @Binding var userInfo: User?
    
    var body: some View {
        if let user = userInfo{
            let pointsNeeded: Int = maxMemberPoints(memberStatus: user.status)
             VStack {
                 Image("\(user.status)")
                     .resizable()
                     .scaledToFit()
                     .frame(width: 100, height: 100)
                 Text("MEMBER STATUS: \(user.status.uppercased())")
                     .foregroundColor(Color(#colorLiteral(red: 0.02723839507, green: 0.3904387653, blue: 0.547154665, alpha: 1)))
                     .fontWeight(.bold)
                 
                 StatusBarView(points: user.pointsAcquired)
                     .animation(.spring(), value: user.pointsAcquired)
                 Text("\(pointsNeeded)")
                     .frame(maxWidth: 350, alignment: .trailing)
             }
        }
           
        else {
            Text("User data unavailable")
                .task{
                    do{
                        
                        userInfo = try await getUserData()
                    } catch UserDataError.invalidURL {
                        print ("invalid URL")
                    }  catch UserDataError.invalidResponse {
                        print ("invalid response")
                    } catch UserDataError.decodingError {
                        print ("decoding error")
                    } catch {
                        print ("unexpected error")
                    }
                }
            }
        }
}//display member status, points accumulated and points needed to reach next status





