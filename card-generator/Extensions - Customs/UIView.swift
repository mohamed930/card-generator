//
//  UIVIEW.swift
//  card-generator
//
//  Created by Mohamed Ali on 21/09/2022.
//

import UIKit

extension UIView {
    // MARK: TODO: Convert The Cell Background to image and save it to the Apple File maneger.
    func takeScreenshot(ob: UIViewController, noOfImage: String, noOfFace: String) -> Bool {

        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)

        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)

        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        if (image != nil)
        {
            let response = SaveImage(image: image, ob: ob, numbrOfImage: noOfImage, numberOfFace: noOfFace)
            return response
        }
        return false
    }
    // -------------------------------------------
    
    // MARK: TODO: This Method took the image and save it to the Apple File maneger
    func SaveImage(image: UIImage?, ob: UIViewController, numbrOfImage: String, numberOfFace: String) -> Bool {
        // Set the image name to save it.
        let date = Date()
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .long
        // convert the date to String
        let date_str = formatter1.string(from: date)
        
        // set ImageName from Date and number of employee and number of face and datetype of file
        let imageName = date_str + " " + numbrOfImage + "_" + numberOfFace + ".png"
        
        if let image = image {
            // Set Size to CMS80 card standared size.
            guard let sizedimage = image.imageResize(sizeChange: CGSize(width: 323.52, height: 204)) else { return false }
            // convert UI Image to Png Data.
            if let data = sizedimage.pngData() {
                
                // Make directory in Apple File maneger.
                let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                // Add file Url with image name
                let fileUrl = dir.appendingPathComponent(imageName)
                
                // Save image data to file Url.
                do {
                    try data.write(to: fileUrl)
                    // send success if response sucess
                    return true
                }
                catch {
                    print("F: Error \(error.localizedDescription)")
                    return false
                }
            }
        }
        
        return false
    }
    // -------------------------------------------
}
