//
//  ViewController.swift
//  Set
//
//  Created by Siddiqui, Arham J on 10/1/18.
//  Copyright © 2018 Siddiqui, Arham J and Eswaran, Pranav V. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let generator = CardGenerator()
        let attributeImage = findCardImage(card: generator.randomCard)
        for image in attributeImages {
            image.image = attributeImage
        }
        
        let img = UIImage(named: "blank_card")
        for view in viewImages {
            view.layer.contents = img?.cgImage
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBOutlet var viewImages: [UIView]!
    @IBOutlet var attributeImages: [UIImageView]!
    
   // @IBOutlet var cardImages: [UIImageView]! = []
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func putImageOnStack(imageView: UIImageView) {
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        shapeStack!.addSubview(imageView)
        shapeStack!.insertArrangedSubview(imageView, at: 0)
    }*/
    
    func findCardImage(card: Card) -> UIImage {
        let shape = card.shape
        let fill = card.fill
        let color = card.color
        
        let shapeString: String
        let fillString: String
        let colorString: String
        
        switch shape {
        case Shape.diamond: shapeString = "diamond"
        case Shape.oval: shapeString = "oval"
        case Shape.squiggle: shapeString = "squiggle"
        }
        
        switch fill {
        case Fill.lined: fillString = "striped"
        case Fill.open: fillString = "open"
        case Fill.solid: fillString = "solid"
        }
    
        switch color {
        case Color.blue: colorString = "blue"
        case Color.red: colorString = "red"
        case Color.green: colorString = "green"
        }
        
        return UIImage(named: "\(shapeString)_\(fillString)_\(colorString)")!
        /*
        let bottomImage = UIImage(named: "blank_card")
        
        let size = CGSize(width: 10000, height: 10000)
        UIGraphicsBeginImageContext(size)
        
        let areaSize = CGRect(x: 0, y: 100, width: size.width, height: size.height+100)
        let topAreaSize = CGRect(x: 100, y: 100, width: size.width, height: size.height)
        
        bottomImage!.draw(in: areaSize)
        topImage.draw(in: topAreaSize, blendMode: .normal, alpha: 1.0)
        
        return UIGraphicsGetImageFromCurrentImageContext()!*/
    }

}

