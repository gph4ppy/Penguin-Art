//
//  PenguinFace.swift
//  SwiftPenguin
//
//  Created by Jakub "GPH4PPY" Dąbrowski on 17/10/2020.
//

import UIKit

class PenguinFace: UIView {

    // MARK: Properties
    let face: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let beak: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        return view
    }()
    
    let leftEye: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    let rightEye: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bodySize: CGFloat = 175
        
        // Add subviews
        addSubview(face)
        addSubview(beak)
        addSubview(leftEye)
        addSubview(rightEye)
        
        // Setup corner radius
        face.layer.cornerRadius = bodySize / 2
        beak.layer.cornerRadius = bodySize / 2
        leftEye.layer.cornerRadius = bodySize / 16
        rightEye.layer.cornerRadius = bodySize / 16

        // Activate constraints
        NSLayoutConstraint.activate([
            // Setup face
            face.centerXAnchor.constraint(equalTo: centerXAnchor),
            face.centerYAnchor.constraint(equalTo: centerYAnchor),
            face.widthAnchor.constraint(equalToConstant: bodySize),
            face.heightAnchor.constraint(equalToConstant: bodySize),
            
            // Setup beak
            beak.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            beak.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 30),
            beak.widthAnchor.constraint(equalToConstant: bodySize / 2),
            beak.heightAnchor.constraint(equalToConstant: bodySize / 3),
            
            // Setup left eye
            leftEye.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -35),
            leftEye.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -25),
            leftEye.widthAnchor.constraint(equalToConstant: bodySize / 8),
            leftEye.heightAnchor.constraint(equalToConstant: bodySize / 6),
            
            // Setup right eye
            rightEye.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 35),
            rightEye.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -25),
            rightEye.widthAnchor.constraint(equalToConstant: bodySize / 8),
            rightEye.heightAnchor.constraint(equalToConstant: bodySize / 6)
        ])
        
        // Animate eyes
        UIView.animate(withDuration: 1.5, delay: 1, usingSpringWithDamping: 5, initialSpringVelocity: 0.5, options: [.repeat, .autoreverse]) {
            self.leftEye.transform = CGAffineTransform(scaleX: 1, y: -1.1)
            self.rightEye.transform = CGAffineTransform(scaleX: 1, y: -1.1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
