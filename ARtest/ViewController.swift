//
//  ViewController.swift
//  ARtest
//
//  Created by Sophie Kim on 2020/08/25.
//  Copyright © 2020 Sophie Kim. All rights reserved.
//

import UIKit
import ARKit
import SceneKit



class ViewController: UIViewController, ARSCNViewDelegate{

    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
    let config = ARWorldTrackingConfiguration()
    config.planeDetection = .horizontal
    sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints,ARSCNDebugOptions.showWorldOrigin]
    sceneView.delegate = self
    sceneView.session.run(config)
    addBox()
    }
    
    func addBox(){
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.blue
        box.materials = [material]
        let boxNode = SCNNode()
        boxNode.geometry = box
        boxNode.position = SCNVector3(0, 0, -0.2)
        let scene = SCNScene()
        scene.rootNode.addChildNode(boxNode)
        sceneView.scene = scene
    }
}

