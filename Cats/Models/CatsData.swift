//
//  CatsData.swift
//  Cats
//
//  Created by Samir on 6/12/22.
//

import UIKit

struct CatsData {
    var link = "https://api.thecatapi.com/v1/images/search"
    var apiKey = "live_VdvovbsTfiT7j4x7jWbieipSw093zArb8YqmDWkefwWhB3jm2zMS1muvFgp9FByt"
    func getCats() {
        let url = URL(string: "\(link)?limit=20")
        var request = URLRequest(url: url!)
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        
        URLSession.shared.dataTask(with: request) { data, responde, error in
            if let data = data {
                DispatchQueue.main.async {
                    
                    let detailsController = DetailsCatsViewController()
                    let cats = self.parseJSON(data)
                    DispatchQueue.main.async {
                        print("=================>",cats!)

                        detailsController.didUpdateCatsDetails(cats!)
                    }
                }
            } else {
                print(error!)
            }
        }.resume()
        
    }
    
    func parseJSON(_ catsinfo: Data?) -> CatsInfo? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([CatInfo].self, from: catsinfo!)
            let catsModels: CatsInfo = CatsInfo(cats: decodedData)
            return catsModels

        } catch {
            print(error)
            return nil
        }
        
    }
    
}

extension DetailsCatsViewController {
    func didUpdateCatsDetails(_ decodedData: CatsInfo) {
            self.catName.text = decodedData.cats[0]?.url
    }
}
