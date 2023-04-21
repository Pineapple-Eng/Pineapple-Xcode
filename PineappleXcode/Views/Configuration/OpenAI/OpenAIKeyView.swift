// Created by Dhamova on 2023-04-20.

import SwiftUI

struct OpenAIKeyView: View {
    @StateObject var viewModel = OpenAIKeyViewModel()

    var body: some View {
        Text("\(Image(systemName: "key.horizontal.fill")) \(NSLocalizedString("open_api_key", comment: ""))")
            .font(.headline)
            .bold()
        if viewModel.keyStatus == .available {
            EditKeyView(viewModel: viewModel)
        } else if viewModel.keyStatus == .loading {
            ProgressView()
                .progressViewStyle(.circular)
        } else {
            AddKeyView(viewModel: viewModel)
        }
        Text("key_security_description")
            .font(.footnote)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
    }
}

struct OpenAIKeyView_Previews: PreviewProvider {
    static var previews: some View {
        OpenAIKeyView()
    }
}
