//
//  CardCell.swift
//  card-generator
//
//  Created by Mohamed Ali on 20/09/2022.
//

import UIKit

class CardCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cardsData: dataModel?
    let nibFileName = "CardDesgin"
    let nibFileName2 = "CardDesginBack"
    let CellIdentifier = "Cell"
    let CellIdentifier1 = "Cell2"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureCollectionViewCell()
    }
    
    func configureCell(model: dataModel) {
        cardsData = model
        collectionView.reloadData()
    }
    
    // MARK: TODO: This method for regester cell nib file to collectionView,
    func configureCollectionViewCell() {
        collectionView.register(UINib(nibName: nibFileName, bundle: nil), forCellWithReuseIdentifier: CellIdentifier)
        collectionView.register(UINib(nibName: nibFileName2, bundle: nil), forCellWithReuseIdentifier: CellIdentifier1)
    }
    // -------------------------------------------
}

// MARK: TODO: This Section For Set CollectionView Cell Configure
extension CardCell: UICollectionViewDataSource {
    
    // MARK: TODO: number of cell at row
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    // MARK: TODO: Configure cell.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell: CardDesgin = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath) as! CardDesgin
            
            if let cardsData = cardsData {
                cell.configureCell(data: cardsData)
            }
            
            return cell
        }
        else {
            let cell: CardDesgin = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier1, for: indexPath) as! CardDesgin
            
            return cell
        }
    }
}

// MARK: TODO: Make Configure between two cells with line between them and size cell.
extension CardCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width , height: collectionView.frame.size.height)
    }
}
