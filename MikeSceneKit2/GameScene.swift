//
//  GameScene.swift
//  MikeSceneKit2
//
//  Created by Michael March on 3/16/16.
//  Copyright © 2016 Michael March. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameScene:SCNScene {
    
    let defaultMaterial = SCNMaterial()
    let treeRow = SCNNode()
    
    convenience init(create:Bool) {
        self.init()
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.camera!.usesOrthographicProjection = false
        cameraNode.position = SCNVector3(0, 10, 90)
        cameraNode.camera!.zFar = 1000
        
        let ambientLight = SCNLight()
        ambientLight.color = UIColor.darkGray
        ambientLight.type = SCNLight.LightType.ambient
        cameraNode.light = ambientLight
        
        rootNode.addChildNode(cameraNode)
        
        var ground = SCNNode()
        let groundGeometry = SCNFloor()
        groundGeometry.reflectivity = 0
        let groundMaterial = SCNMaterial()
        groundMaterial.diffuse.contents = UIColor.green
        groundGeometry.materials = [groundMaterial]
        ground = SCNNode(geometry: groundGeometry)
        
        rootNode.addChildNode(ground)
        
        let bigLine = SCNBox(width: 0.5, height: 50.0, length: 0.5, chamferRadius: 0.1)
        
        let node1 = SCNNode(geometry: bigLine)
        
        node1.position = SCNVector3(0, 0, 0)
        
        rootNode.addChildNode(node1)
        
        // A bezier path
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 20))
        //bezierPath.addLineToPoint(CGPointMake(20, 20))
        //bezierPath.addCurveToPoint(CGPoint(x: 20,y: 20), controlPoint1: CGPoint(x: 15,y: 35), controlPoint2: CGPoint(x: 15,y: 45))
        bezierPath.addQuadCurve(to: CGPoint(x: 20, y: 20), controlPoint: CGPoint(x: 10,y: 50))
        //bezierPath.addArcWithCenter(CGPoint(x: 10,y: 30), radius: 10.0, startAngle: 47.0, endAngle: 47.0, clockwise: true)
        bezierPath.addLine(to: CGPoint(x: 40, y: 20))
        bezierPath.addQuadCurve(to: CGPoint(x: 50, y: 10), controlPoint: CGPoint(x: 50, y: 20))
        bezierPath.addLine(to: CGPoint(x: 50, y: -20))
        bezierPath.addLine(to: CGPoint(x: 40, y: -20))
        bezierPath.addLine(to: CGPoint(x: 40, y: 10))
        bezierPath.addLine(to: CGPoint(x: 20, y: 10))
        bezierPath.addLine(to: CGPoint(x: 20, y: -20))
        bezierPath.addLine(to: CGPoint(x: -20, y: -20))
        bezierPath.addLine(to: CGPoint(x: -20, y: 0))
        bezierPath.addLine(to: CGPoint(x: 0, y: 0))
        bezierPath.close()
        
        // Add shape
        let shape = SCNShape(path: bezierPath, extrusionDepth: 0.75)
        //shape.materials = [cyanMaterial, anOrangeMaterial, aPurpleMaterial]
        //shape.firstMaterial = material
        let shapeNode = SCNNode(geometry: shape)
        //shapeNode.position = SCNVector3(18.0, 0.01, -70.0)
        shapeNode.position = SCNVector3(0.0, 0.01, 0.0)
        //self.rootNode.addChildNode(shapeNode)
        shapeNode.rotation = SCNVector4(x: -1.0, y: 0.0, z: 0.0, w: Float(M_PI / 2))
        
        rootNode.addChildNode(shapeNode)

        let wall1 = SCNBox(width: 0.5, height: 15.0, length: 55.0, chamferRadius: 0.9)
        let wallNode = SCNNode(geometry: wall1)
        wallNode.position = SCNVector3(0, 7.5, 20.0)
        wallNode.rotation = SCNVector4(x: 0.0, y: -1.0, z: 0.0, w: Float(M_PI / 2))
        rootNode.addChildNode(wallNode)
        
        buildWallX()
        buildWallY()
    }
    
    func buildWallX() {
        let height = 12
        let width = 50
        let origX = 10
        let origY = 0
        let origZ = 5
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.blue
        material.specular.contents = UIColor.black
        // Build a wall by 1.0 blocks
        // x is width and y is height
        // walls will be 1.0 unit thik
        for i in 0 ..< width {
            for j in 0 ..< height {
                let newX = origX + i
                let newY = origY + j
                let box1 = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.01)
                box1.firstMaterial = material
                let node1 = SCNNode(geometry: box1)
                node1.position = SCNVector3(Float(newX), Float(newY), Float(origZ))
                
                rootNode.addChildNode(node1)
            }
        }
    }
    
    func buildWallY() {
        let height = 12
        let width = 50
        let origX = 10
        let origY = 0
        let origZ = 5
        // Build a wall by 1.0 blocks
        // x is width and y is height
        // walls will be 1.0 unit thik
        for i in 0 ..< width {
            for j in 0 ..< height {
                let newZ = origZ + i
                let newY = origY + j
                let box1 = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.01)
            
                let node1 = SCNNode(geometry: box1)
                node1.position = SCNVector3(Float(origX), Float(newY), Float(newZ))
                
                rootNode.addChildNode(node1)
            }
        }
    }
}
