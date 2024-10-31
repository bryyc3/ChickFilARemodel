//
//  MenuView.swift
//  ChickFilARemodel
//
//  Created by Bryce King on 10/27/24.
//

import SwiftUI

struct MenuView: View {
    @State private var menuItems: [MenuItem]?
    
    var body: some View {
        if let menu = menuItems {
            VStack {
                ForEach(menu, id: \.item){item in
                    MenuItemView(itemObj: item)
                }
            }
        } else {
            Text("Menu unavailable")
                .task {
                    do{
                        menuItems = try await getMenuItems()
                    } catch MenuItemsError.invalidURL {
                        print ("invalid URL")
                    }  catch MenuItemsError.invalidResponse {
                        print ("invalid response")
                    } catch MenuItemsError.decodingError {
                        print ("decoding error")
                    } catch {
                        print ("unexpected error")
                    }
                }
        }
    }
}//display all menu items by iterating through array of menu items
