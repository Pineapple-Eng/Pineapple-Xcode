// Created by Dhamova on 2023-04-20.

import Foundation
import OpenAI

public let OpenAIBaseURL = "https://api.openai.com/v1"

public func isOpenAIAvailableForCommand(completion: @escaping (_ available: Bool) -> Void) {
    retrieveSecureValue(account: .open_ai, service: .api_key) { data in
        completion(data != nil)
    }
}

public func openAIRequest(prompt: String, completion: @escaping (_ code: String?) -> Void) {
    retrieveSecureValue(account: .open_ai, service: .api_key) { data in
        if let data = data {
            let key = String(decoding: data, as: UTF8.self)
            let openAI = OpenAI(apiToken: key)
            let query = ChatQuery(model: .gpt3_5Turbo,
                                  messages: [
                                    .init(role: .system, content: "You are Pineapple, a code generation assistant that only replies back with source code."),
                                    .init(role: .user, content: prompt)
                                  ])
            Task {
                do {
                    let result = try await openAI.chats(query: query)
                    completion(result.choices.first?.message.content)
                } catch {
                    print(error.localizedDescription)
                    completion(nil)
                }
            }
        } else {
            openMainApp()
            completion(nil)
        }
    }
}
