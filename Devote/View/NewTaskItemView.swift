//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Sadık Çoban on 9.09.2021.
//

import SwiftUI

struct NewTaskItemView: View {
    //MARK: - Property
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @Environment(\.managedObjectContext) private var viewContext
    @State private var task: String = ""
    
    @Binding var isShowing: Bool
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    var body: some View {
        VStack(content: {
            Spacer()
            VStack{
                VStack(alignment: .center, spacing: 16, content: {
                    TextField("New Task", text: $task)
                        .padding()
                        .background(isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                        .foregroundColor(.pink)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    
                    Button(action: {
                        addItem()
                        playSound(sound: "sound-ding", type: "mp3")
                        feedback.notificationOccurred(.success)

                    }, label: {
                        Spacer()
                        Text("SAVE")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                        Spacer()
                    })//:Button
                    .disabled(isButtonDisabled)
                    .onTapGesture {
                        if isButtonDisabled {
                            playSound(sound: "sound-tap", type: "mp3")
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background( isButtonDisabled ? Color.blue : Color.pink)
                    .cornerRadius(10)
                })//:VStack
                .padding(.horizontal)
                .padding(.vertical, 20)
                .background(isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.65), radius: 24)
                .frame(maxWidth: 640)
                
            }//:VStack
            .padding()
            
        })//:VStack
        .padding()
    }
    //MARK: - Functions
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            task = ""
            hideKeyboard()
            isShowing = false
        }
    }
    
    
}

struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .background(Color.gray.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
    }
}
