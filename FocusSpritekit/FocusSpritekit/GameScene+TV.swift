//
//  GameScene+TV.swift
//  FocusSpritekit
//
//  Created by Felipe perius on 13/05/16.
//  Copyright (c) 2016 bepid. All rights reserved.
//

import SpriteKit

private var activeNodes = [SKNode]()
private var currentNodeIndex = 0

private let fadeOut = SKAction.fadeAlphaTo(0.1, duration: 0.5)
private let fadeIn = SKAction.fadeAlphaTo(1.0, duration: 0.5)

extension GameScene: TVControlsScene {
  
  func setupTVControls() {
    setupSelectableNodes()
    
    let swipeLeft = UISwipeGestureRecognizer(target: self,
      action: #selector(GameScene.didSwipeOnRemote(_:)))
    swipeLeft.direction = .Down
    view!.addGestureRecognizer(swipeLeft)
    
    let swipeRight = UISwipeGestureRecognizer(target: self,
      action: #selector(GameScene.didSwipeOnRemote(_:)))
    swipeRight.direction = .Up
    view!.addGestureRecognizer(swipeRight)

    selectNodeAtIndex(0)
    
    let tap = UITapGestureRecognizer(target: self,
      action: #selector(GameScene.didTapOnRemote(_:)))
    view!.addGestureRecognizer(tap)
  }
  
  func setupSelectableNodes() {
    activeNodes = []
    
    enumerateChildNodesWithName("//*", usingBlock: {node, _ in
      //check the node
      if node is InteractiveNode && node.userInteractionEnabled {
        activeNodes.append(node)
      }

    })

    print(activeNodes)
  }
  
  func didSwipeOnRemote(swipe: UISwipeGestureRecognizer) {
    guard activeNodes.count > 0 else {
      return
    }
    
    var newIndexToSelect = currentNodeIndex
    
    if (swipe.direction == .Right) {
       newIndexToSelect++
    } else {
      newIndexToSelect--
    }

    if newIndexToSelect < 0 {
      newIndexToSelect = activeNodes.count-1
    } else if newIndexToSelect > activeNodes.count-1 {
      newIndexToSelect = 0
    }

    selectNodeAtIndex(newIndexToSelect)
  }

  func selectNodeAtIndex(index: Int) {
    guard activeNodes.count > 0 else {
      return
    }
    
    activeNodes[index].runAction(
      SKAction.repeatActionForever(
        SKAction.sequence([fadeOut, fadeIn])
      )
    )

    if currentNodeIndex < activeNodes.count && index != currentNodeIndex,
      let node = activeNodes[currentNodeIndex] as? SKSpriteNode {
        node.removeAllActions()
        node.alpha = 1.0
    }
    
    currentNodeIndex = index
  }
  
  func didTapOnRemote(tap: UITapGestureRecognizer) {
    guard activeNodes.count>0 else {
      return
    }
    
    if let node = activeNodes[currentNodeIndex] as? InteractiveNode {
      node.interact()
    }
    setupSelectableNodes()

  }

}