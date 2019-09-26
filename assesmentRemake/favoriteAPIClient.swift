//
//  favoriteAPIClient.swift
//  assesmentRemake
//
//  Created by Kary Martinez on 9/23/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import Foundation

struct FavoritesAPIClient {
    
    
    static let manager = FavoritesAPIClient()
    
 
    
    private var favoriteURL: URL {
        guard let url = URL(string: "http5d83bc5ebaffda001476aa88.mockapi.io/api/v1/favorites") else {
            fatalError("Error: Invalid URL")
        }
        return url
    }
    
    private init() {}
    
    
    func postfavElement(element: Favorite, completionHandler: @escaping (Result<Data, AppError>) -> Void) {
        
        guard let encodedData = try? JSONEncoder().encode(element) else {
            fatalError("encoder failed")
        }
        let urlStr = "https://5d83bc5ebaffda001476aa88.mockapi.io/api/v1/favorites"
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andHTTPBody: encodedData, andMethod: .post) { (result) in
            switch result {
            case .success(let data):
                completionHandler(.success(data))
            case .failure(let error) :
                completionHandler(.failure(error))
            }
        }
        
    }

}


