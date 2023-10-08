//
//  ListView.swift
//  Todo List SwiftUI
//
//  Created by Bola Gamal on 08/10/2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var viewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if viewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }else {
                List {
                    ForEach(viewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                viewModel.updateItem(item: item)
                            }
                    }
                    .onDelete(perform: viewModel.deleteItem)
                    .onMove(perform: viewModel.moveItem)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📝")
        .toolbar(content: {
            ToolbarItemGroup(placement: .topBarTrailing) {
                NavigationLink("Add") { AddView() }
                    .bold()
            }
            ToolbarItemGroup(placement: .topBarLeading) {
                EditButton()
                    .bold()
            }
        })
    }
    
 
}

#Preview {
    NavigationView(content: {
        ListView()
    }).environmentObject(ListViewModel())
}


