//
//  ViewController.swift
//  API_Example
//
//  Created by Nada Alansari on 09/04/1443 AH.
//

import UIKit


class pepoleRespone : Codable{
    
    var data : [pepole] = []
    
    
    
}
struct pepole : Codable{
    
    var Nation  : String
}
class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        getCharacter()
        
    }
    
    func getCharacter(){
        var urlComponent = URLComponents()
        
        urlComponent.scheme = "https"
        urlComponent.host = "datausa.io"
        urlComponent.path = "/api/data?drilldowns=Nation&measures=Population"
        
//        let urlQueryItem = URLQueryItem(name: "drilldowns", value: "Nation")
//
//        urlComponent.queryItems = [urlQueryItem]
        
        let urlSession = URLSession.shared
        
        let URLRequest = URLRequest(url: urlComponent.url!)
        let task = urlSession.dataTask(with: URLRequest) {(data: Data?,response: URLResponse?, errore :Error?) in
             do{
                 
   //  print(String(data: data!, encoding: .utf8))
            
                let jsonDecoder = JSONDecoder()
                let character = try jsonDecoder.decode(pepoleRespone.self, from: data!)
                 print(character.data.first)
                 
        }
            catch{
                print("\(error)")
            }
            
        }
        task.resume()
        
    }


}


