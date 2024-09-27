//
//  ViewController.swift
//  Hello AR World
//
//  Created by manukant tyagi on 27/09/24.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        sceneView.debugOptions = [
            .showWorldOrigin,
            .showFeaturePoints
        ]
        
        sceneView.autoenablesDefaultLighting = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
        
//        drawSphereAtOrigin()
//        drawBOxAt1200High()
//        drawPyramidAt600Below()
//        drawCatOnPlane()
        drawTorusAt300()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func drawSphereAtOrigin() {
        let sphere = SCNNode(geometry: SCNSphere(radius: 0.05))
        sphere.geometry?.firstMaterial?.diffuse.contents = UIImage.earth
        sphere.geometry?.firstMaterial?.specular.contents = UIColor.yellow
        sphere.position = SCNVector3(0, 0, 0)
        sceneView.scene.rootNode.addChildNode(sphere)
    }

    func drawBOxAt1200High() {
        let box = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
        box.position = SCNVector3(0, 0.2, -0.3)
        box.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        box.geometry?.firstMaterial?.specular.contents = UIColor.green
        sceneView.scene.rootNode.addChildNode(box)
    }
    
    func drawPyramidAt600Below() {
        let pyramid = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
        pyramid.position = SCNVector3(0, -0.2, -0.3)
        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        pyramid.geometry?.firstMaterial?.specular.contents = UIColor.red
        sceneView.scene.rootNode.addChildNode(pyramid)
    }
    
    func drawCatOnPlane() {
        let cat = SCNNode(geometry: SCNPlane(width: 0.1, height: 0.1))
        cat.geometry?.firstMaterial?.diffuse.contents = UIImage.cat
        cat.position = SCNVector3(-0.2, 0, 0)
        sceneView.scene.rootNode.addChildNode(cat)
    }
    
    func drawTorusAt300() {
        let torus = SCNNode(geometry: SCNTorus(ringRadius: 0.05, pipeRadius: 0.03))
        torus.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        torus.geometry?.firstMaterial?.specular.contents = UIColor.white
        torus.position = SCNVector3(0.2, 0, 0)
        torus.eulerAngles = SCNVector3(0, 0, 45.degreesToRadians())
        sceneView.scene.rootNode.addChildNode(torus)
    }
    
    
    
    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}


extension Int {
    func degreesToRadians() -> CGFloat {
        return CGFloat(self) * .pi / 180
    }
}
