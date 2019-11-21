//
//  PlanetController.swift
//  SWAPI
//
//  Created by tyson ericksen on 11/21/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import Foundation

class PlanetController {
    
//    https://swapi.co/api/planets/?format=json
    
    
    static func fetchPlanet(completion: @escaping (Result<[Planets], PlanetError>) -> Void) {
        guard let baseURL = URL(string: "https://swapi.co/api") else { completion(.failure(.invalidURL)); return }
        let planetURL = baseURL.appendingPathComponent("planets")
        var components = URLComponents(url: planetURL, resolvingAgainstBaseURL: true)
        let jsonQuery = URLQueryItem(name: "formate", value: "json")
        components?.queryItems = [jsonQuery]
        guard let finalURL = components?.url else { completion(.failure(.invalidURL)); return }
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print(error, error.localizedDescription)
                completion(.failure(.serverError))
            }
            
            guard let data = data else { completion(.failure(.noData)); return }
            do {
                let topLevel = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                
                
                    let planets = topLevel.results
                
                
                completion(.success(planets))
                } catch {
                print(error, error.localizedDescription)
                completion(.failure(.cannotDecode))
            }
        }.resume()
    }
    
    enum PlanetError: LocalizedError {
        case invalidURL
        case serverError
        case noData
        case cannotDecode
    }
}
