//
//  ViewController.swift
//  Set
//
//  Created by Siddiqui, Arham J on 10/1/18.
//  Copyright © 2018 Siddiqui, Arham J and Eswaran, Pranav V. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let card = Card(num: Num.one, shape: Shape.squiggle, color: Color.blue, fill: Fill.lined)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testImage.image = image
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var testImage: UIImageView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var image: UIImage {
        let bottomImage = UIImage(named: "blank_card")
        let topImage = findCardImage(card: card)
        
        let size = CGSize(width: 300, height: 300)
        UIGraphicsBeginImageContext(size)
        
        let areaSize = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        bottomImage!.draw(in: areaSize)
        topImage.draw(in: areaSize, blendMode: .normal, alpha: 0.8)
        
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
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
    }

}

