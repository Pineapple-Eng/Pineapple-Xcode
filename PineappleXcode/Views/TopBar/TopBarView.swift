//  Created by Dhamova on 2023-04-20.

import SwiftUI

struct TopBarView: View {
    var body: some View {
        HStack {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
            VStack(alignment: .leading, spacing: 0.0) {
                HStack(alignment: .top) {
                    Text("Pineapple")
                        .font(.title)
                        .bold()
                    Text("for_xcode")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                Text("ai_extension")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fontWeight(.medium)
            }
            Spacer()
        }
        .padding([.horizontal, .top])
        Divider()
            .padding(.horizontal)
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
    }
}
