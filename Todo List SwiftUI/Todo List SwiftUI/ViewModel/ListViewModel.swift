//
//  ListViewModel.swift
//  Todo List SwiftUI
//
//  Created by Bola Gamal on 08/10/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet { saveItem() }
    }
    
    init() {
        getItems()
    }
    
    private func getItems() {
        guard let data = UserDefaults.standard.data(forKey: Constans.UD.ITEMS_LIST),
              let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title:String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    private func saveItem() {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodeData, forKey: Constans.UD.ITEMS_LIST)
        }
    }
}


enum Constans {
    enum UD {
        static let ITEMS_LIST = "items_list"
    }
}
