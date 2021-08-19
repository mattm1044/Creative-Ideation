//
//  UpdatePasswordSetttings.swift
//  CreativeIdeation
//
//  Created by Vanessa Li on 2021-04-09.
//

import SwiftUI

struct UpdatePasswordSheet: View {

    @State var newPassword: String = ""
    @State var oldPassword: String = ""
    @State var confirmPassword: String = ""
    @Binding var showSheet: PreferenceSheet?
    @EnvironmentObject var userAccountViewModel: UserAccountViewModel

    var body: some View {
        ZStack {

            Color("BackgroundColor")

            if userAccountViewModel.showBanner {
                if !userAccountViewModel.updateSuccess {
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
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    if userAccountViewModel.isLoading {
                        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color("brandPrimary")))
                            .scaleEffect(3).padding()
                    }
                    // Sheet Title
                    Text("Change Password")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.bottom)
                        .padding(.top)
                    Text("A strong password helps prevent unauthorized access to your account")
                        .padding()

                    VStack(alignment: .leading) {

                        // Enter New Password TextField
                        Text("Enter New Password")
                            .font(.title3)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.leading)

                        EditTextField(title: "new password ", input: $newPassword, secure: true, geometry: geometry, widthScale: 0.75).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)

                        // Re-enter New Password Text box
                        Text("Re-enter New Password")
                            .font(.title3)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.leading)

                        EditTextField(title: "re-enter new password ", input: $confirmPassword, secure: true, geometry: geometry, widthScale: 0.75).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)

                        // Confirm change Text Field
                        Text("Old Password")
                            .font(.title3)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.leading)

                        EditTextField(title: "enter old password to confirm change ", input: $oldPassword, secure: true, geometry: geometry, widthScale: 0.75).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)

                    }
                    Button {
                        // Update to DB
                        userAccountViewModel.updateUserPassword(newPassword: newPassword,
                                                                confirmPassword: confirmPassword,
                                                                oldPassword: oldPassword)
                        newPassword = ""
                        confirmPassword = ""
                        oldPassword = ""
                    } label: {
                        BigButton(title: "Submit")
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

        }
        .onDisappear {
            // if flag is true means update is sucessful and log user out
            if userAccountViewModel.logOutFlag {
                userAccountViewModel.logOutFlag = false
                userAccountViewModel.signOut()
            }
            showSheet = nil
        }
    }
}

struct UpdatePasswordSetttings_Previews: PreviewProvider {
    static var previews: some View {
        UpdatePasswordSheet(showSheet: .constant(.password)).preferredColorScheme(.dark).environmentObject(UserAccountViewModel())
    }
}
