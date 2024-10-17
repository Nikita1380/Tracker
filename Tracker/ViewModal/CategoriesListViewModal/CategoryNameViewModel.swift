import UIKit

final class CategoryNameViewModel: Identifiable {
    private let name: String
    
    var nameBinding: Binding<String>? {
        didSet {
            nameBinding?(name)
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    func getName() -> String{
        return name
    }
}
