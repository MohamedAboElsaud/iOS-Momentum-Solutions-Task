//
//  HomeView.swift
//  iOS Momentum Solutions Task
//
//  Created by mohamed ahmed on 26/07/2025.
//

import Foundation

protocol HomeView {
    func reloadTableView()
}

class HomeViewPresenter {
    
    var view: HomeView
    
    let sectionTitles : [String] = ["Trending Movies","Popular","Trending TV","Upcoming Movies","Top Rated"]
    
    init(_ view : HomeView) {
        self.view = view
    }
    
    func returnMovieArray(with cell : CollectionViewTableViewCell ,at indexPath: IndexPath) {
        switch indexPath.section {
        case sections.TrendingMovies.rawValue:
            Networking.shared.fetchData(with: #"trending/movie/day"#) { results in
                switch results {
                case .success(let movie):
                    cell.configure(with: movie)

                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case sections.Popular.rawValue:
            Networking.shared.fetchData(with: #"movie/popular"#) { results in
                switch results {
                case .success(let movie):
                    cell.configure(with: movie)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case sections.TrendingTV.rawValue:
            Networking.shared.fetchData(with: #"trending/tv/day"#) { results in
                switch results {
                case .success(let TV):
                    cell.configure(with: TV)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case sections.UpComingMovies.rawValue:
            Networking.shared.fetchData(with: #"movie/upcoming"#) { results in
                switch results {
                case .success(let movie):
                    cell.configure(with: movie)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case sections.TopRated.rawValue:
            Networking.shared.fetchData(with: #"movie/top_rated"#) { results in
                switch results {
                case .success(let movie):
                    cell.configure(with: movie)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        default:
            cell.configure(with: [])
        }
    }
    
    enum sections: Int {
        case TrendingMovies = 0
        case Popular = 1
        case TrendingTV = 2
        case UpComingMovies = 3
        case TopRated = 4
    }
}
