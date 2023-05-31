//
//  UIKitNav.swift
//  Trivia
//
//  Created by Hamzah Azam on 22/05/2023.
//

import SwiftUI
import UIKit

struct UIKitNavView: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let howToPlayViewController = storyboard.instantiateViewController(withIdentifier: "HowToPlayViewController")
        return howToPlayViewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {

    }
}
