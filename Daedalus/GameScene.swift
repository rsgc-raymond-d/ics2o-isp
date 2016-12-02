//
//  GameScene.swift
//  Daedalus
//
//  Created by Daniel Raymond on 2016-11-24.
//  Copyright © 2016 Daniel Raymond. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var pathX = 0
    var pathY = 0
    let path = SKSpriteNode(imageNamed: "Grey Square")
    let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
    let player = SKSpriteNode(imageNamed: "Daedalus Sprite")
    
    let mazeOption1: [Bool] = [false, true, false, true, false, false, false, false, true, false, false, false, true, false, false, true, false, true, false, true, false, false, false, false, false, false, true, false, false, true, false, true, false, true, false, false, true, false, false, false, true, false, false, true, false, true, false, true, true]
    
    let mazeOption2: [Bool] = [false, false, false, true, false, false, false, false, true, false, false, false, true, false, false, true, true, true, true, true, false, false, false, false, false, false, true, false, false, true, false, true, false, true, false, false, true, true, false, true, true, false, false, true, false, false, false, false, true]
    
    let mazeOption3: [Bool] = [false, false, false, true, false, false, false, false, true, false, false, false, true, false, false, true, false, true, false, true, false, false, false, false, true, false, false, false, false, true, false, true, false, true, false, false, true, false, true, false, true, false, false, true, false, false, true, false, false]
    
    let mazeOption4: [Bool] = [false, true, false, true, true, false, true, false, false, true, false, false, false, true, false, true, false, false, true, false, false, false, false, true, false, false, true, false, false, true, false, true, false, false, true, false, false, false, true, true, false, true, false, true, false, false, false, false, true]
    
    let mazeOption5: [Bool] = [false, true, false, false, false, false, false, false, false, true, false, true, false, true, false, true, false, false, true, false, false, false, false, true, false, false, true, false, false, true, false, true, false, false, true, false, false, false, true, true, true, false, false, true, false, false, false, false, false]
    
    override func didMove(to view: SKView) {
        // 3
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        // 4
        player.zPosition = 0
        addChild(player)
        player.setScale(0.05)
        
        //Tells the game whether there will be gravity
        physicsWorld.gravity = CGVector.zero
        //Make this class the physics contact delegate
        physicsWorld.contactDelegate = self
        
        //        let background = SKSpriteNode(imageNamed: "Grey Square")
        //
        //        background.position = CGPoint(x: 0, y: size.width / 2 - (size.width / 9))
        //        background.zPosition = -1
        //        background.setScale(5.12)
        //        addChild(background)
        
        // Add the first sprite
        
        for CGFloat(repeatX) in mazeOption1 {
        
        let tile00 = SKSpriteNode(imageNamed: "Daedalus Barrier")
        tile00.anchorPoint = CGPoint(x: repeatX * (size.width/9), y: 0)
        tile00.position = CGPoint(x: 0, y: 0)
        tile00.setScale(0.36833)
        addChild(tile00)
            
        }
        
        let tile02 = SKSpriteNode(imageNamed: "Grey Square")
        tile02.anchorPoint = CGPoint(x: 0, y: 0)
        tile02.position = CGPoint(x: 0, y: (size.width / 9) * 2)
        tile02.setScale(0.15333)
        addChild(tile02)
    }
    // The function to create a path
    func addpath() {
        
        path.position = CGPoint(x: pathX, y: pathY)
        path.zPosition = 0
        addChild(path)
        path.setScale(0.5688888888)
    }
    
    // The function to create a barrier
    func addbarrier() {
        
        barrier.position = CGPoint(x: size.width / 2, y: size.width / 2)
        barrier.zPosition = 0
        addChild(barrier)
        barrier.setScale(1.36533333333)
    }
    
    
    
} // Game Scene Class Bracket
