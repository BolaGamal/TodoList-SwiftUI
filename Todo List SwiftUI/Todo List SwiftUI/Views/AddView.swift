//
//  AddView.swift
//  Todo List SwiftUI
//
//  Created by Bola Gamal on 08/10/2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle = ""
    @State var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type somthing here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(10)
                
                Button(action: saveAction, label: {
                    Text("save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an item ✍🏼")
        .alert("Alert", isPresented:  $showAlert) {
            Button("OK") {}
        } message: {
           Text(alertTitle)
        }

    }
    
    func saveAction() {
        if textAppropriate() {
            viewModel.addItem(title: textFieldText)
            dismiss.callAsFunction()
        }
    }
    
    func textAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "your new todo item must be at least 3 characters long‼️"
            showAlert.toggle()
            return false
        }
        return true
    }
}

#Preview {
    NavigationView(content: {
        AddView()
    }).environmentObject(ListViewModel())
}
