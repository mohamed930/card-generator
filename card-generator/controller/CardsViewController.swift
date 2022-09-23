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
    let baseurl =  "http://192.168.1.203:3001/" // "http://localhost:3001/" // "http://122.0.0.27:3001/" // "http://192.168.1.52:3001/"
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
        
        AF.request(baseurl + endPoint, method: .get,encoding: JSONEncoding.default).response { [weak self] response in
            
            guard let self = self else { return }
            
            guard let statusCode = response.response?.statusCode else { return }
            
            if statusCode == 200 || statusCode == 201 {
                print("F: \(String(data: response.data!, encoding: .utf8)!)")
                
                guard let theJSONData =  response.data else { return }
                
                guard let responseObj = try? JSONDecoder().decode(cardModel.self, from: theJSONData) else { return }
                
                self.cards = responseObj
                
                self.stopLoading()
                self.tableView.reloadData()
            }
            else {
                print("F: response failed \(String(describing: response.response?.description))")
                self.stopLoading()
            }
            
        }
    }
    // -------------------------------------------
    
    
    // MARK: TODO: This method for action export cards button.
    @IBAction func exportButtonAction (_ sender:Any) {
        
        guard let cardsData = cards?.data else { return }
//        let cell: CardCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! CardCell
        
        for i in 0..<cardsData.count {
            let cell: CardCell = tableView.cellForRow(at: IndexPath(row: i, section: 0)) as! CardCell
            
            for j in 0..<2 {
                if j == 0 {
                    let collectionCell: CardDesgin = cell.collectionView.cellForItem(at: IndexPath(row: 0 , section: 0)) as! CardDesgin
                    let response = collectionCell.containerView.takeScreenshot(ob: self,noOfImage: String(i+1) ,noOfFace: String(j))
                    if response {
                        print("we are success")
                    }
                }
                else if j == 1 {
                    let response = self.view.SaveImage(image: UIImage(named: "back"), ob: self, numbrOfImage: String(i+1), numberOfFace: "2")
                    if response {
                        print("we are success")
                    }
                }
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
        
        guard let cards = cards else {
            return cell
        }

        
        cell.configureCell(model: cards.data[indexPath.row])
        
        return cell
    }
    // -------------------------------------------
    
    // MARK: TODO: Set cell Hight For tabelView.
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 213
    }
    // -------------------------------------------
    
    // ------------------------------------------------------------
    
    
}

