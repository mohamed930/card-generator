//
//  UIImage.swift
//  card-generator
//
//  Created by Mohamed Ali on 22/09/2022.
//

import UIKit

extension UIImage {
    
    // MARK: TODO: This Method For Make Image Size.
    func imageResize (sizeChange:CGSize)-> UIImage?{
        
        let hasAlpha = true
        let scale: CGFloat = 0.0 // Use scale factor of main screen

        // Create a Drawing Environment (which will render to a bitmap image, later)
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)

        self.draw(in: CGRect(origin: .zero, size: sizeChange))

        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()

        // Clean up the Drawing Environment (created above)
        UIGraphicsEndImageContext()

        return scaledImage
    }
    // -------------------------------------------
    
}
