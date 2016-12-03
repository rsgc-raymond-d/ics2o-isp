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
    
    // The different maze choices
    let mazeOption1: [Bool] = [false, true, false, true, false, false, false,
                               false, true, false, false, false, true, false,
                               false, true, false, true, false, true, false,
                               false, false, false, false, false, true, false,
                               false, true, false, true, false, true, false,
                               false, true, false, false, false, true, false,
                               false, true, false, true, false, true, true]
    
    let mazeOption2: [Bool] = [false, false, false, true, false, false, false,
                               false, true, false, false, false, true, false,
                               false, true, true, true, true, true, false,
                               false, false, false, false, false, true, false,
                               false, true, false, true, false, true, false,
                               false, true, true, false, true, true, false,
                               false, true, false, false, false, false, true]
    
    let mazeOption3: [Bool] = [false, false, false, true, false, false, false,
                               false, true, false, false, false, true, false,
                               false, true, false, true, false, true, false,
                               false, false, false, true, false, false, false,
                               false, true, false, true, false, true, false,
                               false, true, false, true, false, true, false,
                               false, true, false, false, true, false, false]
    
    let mazeOption4: [Bool] = [false, true, false, true, true, false, true,
                               false, false, true, false, false, false, true,
                               false, true, false, false, true, false, false,
                               false, false, true, false, false, true, false,
                               false, true, false, true, false, false, true,
                               false, false, false, true, true, false, true,
                               false, true, false, false, false, false, true]
    
    let mazeOption5: [Bool] = [false, true, false, false, false, false, false,
                               false, false, true, false, true, false, true,
                               false, true, false, false, true, false, false,
                               false, false, true, false, false, true, false,
                               false, true, false, true, false, false, true,
                               false, false, false, true, true, true, false,
                               false, true, false, false, false, false, false]
    
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
        
        // Add the first sprite
        // size.width/9 = 46
        
        print(player.position)
        
        let mazeChoice = arc4random_uniform(1)
        
        for repeatY in 1...7 {
            
            for repeatX in 1...7 {
                
                if mazeChoice == 0 {
                    
                    var combineCoordinate = 0
                    
                    if mazeOption1[combineCoordinate] == false {
                        
                        let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
                        barrier.anchorPoint = CGPoint(x: 0, y: 0)
                        barrier.position = CGPoint(x: (repeatX) * (46), y: ((repeatY) * 46) + 161)
                        barrier.setScale(0.368333333)
                        addChild(barrier)
                        
                        combineCoordinate += 1
                    } else {
                        
                        let path = SKSpriteNode(imageNamed: "Grey Square")
                        path.anchorPoint = CGPoint(x: 0, y: 0)
                        path.zPosition = 2
                        path.position = CGPoint(x: (repeatX) * (46), y: ((repeatY) * 46) + 161)
                        path.setScale(0.153333333)
                        addChild(path)
                        
                        combineCoordinate += 1
                    }
                }
                
            }
        }
        
    }
    
} // Game Scene Class Bracket
