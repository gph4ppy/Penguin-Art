//
//  PenguinBody.swift
//  SwiftPenguin
//
//  Created by Jakub "GPH4PPY" Dąbrowski on 17/10/2020.
//

import UIKit

class PenguinBody: UIView {
    
    // MARK: Properties
    let body: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    let leftArm: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    let rightArm: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    let leftLeg: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        view.layer.zPosition = -1
        return view
    }()
    
    let rightLeg: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        view.layer.zPosition = -1
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bodySize: CGFloat = 200
        
        // Add subviews
        addSubview(body)
        addSubview(leftArm)
        addSubview(rightArm)
        addSubview(leftLeg)
        addSubview(rightLeg)
        
        // Setup corner radius
        body.layer.cornerRadius = bodySize / 2
        leftArm.layer.cornerRadius = bodySize / 5
        rightArm.layer.cornerRadius = bodySize / 5
        leftLeg.layer.cornerRadius = bodySize / 10
        rightLeg.layer.cornerRadius = bodySize / 10
        
        // Activate constraints
        NSLayoutConstraint.activate([
            // Setup Body
            body.centerXAnchor.constraint(equalTo: centerXAnchor),
            body.centerYAnchor.constraint(equalTo: centerYAnchor),
            body.widthAnchor.constraint(equalToConstant: bodySize),
            body.heightAnchor.constraint(equalToConstant: bodySize),
            
            // Setup left arm
            leftArm.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -90),
            leftArm.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            leftArm.widthAnchor.constraint(equalToConstant: bodySize / 1.5),
            leftArm.heightAnchor.constraint(equalToConstant: bodySize / 3.5),
            
            // Setup right arm
            rightArm.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 90),
            rightArm.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            rightArm.widthAnchor.constraint(equalToConstant: bodySize / 1.5),
            rightArm.heightAnchor.constraint(equalToConstant: bodySize / 3.5),

            // Setup left leg
            leftLeg.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -40),
            leftLeg.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 95),
            leftLeg.widthAnchor.constraint(equalToConstant: bodySize / 3.33),
            leftLeg.heightAnchor.constraint(equalToConstant: bodySize / 6.33),
            
            // Setup right leg
            rightLeg.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 40),
            rightLeg.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 95),
            rightLeg.widthAnchor.constraint(equalToConstant: bodySize / 3.33),
            rightLeg.heightAnchor.constraint(equalToConstant: bodySize / 6.33)
        ])
        
        // Rotate arms
        UIView.animateKeyframes(withDuration: 0, delay: 0, options: []) {
            self.leftArm.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 4)
            self.rightArm.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        }
        
        // Rotate legs
        UIView.animateKeyframes(withDuration: 0, delay: 0, options: []) {
            self.leftLeg.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 30)
            self.rightLeg.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 30)
        }
        
        // Animate left arm
        UIView.animate(withDuration: 0.75, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.leftArm.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 6)
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
