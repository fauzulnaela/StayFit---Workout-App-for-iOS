//
//  ChatViewViewModel.swift
//  Sehat
//
//  Created by Naela Fauzul Muna on 10/08/23.
//

import Foundation

extension ChatView {
    class ChatViewViewModel : ObservableObject {
        @Published var messages : [Message] = [Message(id: UUID(), role: .system, content: "You are a sports assistant, nutritionist and health expert, provide sports recommendations based on user input considering the nutrition and health context in South East Asia region. in bahasa. focus on the health, healthy consumptions, and activities based on the people in South East Asia Region", createAt: Date())]
        @Published var input: String = ""
        
        private let openAIService = OpenAIService()
        func sendMessage(){
            let newMessage = Message(id: UUID(), role: .user, content: input, createAt: Date())
            messages.append(newMessage)
            input = ""
            
            //untuk mendapatkan response
            Task {
                let response = await openAIService.sendMessage(messages: messages)
                guard let recievedOpenAIMessage = response?.choices.first?.message else{
                    print("Tidak menerima pesan")
                    return
                    
                }
                let recievedMessage = Message(id: UUID(), role: recievedOpenAIMessage.role, content: recievedOpenAIMessage.content, createAt: Date())
                await MainActor.run{
                    messages.append(recievedMessage)
                }
            }
            
        }
    }
}

struct Message: Decodable {
    let id : UUID
    let role: SenderRole
    let content : String
    let createAt: Date
}
