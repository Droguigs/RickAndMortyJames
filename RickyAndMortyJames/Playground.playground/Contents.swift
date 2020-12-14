import Foundation

let queryItems: [URLQueryItem]

private func getQueryString(_ queryItems: [URLQueryItem]) -> String {
    var urlComponents = URLComponents(string: "")
    urlComponents?.queryItems = queryItems
    
    return urlComponents?.url?.absoluteString ?? ""
}

print(getQueryString([URLQueryItem(name: "name", value: "Citadel of Ricks"), URLQueryItem(name: "name", value: "123"), URLQueryItem(name: "name", value: "123"), URLQueryItem(name: "name", value: "123")]))

private func multipleIds(_ ids: [Int]) -> String {
    var idString = ""
    for id in ids {
        if id != ids[0] {
            idString += ",\(id)"
        } else {
            idString += "\(id)"
        }
    }
    return idString
}

print("\(multipleIds([1,2])) teste de enter")
