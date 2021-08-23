//
//  CreateTeamsView.swift
//  CreativeIdeation
//
//  Created by Vanessa Li on 2021-02-24.
//

import SwiftUI
import Firebase

struct CreateTeamSheet: View {

    @State private var showBanner: Bool = false
    @Binding var showSheets: ActiveSheet?

    @State var teamName: String = ""
    @State var teamDescription: String = ""

    @EnvironmentObject var teamViewModel: TeamViewModel

    var body: some View {

        ZStack {

            Color("BackgroundColor")

            VStack {
                XDismissButton(isShowingSheet: $showSheets)
                Spacer()
            }

            GeometryReader { geometry in
                VStack {

                    Text("Create Your Team")
                        .font(.system(size: 40))
                        .padding()

                    VStack {

                        EditTextField(title: "Team name", input: $teamName, geometry: geometry, widthScale: 0.75)

                        EditTextField(title: "Team description (optional)", input: $teamDescription, geometry: geometry, widthScale: 0.75)

                        Button {
                            teamViewModel.createTeam(teamName: teamName, teamDescription: teamDescription)
                            teamName = ""
                            teamDescription = ""
                        } label: {
                            BigButton(title: "Create", geometry: geometry, widthScale: 0.75)
                                .padding(.top, 5)
                        }

                        Text("or")
                            .hidden()

                        // Create Acc Button
                        NavigationLink(destination: EmptyView()) {
                            Text("Reactivate pre-existing team.")
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.top)
                        .hidden()

                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .banner(data: $teamViewModel.bannerData, show: $teamViewModel.showBanner)
        }
    }

    private func delayAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation {
                showBanner = false
            }
        }
    }
}

struct CreateTeamView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTeamSheet(showSheets: .constant(.team))
            .preferredColorScheme(.dark)
            .environmentObject(TeamViewModel())
    }
}