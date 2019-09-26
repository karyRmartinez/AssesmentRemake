//
//  APIManager.swift
//  assesmentRemake
//
//  Created by Kary Martinez on 9/22/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import Foundation

class ElementsAPIManager {
    private init() {}
    
    static let shared = ElementsAPIManager()
    
//    static func getElementImageURLString(from number: Int) -> String {
//
//        return "http://www.theodoregray.com/periodictable/Tiles/\(number)/s7.JPG"
//
//    }
    
    func getElements(completionHandler: @escaping (Result<[Element], AppError>) -> Void) {
        let urlStr = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
        
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error) :
                completionHandler(.failure(error))
            case .success(let data):
                do {
                let ElementInfo = try JSONDecoder().decode([Element].self, from: data) //let has a constant
                    completionHandler(.success(ElementInfo))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}

 
