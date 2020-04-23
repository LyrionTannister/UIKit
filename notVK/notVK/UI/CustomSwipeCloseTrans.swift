//
//  CustomSwipeCloseTrans.swift
//  notVK
//
//  Created by Roman on 23.04.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit

final class CustomSwipeCloseTransition: UIPercentDrivenInteractiveTransition {
    var viewController: UIViewController? {
        didSet {
            let recognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleScreenEdgeGesture(_:)))
            recognizer.edges = [.left]
            viewController?.view.addGestureRecognizer(recognizer)
        }
    }

    var hasStarted: Bool = false
    var shouldFinish: Bool = false
    
    @objc func handleScreenEdgeGesture(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            self.hasStarted = true
            self.viewController?.navigationController?.popViewController(animated: true)
        case .changed:
            let translation = recognizer.translation(in: recognizer.view)
            let relativeTranslation = translation.x / 33
            let progress = max(0, min(1, relativeTranslation))

            // MARK: Узнаем, что ширина жеста от грани до грани 33
            print("relativeTranslation: \(translation.x)")

            self.shouldFinish = progress > 0.33

            self.update(progress)
        case .ended:
            self.hasStarted = false
            self.shouldFinish ? self.finish() : self.cancel()
        case .cancelled:
            self.hasStarted = false
            self.cancel()
        default:
            return
        }
    }
}