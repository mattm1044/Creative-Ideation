//
//  SessionItem.swift
//  CreativeIdeation
//
//  Created by Matthew Marini on 2021-02-25.
//

import SwiftUI

struct SessionTile: View {

    var title: String = "Example Title"
    var activity: String = "Sticky Notes"
    var image: String = "post-it"
    var date: String = "25-Feb-2021"
    var inProgress: Bool = true
    var team: String = "Big Company"
    var group: String = "Marketing"

    var session: Session

    var body: some View {
        VStack(spacing: 3) {

            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(maxWidth: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.yellow]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing))

            HStack {
                Text(activity)
                    .font(.caption)
                    .foregroundColor(Color("FadedColor"))

                Spacer()

                Text(date)
                    .font(.caption)
                    .foregroundColor(Color("FadedColor"))
            }
            .padding(3)

            Text(session.sessionTitle)
                .font(.title3)
                .foregroundColor(Color("StrokeColor"))

            Text(team + " - " + group)
                .font(.caption)
                .italic()
                .foregroundColor(Color("StrokeColor"))

            HStack(alignment: .bottom, spacing: 5) {
                ProfilePic(size: 30)

                Text("Owner")
                    .font(.caption)
                    .foregroundColor(Color("FadedColor"))

                Spacer()
            }
            .padding(.bottom, 5)
            .padding(.horizontal, 10)
        }
        .frame(width: 200, height: 200)
        .cornerRadius(25)
        .overlay(RoundedRectangle(cornerRadius: 25.0)
                    .stroke(Color("StrokeColor"), lineWidth: 2.0))
    }
}

struct SessionItem_Previews: PreviewProvider {
    static var previews: some View {
        SessionTile(session: Session(sessionTitle: "Sample Title", type: "Sticky Notes"))
    }
}
