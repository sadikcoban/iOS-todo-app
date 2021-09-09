//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Sadık Çoban on 9.09.2021.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
