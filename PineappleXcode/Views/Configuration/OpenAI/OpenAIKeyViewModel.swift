// Created by Dhamova on 2023-04-20.

import Foundation

class OpenAIKeyViewModel: ObservableObject {
    @Published var error: Error? = nil
    @Published var keyStatus: OpenAPIKeyStatus = .loading

    init(error: Error? = nil, keyStatus: OpenAPIKeyStatus = .loading) {
        self.error = error
        self.keyStatus = keyStatus

        retrieveSecureValue(account: .open_ai,
                            service: .api_key) { data in
            DispatchQueue.main.async {
                if data != nil {
                    self.keyStatus = .available
                } else {
                    self.keyStatus = .empty
                }
            }
        }
    }

    func updateKey(_ key: String) {
        guard !key.isEmpty else { return }
        DispatchQueue.main.async {
            self.error = nil
            self.keyStatus = .loading
        }

        storeSecureValue(Data(key.utf8),
                         account: .open_ai,
                         service: .api_key,
                         completion: { error in
            DispatchQueue.main.async {
                if let err = error {
                    self.error = err
                } else {
                    self.keyStatus = .available
                }
            }
        })
    }

    func deleteKey() {
        DispatchQueue.main.async {
            self.error = nil
            self.keyStatus = .loading
        }

        deleteSecureValue(account: .open_ai,
                          service: .api_key,
                          completion: { error in
            DispatchQueue.main.async {
                if let err = error {
                    self.error = err
                } else {
                    self.keyStatus = .empty
                }
            }
        })
    }
}
