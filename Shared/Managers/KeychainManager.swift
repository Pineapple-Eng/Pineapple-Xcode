/**
 * Created by Dhamova on 2023-04-20.
 *
 * Manager responsible for setting and getting secured values from the local Keychain.
 * `The keychain is the best place to store small secrets, like passwords and cryptographic keys.` - Apple
 * See: https://developer.apple.com/documentation/security/certificate_key_and_trust_services/keys/storing_keys_in_the_keychain
 */

import Foundation

public func retrieveSecureValue(account: KeychainAccount,
                                service: KeychainService,
                                completion: @escaping (_ data: Data?) -> Void) {
    let query: [String : Any] = [
        kSecReturnData as String: true,
        kSecAttrAccount as String: account.rawValue,
        kSecAttrService as String: service.rawValue,
        kSecClass as String: kSecClassGenericPassword
    ]

    DispatchQueue.global(qos: .userInitiated).async {
        var result: AnyObject?
        SecItemCopyMatching(query as CFDictionary, &result)

        completion(result as? Data)
    }
}

public func storeSecureValue(_ data: Data,
                             account: KeychainAccount,
                             service: KeychainService,
                             completion: @escaping (_ error: Error?) -> Void) {
    let query: [String : Any] = [
        kSecAttrAccount as String: account.rawValue,
        kSecAttrService as String: service.rawValue,
        kSecClass as String: kSecClassGenericPassword,
        kSecValueData as String: data
    ]

    DispatchQueue.global(qos: .userInitiated).async {
        let status = SecItemAdd(query as CFDictionary, nil)
        switch status {
        case errSecDuplicateItem:
            updateSecureValue(data, account: account, service: service, completion: completion)
        case errSecSuccess:
            completion(nil)
        default:
            completion(NSError(domain: "keychain-store-error", code: 500))
        }
    }
}

public func updateSecureValue(_ data: Data,
                              account: KeychainAccount,
                              service: KeychainService,
                              completion: @escaping (_ error: Error?) -> Void) {
    let query: [String : Any] = [
        kSecAttrAccount as String: account.rawValue,
        kSecAttrService as String: service.rawValue,
        kSecClass as String: kSecClassGenericPassword
    ]

    let attributesToUpdate: [String : Any] = [kSecValueData as String: data]

    DispatchQueue.global(qos: .userInitiated).async {
        let status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
        guard status == errSecSuccess else {
            completion(NSError(domain: "keychain-update-error", code: 500))
            return
        }

        completion(nil)
    }
}

public func deleteSecureValue(account: KeychainAccount,
                              service: KeychainService,
                              completion: @escaping (_ error: Error?) -> Void) {
    let query: [String : Any] = [
        kSecAttrAccount as String: account.rawValue,
        kSecAttrService as String: service.rawValue,
        kSecClass as String: kSecClassGenericPassword
    ]

    DispatchQueue.global(qos: .userInitiated).async {
        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess else {
            completion(NSError(domain: "keychain-delete-error", code: 500))
            return
        }

        completion(nil)
    }
}
