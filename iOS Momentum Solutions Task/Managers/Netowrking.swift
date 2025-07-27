//
//  APICaller.swift
//  iOS Momentum Solutions Task
//
//  Created by mohamed ahmed on 24/07/2025.
//

import Foundation
import Combine

enum APIError: Error{
    case ErrorToGetData
}

struct Constants{
    static let API_KEY = "88eb46b0e8f95dec5a9558050b030d0c"
    static let baseURL = "https://api.themoviedb.org"
//    https://api.themoviedb.org/3/trending/all/day?api_key=88eb46b0e8f95dec5a9558050b030d0c
}


import Foundation

let APIKey = "88eb46b0e8f95dec5a9558050b030d0c"
let youtubeAPIKey = "AIzaSyDqX8axTGeNpXRiISTGL7Tya7fjKJDYi4g"


class Networking {

    static let shared = Networking()

    func fetchData(with keyWord: String, completion: @escaping (Result<[Title], Error>) -> Void) {

            let url = URL(string: "https://api.themoviedb.org/3/\(keyWord)?api_key=78ebc7dcbb138a974637b43f956efbdc")

            guard let url = url else {return}
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { data,
                respone,
                error in

                let decoder = JSONDecoder()
                guard let data = data else {return}
                do {
                    let results = try decoder.decode(AllData.self, from: data)
                    guard let myResults = results.results else {return}
                    completion(.success(myResults))
                } catch {
                    completion(.failure(error))
                }
            }
            dataTask.resume()
    }


    func getDiscoverdMovies(with keyWord: String, completion: @escaping (Result<[Title], Error>) -> Void) {

        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=\(APIKey)") else {return }

            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { data,
                respone,
                error in

                let decoder = JSONDecoder()
                guard let data = data else {return}
                do {
                    let results = try decoder.decode(AllData.self, from: data)
                    guard let myResults = results.results else {return}
                    completion(.success(myResults))
                } catch {
                    completion(.failure(error))
                    print(error)
                }

            }
            dataTask.resume()
    }

    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {

            guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}

        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(APIKey)&query=\(query)") else {return}


            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data,
                response,
                error in

                guard let data = data else {
                    return
                }

                do {
                    let results = try JSONDecoder().decode(AllData.self, from: data)
                    guard let myResults = results.results else {return}
                    completion(.success(myResults))

                } catch {
                    completion(.failure(error))
                    print(error)

                }
            }
            task.resume()
        }

    func getTitlePreview(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {

            guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
            guard let url = URL(string: "https://youtube.googleapis.com/youtube/v3/search?q=\(query)&key=\(youtubeAPIKey)") else {
                return
            }

            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data,
                response,
                error in

                guard let data = data else {
                    return
                }

                do {
                    let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                    guard let myResults = results.items else {return}
                    completion(.success(myResults[0]))

                } catch {
                    completion(.failure(error))
                    print(error)

                }
            }
            task.resume()
        }


}






//
//    public func getProducts()
//    async  {
//        let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day")!
//        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
//        let queryItems: [URLQueryItem] = [
//          URLQueryItem(name: "language", value: "en-US"),
//        ]
//        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
//
//        var request = URLRequest(url: components.url!)
//        request.httpMethod = "GET"
//        request.timeoutInterval = 10
//        request.allHTTPHeaderFields = [
//          "accept": "application/json",
//          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4OGViNDZiMGU4Zjk1ZGVjNWE5NTU4MDUwYjAzMGQwYyIsIm5iZiI6MTc1MzM1NjkzMy42NTY5OTk4LCJzdWIiOiI2ODgyMWE4NTRhMjdlNTQyYWVkOWEyODciLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.ThXHPI2gSBBiTOS7HlF5AGgkFT0vEAfSlbSqS-DUlDc"
//        ]
//
//        do {
//            let (data, _) = try await URLSession.shared.data(for: request)
//            // Process the received data here
//            print(String(decoding: data, as: UTF8.self))
//
//        } catch {
//            // Handle the error here
//            print("Error during network request: \(error.localizedDescription)")
//            // You can also perform specific error handling based on the error type
//            // e.g., if let urlError = error as? URLError { ... }
//        }
//    }

