//
//  ChatView.swift
//  Sehat
//
//  Created by Naela Fauzul Muna on 04/08/23.
//

import SwiftUI
import UIKit

struct ChatView: View {
    @ObservedObject var viewModel = ChatViewViewModel()
    @FocusState private var nameIsFocused: Bool
    var body: some View {
        
        NavigationView{
            VStack {
                ScrollView{
                    ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id) { message in
                        messageView(message: message)
                    }
                    
                }
                HStack{
                    TextField("Ketik disini...", text: $viewModel.input)
                        .focused($nameIsFocused)
                    Button {
                        viewModel.sendMessage()
                        nameIsFocused = false
                    } label: {
                        Text("Kirim")
                    }
                }
            }
            .padding()
        }
    }
    func messageView(message: Message) -> some View {
        HStack{
            if message.role == .user {Spacer()}
            Text(message.content)
                .padding()
                .background(message.role == .user ? Color.black : Color.gray.opacity(0.2))
                .foregroundColor(message.role == .user ? Color.white : Color.black)
                .cornerRadius(20)
            if message.role == .assistant { Spacer()}
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ChatView()
        }
    }
}


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
