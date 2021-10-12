//
//  ChatbotViewModel.swift
//  CreativeIdeation
//
//  Created by Kellen Evoy on 2021-10-05.
//

import Foundation

final class ChatbotViewModel: ObservableObject {
    // Reference to singleton chatbot instance
    private let chatbot = WatsonAssistant.instance

    /// Chat log containing message history with chatbot in order (array of tuples)
    @Published var chatlog: [Message] = []

    /// Send message to chatbot and expect response
    func send(text: String) {

        // Append message to chat log
        chatlog.append((Message(status: .sent, text: text)))

        chatbot.sendTextToAssistant(text: text) { result in
            switch result {
            case .success(let response):
                if let generic = response.output.generic {
                    let chatbotResponse = self.chatbot.processGenericResponse(assistantResponse: generic)
                    switch chatbotResponse.responseType {
                    case .text:
                        print("Text")
                        self.chatlog.append(Message(status: .received, text: chatbotResponse.text))
                    case .option:
                        self.chatlog.append(Message(status: .received, text: chatbotResponse.text))
                        for opt in chatbotResponse.options {
                            self.chatlog.append(Message(status: .received, text: opt))
                        }
                    }
                    print("chatbotViewModel: Send success")
                } else {
                    self.chatlog.append(Message(status: .received, text: "Invalid response."))
                    print("chatbotViewModel: Invalid response")
                }

                print(self.chatlog)
            default:
                self.chatlog.append(Message(status: .received, text: "Chatbot is offline, please try again later."))
                print("chatbotViewModel: Default")
            }
        }
    }
}
