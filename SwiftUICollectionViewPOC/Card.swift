//
//  Card.swift
//  SwiftUICollectionViewPOC
//
//  Created by Matthew Garlington on 3/18/22.
//

import SwiftUI

struct Card: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Image("HollyPic")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 4))

            Text("One Holly for Sale")
                .font(.headline)

            Text("\("Warning".uppercased()): Cries for no reason, wants walks constantly, and is never Fed enough")
                .font(.body)
                .lineLimit(3)
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card()
    }
}
