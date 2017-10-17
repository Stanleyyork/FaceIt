//
//  EmotionsViewController.swift
//  FaceIt
//
//  Created by Stanley Stevens on 10/16/17.
//  Copyright © 2017 Stanley Stevens. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController = segue.destination
        if let navigationController = destinationViewController as? UINavigationController {
            destinationViewController = navigationController.visibleViewController ?? destinationViewController
        }
        if let FaceViewController = destinationViewController as? FaceViewController,
            let identifier = segue.identifier,
            let expression = emotionalFaces[identifier] {
                FaceViewController.expression = expression
                FaceViewController.navigationItem.title = (sender as? UIButton)?.currentTitle
            }
    }
    
    private let emotionalFaces: Dictionary<String,FacialExpression> = [
        "sad" : FacialExpression(eyes: .closed, mouth: .frown),
        "happy" : FacialExpression(eyes: .open, mouth: .smile),
        "worried" : FacialExpression(eyes: .open, mouth: .smirk)
    ]

}
