//
//  Networking.swift
//  UOBAssignment
//
//  Created by Mytraie Chintapatla on 19/10/21.
//  Copyright © 2021 Mytraie Chintapatla. All rights reserved.
//

import Foundation

enum UserError:Error {
    case NoDataAvailable
    case CanNotProcessData
}
struct Networking {
    
    static let sharedInstance = Networking()
    let session = URLSession.shared
    
    let userURL = "https://reqres.in/api/users"
    
    func getUsers(completion: @escaping(Result<[Data],UserError>)->Void) {
        let UserURL=URL(string: userURL)!
        let dataTask=session.dataTask(with: UserURL){data,_,_ in
            guard let jsonData = data else{
                completion(.failure(.NoDataAvailable))
                return
            }
            do{
                let decoder = JSONDecoder()
                let userResponse = try decoder.decode(UsersResponse.self,from:jsonData)
                completion(.success(userResponse.data))
            }
            catch{
                completion(.failure(.CanNotProcessData))
            }
        }
        dataTask.resume()
    }
    
    
}


