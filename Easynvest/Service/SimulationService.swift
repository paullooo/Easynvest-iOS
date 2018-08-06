//
//  SimulationService.swift
//  Easynvest
//
//  Created by Developer on 04/08/18.
//

import Foundation

protocol SimulationServiceDelegate: class {
    func simulationSuccess()
    func simulationFailure(error: String)
}

class SimulationService {
    weak var delegate: SimulationServiceDelegate?
    required init(delegate: SimulationServiceDelegate) {
        self.delegate = delegate
    }
    func getSimulationResult(params: [String: String]) {
        let urlComp = NSURLComponents(string: "https://api-simulator-calc.easynvest.com.br/calculator/simulate")!
        var items = [URLQueryItem]()
        for (key, value) in params {
            items.append(URLQueryItem(name: key, value: value))
        }
        items = items.filter {
            !$0.name.isEmpty
        }
        if !items.isEmpty {
            urlComp.queryItems = items
        }
        var urlRequest = URLRequest(url: urlComp.url!)
        urlRequest.httpMethod = "GET"
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let simulationData = try decoder.decode(Simulation.self, from: data)
                print(simulationData)
                self.delegate?.simulationSuccess()
            } catch let err {
                print("Err", err)
                self.delegate?.simulationFailure(error: err.localizedDescription)
            }
            print(response!)
        }
        task.resume()
    }
}
