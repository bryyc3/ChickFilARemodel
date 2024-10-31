//
//  UserDataAPI.swift
//  ChickFilARemodel
//
//  Created by Bryce King on 10/28/24.
//
import Foundation

func getUserData() async throws -> User{
    let endpoint = "http://localhost:8080/user-data"

    guard let url = URL(string: endpoint) else{
        throw UserDataError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
        throw UserDataError.invalidResponse
    }
    
    do{
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let userData: User = try decoder.decode(User.self, from: data)
        return userData
    } catch{
        throw UserDataError.decodingError
    }
}//fetch user data

func userPurchase(item: MenuItem) async throws {
    let endpoint = "http://localhost:8080/purchase"
    
    guard let url = URL(string: endpoint) else{
        throw UserDataError.invalidURL
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body = ["itemName": item.item]
    
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
    
    let task = URLSession.shared.dataTask(with: request) {data, _, error in
        guard let data = data, error == nil else{
            return
        }
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let userData: User = try decoder.decode(User.self, from: data)
            print( userData)
        } catch{
            print(error)
        }
        
    }
    task.resume()
}//simulate a user purchasing an item and reflect the changes within user class
    
enum UserDataError: Error{
    case invalidURL
    case invalidResponse
    case decodingError
}
