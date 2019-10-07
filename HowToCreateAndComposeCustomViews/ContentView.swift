//
//  ContentView.swift
//  HowToCreateAndComposeCustomViews
//
//  Created by ramil on 07/10/2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct User {
    var name: String
    var jobTitle: String
    var emailAddress: String
    var profilePicture: String
}

struct ProfilePicture: View {
    var imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
    }
}

struct EmailAddress: View {
    var address: String

    var body: some View {
        HStack {
            Image(systemName: "envelope")
            Text(address)
        }
    }
}

struct ContentView: View {
    let user = User(name: "RI", jobTitle: "with Swift", emailAddress: "ri@test.com", profilePicture: "RI")

    var body: some View {
        UserView(user: user)
    }
}

struct UserDetails: View {
    var user: User

    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.largeTitle)
                .foregroundColor(.primary)
            Text(user.jobTitle)
                .foregroundColor(.secondary)
            EmailAddress(address: user.emailAddress)
        }
    }
}

struct UserView: View {
    var user: User

    var body: some View {
        HStack {
            ProfilePicture(imageName: user.profilePicture)
            UserDetails(user: user)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
