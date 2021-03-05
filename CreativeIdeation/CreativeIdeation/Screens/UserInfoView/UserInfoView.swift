//
//  UserInfoView.swift
//  CreativeIdeation
//
//  Created by Matthew Marini on 2021-02-17.
//

import SwiftUI

struct UserInfoView: View {
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            HStack {
                
                VStack(alignment: .leading){
                    
                    VStack(alignment: .leading){
                        
                        Text("Welcome to Ponder!")
                            .font(.largeTitle)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        Text("Help us get to know you better:")
                            .font(.title)
                        
                    }
                    .padding()
                    
                    Spacer()
                        .frame(height: 35)
                    
                    Text("What is your role?")
                        .font(.title)
                        .padding()
                    
                    HStack{
                        
                        Button {
                            // do something - navigate to different screen
                        } label: {
                            PreferenceButton(title: "Student", selected: true)
                        }
                        
                        Button {
                            // do something - navigate to different screen
                        } label: {
                            PreferenceButton(title: "Teacher")
                        }
                        
                        Button {
                            // do something - navigate to different screen
                        } label: {
                            PreferenceButton(title: "Employee")
                        }
                    }
                    
                    HStack{
                        
                        Button {
                            // do something - navigate to different screen
                        } label: {
                            PreferenceButton(title: "Administrator")
                        }
                        
                        Button {
                            // do something - navigate to different screen
                        } label: {
                            PreferenceButton(title: "Individual")
                        }
                        
                        Button {
                            // do something - navigate to different screen
                        } label: {
                            PreferenceButton(title: "Other")
                        }
                        
                    }
                    
                    Text("What industry do you work in?")
                        .font(.title)
                        .padding()
                    
                    HStack{
                        
                        Button {
                            // do something - navigate to different screen
                        } label: {
                            PreferenceButton(title: "Marketing")
                        }
                        
                        Button {
                            // do something - navigate to different screen
                        } label: {
                            PreferenceButton(title: "Technology", selected: true)
                        }
                        
                        Button {
                            // do something - navigate to different screen
                        } label: {
                            PreferenceButton(title: "Business")
                        }
                        
                    }
                    
                    HStack {
                        
                        Button {
                            // do something - navigate to different screen
                        } label: {
                            PreferenceButton(title: "Education")
                        }
                        
                        Button {
                            // do something - navigate to different screen
                        } label: {
                            PreferenceButton(title: "Entertainment")
                        }
                        
                        Button {
                            // do something - navigate to different screen
                        } label: {
                            PreferenceButton(title: "Other")
                        }
                        
                    }
                }
            }
            
            NavigationLink(destination: GroupView()) {
                BigButton(title: "Next")
            }
            .padding(.top)
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
