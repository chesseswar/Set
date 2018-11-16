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
        refreshScreen(UITapGestureRecognizer())
    }
    
    @IBOutlet weak var rowStackView: UIStackView!
    
    @IBOutlet var viewImages: [UIView]!
    @IBOutlet var attributeImages: [UIImageView]!
    
   // @IBOutlet var cardImages: [UIImageView]! = []
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func refreshScreen(_ sender: UITapGestureRecognizer) {
        let generator = CardGenerator()
        for _ in 1...4 {
            let row = UIStackView()
            rowStackView.addArrangedSubview(row)
            row.axis = UILayoutConstraintAxis.horizontal
            row.distribution = UIStackViewDistribution.fillEqually
            row.spacing = 2
            row.translatesAutoresizingMaskIntoConstraints = false
            row.widthAnchor.constraint(equalTo: rowStackView.widthAnchor).isActive = true
            row.trailingAnchor.constraint(equalTo: rowStackView.trailingAnchor).isActive = true
            row.leadingAnchor.constraint(equalTo: rowStackView.leadingAnchor).isActive = true
            for _ in 1...3 {
                let view = UIView()
                row.addArrangedSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
                view.heightAnchor.constraint(equalTo: row.heightAnchor).isActive = true
                
                let cardStackView = UIStackView()
                view.addSubview(cardStackView)
                cardStackView.axis = UILayoutConstraintAxis.vertical
                cardStackView.contentMode = UIViewContentMode.scaleAspectFit
                cardStackView.distribution = UIStackViewDistribution.fillEqually
                cardStackView.translatesAutoresizingMaskIntoConstraints = false
                cardStackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                cardStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                cardStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
                cardStackView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
                cardStackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
                
                let backgroundImage = UIImage(named: "blank_card")
                view.layer.contents = backgroundImage?.cgImage
                
                let card = generator.randomCard
                let attributeImage = findCardImage(card: card)
                
                for _ in 0...(card.num.rawValue) {
                    let imageView = UIImageView()
                    imageView.contentMode = UIViewContentMode.center
                    imageView.translatesAutoresizingMaskIntoConstraints = false
                    cardStackView.addArrangedSubview(imageView)
                    imageView.image = attributeImage
                    imageView.widthAnchor.constraint(equalTo: cardStackView.widthAnchor, constant: 0).isActive = true
                }
                
                
            }
        }
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

