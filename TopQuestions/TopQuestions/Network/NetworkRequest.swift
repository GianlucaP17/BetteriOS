import Foundation

// MARK: - NetworkRequest
protocol NetworkRequest: AnyObject {
	associatedtype ModelType
	func decode(_ data: Data) -> ModelType?
	func execute(withCompletion completion: @escaping (ModelType?) -> Void)
}

//metodo che uso dentro a execute
extension NetworkRequest {
	 func load(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void) {
		let task = URLSession.shared.dataTask(with: url) { [weak self] (data, _ , _) -> Void in
            guard let data = data, let value = self?.decode(data) else {
				DispatchQueue.main.async { completion(nil) }
				return
			}
			DispatchQueue.main.async { completion(value) }
		}
		task.resume()
	}
}
