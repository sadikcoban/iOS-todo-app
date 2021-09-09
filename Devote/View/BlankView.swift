//
//  BlankView.swift
//  Devote
//
//  Created by Sadık Çoban on 9.09.2021.
//

import SwiftUI

struct BlankView: View {
    var body: some View {
        VStack(content: {
            Spacer()
        })
        .frame(minWidth: 0,  maxWidth: .infinity, minHeight: 0, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.black)
        .opacity(0.5)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView()
    }
}
