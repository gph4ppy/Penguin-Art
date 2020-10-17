//
//  PenguinViewController.swift
//  SwiftPenguin
//
//  Created by Jakub "GPH4PPY" Dąbrowski on 17/10/2020.
//

import UIKit

class PenguinViewController: UIViewController {
    var penguinBody: PenguinBody!
    var penguinFace: PenguinFace!
    var background: Background!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        background = Background(frame: frame)
        penguinBody = PenguinBody(frame: frame)
        penguinFace = PenguinFace(frame: frame)
        
        self.view.addSubview(background)
        self.view.addSubview(penguinBody)
        self.view.addSubview(penguinFace)
    }
}
