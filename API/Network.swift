//
//  Network.swift
//  API
//
//  Created by wdp mac on 10/02/22.
//

import Foundation

class Network {
    
    func getBankList(complition:@escaping (Result<Banks,Error>)->Void) {
        
        guard let url = URL(string: "https://random-data-api.com/api/bank/random_bank?size=3") else {return}
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) {
            (data,response,error) in
            
            if let error = error {
                print("error: \(error.localizedDescription)")
                complition(.failure(error))
                return
            }else{
                guard let data = data else {return}
                do{
                    let decode = try JSONDecoder().decode(Banks.self, from: data)
                    print("decode data complition: \(decode)")
                    let banks = decode
                    complition(.success(banks))
                }catch let err {
                    print("err:\(err.localizedDescription)")
                    complition(.failure(err))
                }
            }
        }
        dataTask.resume()
    }
}
