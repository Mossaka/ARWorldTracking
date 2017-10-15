//
//  ViewController.swift
//  AR World Tracking
//
//  Created by Jiaxiao Zhou on 10/14/17.
//  Copyright © 2017 mossaka. All rights reserved.
//

import UIKit
import ARKit
class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        self.sceneView.automaticallyUpdatesLighting = true
        self.sceneView.autoenablesDefaultLighting = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func add(_ sender: Any) {
        let node = SCNNode()
        // chamferRadius - corner. 0.1/2 makes a sphere.
        
        /* firstMaterial is the appearance of the node
         specular is the light reflected on the node (need autoenablesDefaultLighting for it to work */
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0.2))
        path.addLine(to: CGPoint(x: 0.2, y: 0.3))
        path.addLine(to: CGPoint(x: 0.4, y: 0.2))
        let shape = SCNShape(path: path, extrusionDepth: 0.2)
        node.geometry = shape
//        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
//        node.geometry = SCNPlane(width: 0.1, height: 0.1)
//        node.geometry = SCNTorus(ringRadius: 0.02, pipeRadius: 0.05)
//        node.geometry = SCNTube(innerRadius: 0.02, outerRadius: 0.05, height: 0.1)
//        node.geometry = SCNSphere(radius: 0.1)
//        node.geometry = SCNCone(topRadius: 0.1, bottomRadius: 0.3, height: 0.3)
//        node.geometry = SCNCapsule(capRadius: 0.1, height: 0.3)
//        node.geometry = SCNBox(width: CGFloat(length, 0.05: length, length: 0.05, chamferRadius: 0.05/2)
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.cyan
        let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        node.position = SCNVector3(x,y,z) // the node is 0 meter from x, y and z axis.
        sceneView.scene.rootNode.addChildNode(node)
    }
    
    /*
     * Return a random number in the given range
     **/
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
}

