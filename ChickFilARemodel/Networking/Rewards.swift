//
//  Rewards.swift
//  ChickFilARemodel
//
//  Created by Bryce King on 11/6/24.
//

import Foundation

func getRewards() async throws -> [MenuItem]{
    let endpoint = "http://localhost:8080/rewards"
    guard let url = URL(string: endpoint) else{
        throw RewardsDataError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
        throw RewardsDataError.invalidResponse
    }
    
    do{
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let rewards: [MenuItem] =  try decoder.decode([MenuItem].self, from: data)
        return rewards
    } catch {
        throw RewardsDataError.decodingError
    }
}//get all rewards associated with user

func sendReward() async throws -> [MenuItem]{
    let endpoint = "http://localhost:8080/send-reward"
    guard let url = URL(string: endpoint) else{
        throw RewardsDataError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
        throw RewardsDataError.invalidResponse
    }
    
    do{
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let rewards: [MenuItem] =  try decoder.decode([MenuItem].self, from: data)
        return rewards
    } catch {
        throw RewardsDataError.decodingError
    }
}//simulate local operator sending reward to customers 
    
enum RewardsDataError: Error{
    case invalidURL
    case invalidResponse
    case decodingError
}
