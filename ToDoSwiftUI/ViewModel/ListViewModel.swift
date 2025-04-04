import Foundation

final class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    init(){
        getItems()
    }
    
    func deleteRow(_ indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveRow(_ from: IndexSet, _ to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(_ title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(_ item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted.toggle()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: "items")
        }
    }
    
    private func getItems() {
        guard let data = UserDefaults.standard.data(forKey: "items") else { return }
        guard let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
        self.items = savedItem
    }
}
