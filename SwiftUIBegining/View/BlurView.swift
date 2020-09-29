//
//  BlurView.swift
//  SwiftUIBegining
//
//  Created by Vitalii Maksymliuk on 17.02.2020.
//  Copyright © 2020 Vitalii Maksymliuk. All rights reserved.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    
    typealias UIViewType = UIView
    
    // MARK: - Properties

    var style: UIBlurEffect.Style
    
    // MARK: - Methods

    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: style)
        let bluredView = UIVisualEffectView(effect: blurEffect)
        
        bluredView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(bluredView, at: 0)
        
        NSLayoutConstraint.activate([
            bluredView.widthAnchor.constraint(equalTo: view.widthAnchor),
            bluredView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BlurView>) {
        
    }
}
