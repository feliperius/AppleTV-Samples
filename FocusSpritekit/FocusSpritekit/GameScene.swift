//
//  GameScene.swift
//  FocusSpritekit
//
//  Created by Felipe perius on 13/05/16.
//  Copyright (c) 2016 bepid. All rights reserved.
//

import SpriteKit

protocol InteractiveNode {
    func interact()
}

protocol TVControlsScene {
    func setupTVControls()
}
protocol CustomNodeEvents {
    func didMoveToScene()
}

var node1: NodeTeste!
var node2: NodeTeste2!

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
    
      
        
        
        node1 = NodeTeste(color: SKColor.redColor() ,size:CGSize(width: 50,height: 50))
        node2 = NodeTeste2(color: SKColor.blueColor() ,size:CGSize(width: 50,height: 50))
        
        node1.name = ("teste")
        node2.name = ("teste1")
        
        node1.position =  CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        node2.position =  CGPointMake(self.frame.size.width/2, self.frame.size.height/2-150)
       
        
        self.addChild(node1)
        self.addChild(node2)
        
        enumerateChildNodesWithName("//*", usingBlock: {node, _ in
            if let customNode = node as? CustomNodeEvents {
                customNode.didMoveToScene()
            }
        })
    
        
        let scene = (self as SKScene)
        if let scene = scene as? TVControlsScene {
            scene.setupTVControls()
        }

    
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
          }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
