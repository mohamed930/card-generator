//
//  ViewController.swift
//  card-generator
//
//  Created by Mohamed Ali on 20/09/2022.
//

import UIKit
import Alamofire

class CardsViewController: UITableViewController {

    let cellNibFile = "CardCell"
    let cellIdentifier = "Cell"
    let baseurl = "localhost:3001/"
    let endPoint = "data"
    
    var cards: cardModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConfigureCell()
        getDataFromServer()
    }
    
    // MARK: TODO: This method for configure cell nib file to tableView.
    func ConfigureCell() {
        tableView.register(UINib(nibName: cellNibFile, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    // -------------------------------------------
    
    // MARK: TODO: This Method For Ask server to get Data.
    func getDataFromServer() {
        self.startLoading()
        
        AF.request(baseurl + endPoint, method: .get).response { [weak self] response in
            
            guard let self = self else { return }
            
            guard let statusCode = response.response?.statusCode else { return }
            
            if statusCode == 200 || statusCode == 201 {
                guard let jsonResponse = try? response.result.get() else { return }
                
                guard let theJSONData =  try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else { return }
                
                guard let responseObj = try? JSONDecoder().decode(cardModel.self, from: theJSONData) else { return }
                
                self.cards = responseObj
                
                self.stopLoading()
            }
            
        }
    }
    // -------------------------------------------
    
    // MARK: TODO: These method for tableView Configure.
    // -------------------------------------------------------
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: TODO: This Method for draw the number of cards i got from server.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cards = cards else {
            return 0
        }

        return cards.count
    }
    // -------------------------------------------
    
    // MARK: TODO: This Method For draw the cell in tableView.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CardCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CardCell
        
        return cell
    }
    // -------------------------------------------
    
    // ------------------------------------------------------------
    
    
}

