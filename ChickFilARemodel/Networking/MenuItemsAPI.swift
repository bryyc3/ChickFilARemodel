//
//  MenuItemsAPI.swift
//  ChickFilARemodel
//
//  Created by Bryce King on 10/27/24.
//

import Foundation

func getMenuItems() async throws -> [MenuItem]{
 
    let endpoint = "http://localhost:8080/menu-items"
    
    guard let url = URL(string: endpoint) else {
        throw MenuItemsError.invalidURL
    }
     
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw MenuItemsError.invalidResponse
    }
    do{
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let item: [MenuItem] =  try decoder.decode([MenuItem].self, from: data)
        return item
    } catch {
        throw MenuItemsError.decodingError
    }
   
}//fetch all menu items 

enum MenuItemsError: Error{
    case invalidURL
    case invalidResponse
    case decodingError
}

