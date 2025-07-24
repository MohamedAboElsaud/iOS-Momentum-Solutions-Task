//
//  APICaller.swift
//  iOS Momentum Solutions Task
//
//  Created by mohamed ahmed on 24/07/2025.
//

import Foundation
import Combine

struct Constants{
    static let API_KEY = "88eb46b0e8f95dec5a9558050b030d0c"
    static let baseURL = "https://api.themoviedb.org"
//    https://api.themoviedb.org/3/trending/all/day?api_key=88eb46b0e8f95dec5a9558050b030d0c
}
class APICaller {
    static let shared = APICaller()

    func getTrendingMovies(completion: @escaping (Result<[Movie],Error>) -> Void)
    {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {
            return
        }
        print(url)
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode([Movie].self, from: data)
                completion(.success( results))
                print(results)
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    

    func getTrendingTvs(completion: @escaping (Result<TrendingTvResponse, Error>)-> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
                completion(.success( results))
                print(results)
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }

    func getUpcomingMovies(completion: @escaping (Result<[Movie], Error>)-> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3//movie/upcoming?api_key=\(Constants.API_KEY)") else {
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                completion(.success( results.results))
                print(results)
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }

    func getPopularMovies(completion: @escaping (Result<[Movie], Error>)-> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3//movie/popular?api_key=\(Constants.API_KEY)") else { return }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                completion(.success( results.results))
                print(results)
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }

    func getTopRatedMovies(completion: @escaping (Result<[Movie], Error>)-> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3//movie/top_rated?api_key=\(Constants.API_KEY)") else { return }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                completion(.success( results.results))
                print(results)
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
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
}

