// Created by Dhamova on 2023-04-20.

import AppKit

public func openMainApp() {
    let mainAppBundleID = "com.dhamova.PineappleXcode"
        let mainAppURL = NSWorkspace.shared.urlForApplication(withBundleIdentifier: mainAppBundleID)
        
        guard let url = mainAppURL else {
            print("Main app not found")
            return
        }

        NSWorkspace.shared.open(url)
}

public func closeMainApp() {
    NSApplication.shared.terminate(nil)
}
