//
//  ViewController.swift
//  Height Test
//
//  Created by Khoa Tran on 2/5/20.
//  Copyright © 2020 Khoa Tran. All rights reserved.
//

import UIKit
import RealityKit
import ARKit

class ViewController: UIViewController, ARSessionDelegate {
    
    @IBOutlet var arView: ARView!
    var character: BodyTrackedEntity?
    let characterAnchor = AnchorEntity()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arView.debugOptions = [ARView.DebugOptions.showAnchorGeometry, ARView.DebugOptions.showAnchorOrigins, ARView.DebugOptions.showFeaturePoints, ARView.DebugOptions.showStatistics, ARView.DebugOptions.showWorldOrigin]
        
//        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
//
//        // Add the box anchor to the scene
//        arView.scene.anchors.append(boxAnchor)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        arView.session.delegate = self
        
        let configuration = ARBodyTrackingConfiguration()
        configuration.automaticSkeletonScaleEstimationEnabled = true
        arView.session.run(configuration)
        
        arView.scene.addAnchor(characterAnchor)
        
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        for anchor in anchors {
            guard let bodyAnchor = anchor as? ARBodyAnchor else { continue }
            print(NSDate())
            print(bodyAnchor.estimatedScaleFactor)
        }
}
}
