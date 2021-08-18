//
//  VotingSticky.swift
//  CreativeIdeation
//
//  Created by Matthew Marini on 2021-08-16.
//

import SwiftUI

/// Represents a sticky note within the Voting sheet
struct VotingSticky: View, Identifiable {
    var id = UUID()

    @State var itemId: String = ""
    @State var chosenColor = Color.red
    @State var input = "Hello"
    @State var pos = 0  // the position of the sticky note in the list
    @State private var translation: CGSize = .zero

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                // Header
                Rectangle()
                    .foregroundColor(chosenColor)
                    .frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.05)

                // Text area
                Text(input)
                    .frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.25)
                    .background(chosenColor.lighter())
                    .foregroundColor(Color("StrokeColor"))
            }
            .cornerRadius(10)
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center/*@END_MENU_TOKEN@*/)
            .animation(.interactiveSpring())
            .offset(x: self.translation.width, y: 0)
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.translation = value.translation
                    }.onEnded { _ in
                        self.translation = .zero
                    }
            )
        }
    }
}

struct VotingSticky_Previews: PreviewProvider {
    static var previews: some View {
        VotingSticky()
    }
}
