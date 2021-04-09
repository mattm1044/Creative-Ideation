//
//  UpdatePasswordSetttings.swift
//  CreativeIdeation
//
//  Created by Vanessa Li on 2021-04-09.
//

import SwiftUI

struct UpdatePasswordView: View {

    @State var newPassword: String = ""
    @State var oldPassword: String = ""
    @Binding var showSheet: PreferenceSheet?
    @EnvironmentObject var userAccountViewModel: UserAccountViewModel

    var body: some View {
        ZStack {
            if userAccountViewModel.showBanner {
                if !userAccountViewModel.createSuccess {
                    NotificationBanner(image: "exclamationmark.circle.fill",
                                       msg: userAccountViewModel.msg, color: .red)
                } else {
                    NotificationBanner(image: "checkmark.circle.fill",
                                       msg: userAccountViewModel.msg, color: .green)
                }
            }
            VStack {
                HStack {
                    Spacer()
                    Button {
                        showSheet = nil
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(Color(.label))
                            .imageScale(.large)
                            .frame(width: 80, height: 80)
                    }
                }
                .padding()
                Spacer()
            }

            VStack {
                Spacer()
                // Sheet Title
                Text("Change Password")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.bottom)
                Text("A strong password helps prevent unauthroized access to your account")
                    .padding()

                VStack(alignment: .leading) {

                    Text("Enter New Password")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.leading)

                    MenuTextField(title: "new password ", input: $newPassword)

                    Text("Re-enter New Password")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.leading)

                    MenuTextField(title: "new password ", input: $newPassword)

                    Text("Old Password")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.leading)

                    MenuTextField(title: "enter old password to confirm change ", input: $newPassword)

                }
                Button {
                    // save to DB call view model function to update DB
                    //userAccountViewModel.updateUserEmail(email: newPassword)
                    newPassword = ""
                } label: {
                    SubmitButton()
                }
                Spacer()
            }

        }

    }
}

struct UpdatePasswordSetttings_Previews: PreviewProvider {
    static var previews: some View {
        UpdatePasswordView(showSheet: .constant(.password)).environmentObject(UserAccountViewModel())
    }
}
