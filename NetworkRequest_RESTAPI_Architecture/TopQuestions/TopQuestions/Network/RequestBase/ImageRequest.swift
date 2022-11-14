import UIKit

// MARK: - ImageRequest
// una semplice url
class ImageRequest {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
}

//estenzione che rispetta il protocollo, se il decode è diverso dal base, lo specifico
//questo caso per le immagini...
extension ImageRequest: NetworkRequest {
    func decode(_ data: Data) -> UIImage? {
        return UIImage(data: data)
    }
    
    func execute(withCompletion completion: @escaping (UIImage?) -> Void) {
        load(url, withCompletion: completion)
    }
}
