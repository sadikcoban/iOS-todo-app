//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Sadık Çoban on 9.09.2021.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
            .antialiased(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
