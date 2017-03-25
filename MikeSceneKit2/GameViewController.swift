//
//  GameViewController.swift
//  MikeSceneKit2
//
//  Created by Michael March on 3/12/16.
//  Copyright (c) 2016 Michael March. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    var sceneView: SCNView?
    var scene = GameScene(create: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView = self.view as? SCNView
        
        if let view = sceneView {
            view.scene=scene   // This line ties this view to the GameScene class
            view.allowsCameraControl = true
            view.autoenablesDefaultLighting = true
            view.showsStatistics = true
            view.backgroundColor = UIColor.blue
        }        
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
