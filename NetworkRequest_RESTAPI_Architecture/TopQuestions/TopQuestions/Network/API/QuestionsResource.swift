import Foundation

// MARK: - QuestionsResource
//model che mandiamo, da compilare
struct QuestionsResource: APIResource {
    
    //modello da tornare > se ne voglio aggiungere un altro, creo un servizio uguale ma con model diverso > path diverso e filtri...
    typealias ModelType = Question
    var id: Int?
    
    var methodPath: String {
        guard let id = id else {
            return "/questions"
        }
        return "/questions/\(id)"
    }
    
    var filter: String? {
        id != nil ? "!9_bDDxJY5" : nil
    }
}
