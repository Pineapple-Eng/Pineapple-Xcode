// Created by Dhamova on 2023-04-20.

import SwiftUI

struct FooterView: View {
    var body: some View {
        HStack {
            Text("© Dhamova Inc")
                .font(.footnote)
                .foregroundColor(.secondary)
            Spacer()
            Text("made_in_canada")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .padding([.bottom, .horizontal])
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
