//
//  ContentView.swift
//  ChickFilARemodel
//
//  Created by Bryce King on 10/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MemberStatusView()
        ScrollView{
            MenuView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
