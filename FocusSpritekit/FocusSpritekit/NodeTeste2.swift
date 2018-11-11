//
//  NodeTeste2.swift
//  FocusSpritekit
//
//  Created by Felipe perius on 13/05/16.
//  Copyright © 2016 bepid. All rights reserved.
//

import SpriteKit

class NodeTeste2: SKSpriteNode,InteractiveNode,CustomNodeEvents{
    func didMoveToScene() {
        userInteractionEnabled = true
        
    }
    
    func interact() {
        userInteractionEnabled = false
        
       self.color = SKColor.blackColor()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
       interact()
    }

}
