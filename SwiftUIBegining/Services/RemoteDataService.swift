//
//  RemoteDataService.swift
//  SwiftUIBegining
//
//  Created by Vitalii Maksymliuk on 29.09.2020.
//  Copyright © 2020 Vitalii Maksymliuk. All rights reserved.
//

import Foundation
import Contentful

class RemoteDataService {
    
    // MARK: - Properties
    
    static let shared = RemoteDataService()
    private let client = Client(spaceId: "45ai08ip1v7d", accessToken: "E2RvHIXysHY7VoHFkjrZ5O2Cd5t9SFnNTq1DPDxvriw")
    
    // MARK: - Inits
    
    private init() { }
    
    // MARK: - Methods
    
    func getCourseData(id: String, completion: @escaping ([Entry]) -> Void) {
        let query = Query.where(contentTypeId: id)
        
        client.fetchArray(of: Entry.self, matching: query) { result in
            print(result)
            
            switch result {
            case .success(let data):
                
                DispatchQueue.main.async {
                    completion(data.items)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
