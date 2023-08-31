//
//  OpenAIServices.swift
//  Sehat
//
//  Created by Naela Fauzul Muna on 10/08/23.
//
import Foundation
import Alamofire

class OpenAIService {
    private let URL = "https://api.openai.com/v1/chat/completions"
    
    func sendMessage(messages: [Message]) async -> OpenAIChatResponse? {
        let OpenAIMessages = messages.map({OpenAIChatMessage(role: $0.role, content: $0.content)})
        let body = OpenAIChatBody(model: "gpt-3.5-turbo", messages: OpenAIMessages, stream: false, temperature: 0.7)
        let headers : HTTPHeaders = [
            "Authorization" : "Bearer \(Key.APIKey)"
        ]
        return try? await AF.request(URL, method: .post, parameters: body, encoder: .json, headers: headers).serializingDecodable(OpenAIChatResponse.self).value
        
    }
}

struct OpenAIChatBody: Encodable {
    let model: String
    let messages: [OpenAIChatMessage]
    let stream: Bool
    let temperature: Float?
}

struct OpenAIChatMessage: Codable {
    let role: SenderRole
    let content: String
}

enum SenderRole: String, Codable {
    case system
    case user
    case assistant
}

struct OpenAIChatResponse : Decodable {
    let choices: [OpenAIChatChoice]
    
}

struct OpenAIChatChoice: Decodable {
    let message: OpenAIChatMessage
}


