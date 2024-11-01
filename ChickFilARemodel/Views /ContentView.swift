//
//  ContentView.swift
//  ChickFilARemodel
//
//  Created by Bryce King on 10/27/24.
//

import SwiftUI

struct ContentView: View {
    @State var userData: User?
    
    var body: some View {
        MemberStatusView(userInfo: $userData)
        ScrollView{
            MenuView(user: $userData)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
