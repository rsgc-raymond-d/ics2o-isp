//
//  GameScene.swift
//  Daedalus
//
//  Created by Daniel Raymond on 2016-11-24.
//  Copyright © 2016 Daniel Raymond. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let player = SKSpriteNode(imageNamed: "Daedalus Sprite")
    
    var pathX = 0
    var pathY = size.height / 2
    
    
    override func didMove(to view: SKView) {
        // 3
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        // 4
        player.zPosition = 0
        addChild(player)
        player.setScale(0.02)
        
        //Tells the game whether there will be gravity
        physicsWorld.gravity = CGVector.zero
        //Make this class the physics contact delegate
        physicsWorld.contactDelegate = self
        
        let background = SKSpriteNode(imageNamed: "Grey Square")
        
        background.position = CGPoint(x: size.width / 2, y: size.width / 2)
        background.zPosition = -1
        background.size = self.frame.size
        addChild(background)
        
    }
    // The function to create a path
    func path() {
        
        let path = SKSpriteNode(imageNamed: "Grey Square")
        
        path.position = CGPoint(x: pathX, y: pathY)
        path.zPosition = 0
        addChild(path)
        path.setScale(0.02)
    }
    
    // The function to create a barrier
    func addbarrier() {
        
        let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
        
        barrier.position = CGPoint(x: size.width / 2, y: size.width / 2)
        barrier.zPosition = 0
        addChild(barrier)
        barrier.setScale(0.02)
    }
    // The randomizer to create a possible path to the end
    for _ in 1...20 {
    if pathX < size.width * 7 / 8 {

    var randomizer = arc4randomizer(6)
    
    if randomizer = 0 { // Create a path square on top of the previous one
    
    pathY = pathY + 20
    addChild(path)
    
    } else if randomizer = 1 { // Create two path squares on top of the previous one
    
    for doublePathPositiveY in 1..2 {
    pathY = pathY + 20
    addChild(path)
    }
    
    } else if randomizer = 2 {  // Create a path square to the right of the previous one
    
    pathX = pathX + 20
    addChild(path)
    
    } else if randomizer = 3 {  // Create two path squares to the right of the previous one
    
    for doublePathX in 1..2 {
    pathX = pathX + 20
    addChild(path)
    }
    
    } else if randomizer = 4 { // Create a path square below of the previous one
    
    pathY = pathY - 20
    addChild(path)
    
    } else if randomizer = 5 {
    
    for doublePathPositiveY in 1..2 { // Create two path squars below of the previous one
    pathY = pathY - 20
    addChild(path)
    }
    }
    if pathY > size.height / 2 - 10 { // At the last column, if it's above the exit, then go down.
    
    pathY = pathY - 20
    addChild(path)
    
    }
    if pathY < size.height / 2 - 10 { // At the last column, if it's below the exit, then go up.
    
    pathY = pathY + 20
    addChild(path)
    
    }
    } else {
    
    
    
    }
}
