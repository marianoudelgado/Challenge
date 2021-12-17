

import Foundation
import Alamofire

typealias MoviesHandler = (_ arrayMoviesDTO: [MovieDTO]) -> Void

struct MovieWS {
    
    func getAllMovies(completionHandler: @escaping MoviesHandler) {
     
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=176de15e8c8523a92ff640f432966c9c"
        let request = AF.request(urlString, method: .get)
        
        request.response { dataResponse in
            
            guard let data = dataResponse.data else { return }
            
            let jsonDecoder = JSONDecoder()
            let pageMovies = try? jsonDecoder.decode(PageMovieDTO.self, from: data)
            
            completionHandler(pageMovies?.results ?? [])
        }
    }
    
    func getAllFavoritesMovies(completionHandler: @escaping MoviesHandler) {
     
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=176de15e8c8523a92ff640f432966c9c"
        let request = AF.request(urlString, method: .get)
        
        request.response { dataResponse in
            
            let showData = Bool.random()
            
            if showData {
                
                guard let data = dataResponse.data else { return }
                
                let jsonDecoder = JSONDecoder()
                let pageMovies = try? jsonDecoder.decode(PageMovieDTO.self, from: data)
                
                completionHandler(pageMovies?.results ?? [])
                
            } else {
                completionHandler([])
            }
        }
    }
}
