import Foundation

class CategoryNamesListViewModel {
    var namesBinding: Binding<[CategoryNameViewModel]>?

    private let trackerCategoryStore = TrackerCategoryStore()

    private(set) var names: [CategoryNameViewModel] = [] {
        didSet {
            namesBinding?(self.names)
        }
    }

    private let selectedCategory: String

    init(selectedCategory: String) {
        self.selectedCategory = selectedCategory
        trackerCategoryStore.delegate = self
        names = trackerCategoryStore.categories.map{
            CategoryNameViewModel(
                name: $0.title
            )
        }
    }

    func addNewTrackerCategory(_ trackerCategoryName: String) {
        try? trackerCategoryStore.addNewTrackerCategory(trackerCategoryName)
    }

    func getSelectedCategory() -> String {
        return selectedCategory
    }
}

extension CategoryNamesListViewModel: TrackerCategoryStoreDelegate {
    func storeCategory() {
        names = trackerCategoryStore.categories.map{
            CategoryNameViewModel(
                name: $0.title
            )
        }
    }
}
