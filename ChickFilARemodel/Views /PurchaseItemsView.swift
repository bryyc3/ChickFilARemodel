//
//  StatusMenuView.swift
//  ChickFilARemodel
//
//  Created by Bryce King on 11/5/24.
//

import SwiftUI

struct PurchaseItemsView: View {
    @State var userData: User?
    
    var body: some View {
        
        VStack{
            MemberStatusView(userInfo: $userData)
            MenuView(user: $userData)
        }
    }
}

#Preview {
    PurchaseItemsView()
}
