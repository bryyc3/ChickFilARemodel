//
//  Rewards.swift
//  ChickFilARemodel
//
//  Created by Bryce King on 11/6/24.
//

import Foundation

func getRewards() async throws -> [RewardItem]{
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
        let rewards: [RewardItem] =  try decoder.decode([RewardItem].self, from: data)
        return rewards
    } catch {
        throw RewardsDataError.decodingError
    }
}//get all rewards associated with user

func sendReward() async throws -> [RewardItem]{
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
        let rewards: [RewardItem] =  try decoder.decode([RewardItem].self, from: data)
        return rewards
    } catch {
        throw RewardsDataError.decodingError
    }
}//simulate local operator sending reward to customers

func redeemReward(itemInfo: RewardItem) async throws -> [RewardItem]{
    let endpoint = "http://localhost:8080/redeem-reward"
    guard let url = URL(string: endpoint) else{
        throw RewardsDataError.invalidURL
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body = ["itemId": itemInfo.id]
    
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
    let (data,response) = try await URLSession.shared.data(for: request)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
        throw RewardsDataError.invalidResponse
    }
    
    do{
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let rewards: [RewardItem] =  try decoder.decode([RewardItem].self, from: data)
        return rewards
    } catch {
        throw RewardsDataError.decodingError
    }
}
    
enum RewardsDataError: Error{
    case invalidURL
    case invalidResponse
    case decodingError
}
