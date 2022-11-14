import Foundation

// MARK: - APIResource
//risorsa per costruire la url
//parametri di entrata
protocol APIResource {
    // se voglio qualcosa di ancora più astratto perchè voglio farlo riutilizzabile in altre app > url come parametro, cosi come i filtri da mettere...
    associatedtype ModelType: Decodable
    var methodPath: String { get }
    var filter: String? { get }
}

//fa da solo la composizione
extension APIResource {
    var url: URL {
        var components = URLComponents(string: "https://api.stackexchange.com/2.2")!
        components.path = methodPath
        components.queryItems = [
            URLQueryItem(name: "site", value: "stackoverflow"),
            URLQueryItem(name: "order", value: "desc"),
            URLQueryItem(name: "sort", value: "votes"),
            URLQueryItem(name: "tagged", value: "swiftui"),
            URLQueryItem(name: "pagesize", value: "10")
        ]
        if let filter = filter {
            components.queryItems?.append(URLQueryItem(name: "filter", value: filter))
        }
        return components.url!
    }
}
