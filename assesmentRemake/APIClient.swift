////
////  APIClient.swift
////  assesmentRemake
////
////  Created by Kary Martinez on 9/22/19.
////  Copyright © 2019 Kary Martinez. All rights reserved.
////
//import Foundation
//
//struct ElementAPIClient {
//    static let manager = ElementAPIClient()
//
//    func getElements(completionHandler: @escaping (Result<[Element], AppError>) -> ()) {
//        NetworkHelper.manager.performDataTask(withUrl: elementUrl, andMethod: .get) { (result) in
//            switch result {
//            case .failure(let error) :
//                completionHandler(.failure(error))
//            case .success(let data):
//                do {
//                    let ElementInfo = try JSONDecoder().decode([Element].self, from: data)
//                    completionHandler(.success(ElementInfo))
//                } catch {
//                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
//
//
//                }
//            }
//        }
//    }
//
//    private var elementUrl: URL {
//        guard let url = URL(string: "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements") else {
//            fatalError("Invalid URL")
//        }
//        return url
//    }
//
//    private init() {}
//}
//
//
//
