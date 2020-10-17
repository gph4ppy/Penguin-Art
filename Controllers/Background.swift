//
//  Background.swift
//  SwiftPenguin
//
//  Created by Jakub "GPH4PPY" Dąbrowski on 17/10/2020.
//

import UIKit

class Background: UIView {

    // MARK: Properties
    let grass: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        return view
    }()
    
    let sun: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        return view
    }()
    
    let cloud: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.alpha = 0.75
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add subviews
        addSubview(grass)
        addSubview(sun)
        addSubview(cloud)
        
        // Blur effect
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        // Not working as I wanted
        blurEffectView.frame = sun.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // But it gives cool effect
        sun.addSubview(blurEffectView)
        grass.addSubview(blurEffectView)
        cloud.addSubview(blurEffectView)
        
        // Setup corner radius
        sun.layer.cornerRadius = frame.width / 2
        cloud.layer.cornerRadius = frame.width / 2
        
        // Activate constraints
        NSLayoutConstraint.activate([
            // Setup grass
            grass.centerXAnchor.constraint(equalTo: centerXAnchor),
            grass.centerYAnchor.constraint(equalTo: centerYAnchor, constant: frame.height / 3),
            grass.widthAnchor.constraint(equalToConstant: frame.width),
            grass.heightAnchor.constraint(equalToConstant: frame.height / 2),
            
            // Setup sun
            sun.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 150),
            sun.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -frame.height / 3 - 250),
            sun.widthAnchor.constraint(equalToConstant: frame.width),
            sun.heightAnchor.constraint(equalToConstant: frame.height / 1.5),
            
            // Setup cloud
            cloud.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -frame.width),
            cloud.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -frame.height / 3 + 10),
            cloud.widthAnchor.constraint(equalToConstant: frame.width),
            cloud.heightAnchor.constraint(equalToConstant: frame.height / 3 - 100)
        ])
        
        // Animate cloud
        UIView.animate(withDuration: 15, delay: 1, options: [.repeat]) {
            self.cloud.transform = CGAffineTransform(translationX: frame.width * 2, y: 1)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
