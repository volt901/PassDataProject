//
//  ContentView.swift
//  PassDataProject
//
//  Created by Владимир Ширяев on 12.12.2021.
//

import SwiftUI
struct User {
    let userName: String
    let userPassword: String
}

let secureUser = User(userName: "Vova", userPassword: "Vova")


struct DetailView: View {
    var body: some View {
        Text("Hello")
    }
}
struct ContentView: View {
    @State private var showingAlert = false
    @State private var password = ""
    @State private var userName = ""
    @State var selection: Int? = nil
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    SecureField("USERNAME", text: $userName)
                    TextField("PASSWORD", text:$password)
                }.textFieldStyle(.roundedBorder).padding()
                
                NavigationLink(destination:
                                DetailView(), tag:1, selection: $selection) {
                    Button(action: {
                        print("login tapped")
                        if password == secureUser.userPassword {
                            self.selection = 1
                        } else {
                            self.selection = 999
                            showingAlert = true
                        }
                    }) // :ACTION BUTTON
                    {
                        HStack {
                            Spacer()
                            Text("Login").foregroundColor(Color.white).bold()
                            Spacer()
                        }
                    }//: TEXT BUTTON
                    .accentColor(Color.black)
                    .padding()
                    .background(Color(UIColor.darkGray))
                    .cornerRadius(4.0)
                    .padding()
                    .alert("Error", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        } //: ALER
                }//:NavigationLink
            }//:VSTACK
        }//:NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

