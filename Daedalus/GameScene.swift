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
                               false, false, false, false, true, true, false,
                               false, true, false, true, false, true, true,
                               false, true, false, false, false, true, false,
                               false, false, false, true, false, false, true]
    
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
                               false, false, false, true, false, true, false,
                               false, true, false, false, false, false, false]
    
    override func didMove(to view: SKView) {
        // 3
        player.position = CGPoint(x: size.width / 9, y: size.height * 0.5)
        // 4
        player.zPosition = 2
        addChild(player)
        player.setScale(0.05)
        
        //Tells the game whether there will be gravity
        physicsWorld.gravity = CGVector.zero
        //Make this class the physics contact delegate
        physicsWorld.contactDelegate = self
        
        // The Barrier Block
        
        
        // The Pathway Block
        
        
        // Inner maze constructing
        
        func createMaze() {
            
            let mazeChoice = arc4random_uniform(5)
            var combineCoordinate = -1
            
            for repeatY in 1...7 {
                
                for repeatX in 1...7 {
                    
                    combineCoordinate += 1
                    
                    if mazeChoice == 0 {
                        
                        if mazeOption1[combineCoordinate] == true {
                            let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
                            barrier.anchorPoint = CGPoint(x: 0, y: 0)
                            barrier.setScale(0.368333333)
                            barrier.position = CGPoint(x: (repeatX) * (46), y: (-(repeatY) * 46) + 529)
                            barrier.setScale(0.368333333)
                            addChild(barrier)
                        } else {
                            let path = SKSpriteNode(imageNamed: "Grey Square")
                            path.anchorPoint = CGPoint(x: 0, y: 0)
                            path.setScale(0.153333333)
                            path.position = CGPoint(x: (repeatX) * (46), y: (-(repeatY) * 46) + 529)
                            addChild(path)
                        }
                    }
                    
                    if mazeChoice == 1 {
                        
                        if mazeOption2[combineCoordinate] == true {
                            let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
                            barrier.anchorPoint = CGPoint(x: 0, y: 0)
                            barrier.setScale(0.368333333)
                            barrier.position = CGPoint(x: (repeatX) * (46), y: (-(repeatY) * 46) + 529)
                            barrier.setScale(0.368333333)
                            addChild(barrier)
                        } else {
                            let path = SKSpriteNode(imageNamed: "Grey Square")
                            path.anchorPoint = CGPoint(x: 0, y: 0)
                            path.setScale(0.153333333)
                            path.position = CGPoint(x: (repeatX) * (46), y: (-(repeatY) * 46) + 529)
                            addChild(path)
                        }
                    }
                    
                    if mazeChoice == 2 {
                        
                        if mazeOption3[combineCoordinate] == true {
                            let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
                            barrier.anchorPoint = CGPoint(x: 0, y: 0)
                            barrier.setScale(0.368333333)
                            barrier.position = CGPoint(x: (repeatX) * (46), y: (-(repeatY) * 46) + 529)
                            barrier.setScale(0.368333333)
                            addChild(barrier)
                        } else {
                            let path = SKSpriteNode(imageNamed: "Grey Square")
                            path.anchorPoint = CGPoint(x: 0, y: 0)
                            path.setScale(0.153333333)
                            path.position = CGPoint(x: (repeatX) * (46), y: (-(repeatY) * 46) + 529)
                            addChild(path)
                        }
                    }
                    
                    if mazeChoice == 3 {
                        
                        if mazeOption4[combineCoordinate] == true {
                            let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
                            barrier.anchorPoint = CGPoint(x: 0, y: 0)
                            barrier.setScale(0.368333333)
                            barrier.position = CGPoint(x: (repeatX) * (46), y: (-(repeatY) * 46) + 529)
                            barrier.setScale(0.368333333)
                            addChild(barrier)
                        } else {
                            let path = SKSpriteNode(imageNamed: "Grey Square")
                            path.anchorPoint = CGPoint(x: 0, y: 0)
                            path.setScale(0.153333333)
                            path.position = CGPoint(x: (repeatX) * (46), y: (-(repeatY) * 46) + 529)
                            addChild(path)
                        }
                    }
                    
                    if mazeChoice == 4 {
                        
                        if mazeOption5[combineCoordinate] == true {
                            let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
                            barrier.anchorPoint = CGPoint(x: 0, y: 0)
                            barrier.setScale(0.368333333)
                            barrier.position = CGPoint(x: (repeatX) * (46), y: (-(repeatY) * 46) + 529)
                            barrier.setScale(0.368333333)
                            addChild(barrier)
                        } else {
                            let path = SKSpriteNode(imageNamed: "Grey Square")
                            path.anchorPoint = CGPoint(x: 0, y: 0)
                            path.setScale(0.153333333)
                            path.position = CGPoint(x: (repeatX) * (46), y: (-(repeatY) * 46) + 529)
                            addChild(path)
                        }
                    }
                    
                    
                }
            } // Inner maze finish bracket
            
            // Top and Bottom Walls
            for lowerWall in 1...9 {
                let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
                barrier.anchorPoint = CGPoint(x: 0, y: 0)
                barrier.setScale(0.368333333)
                addChild(barrier)
                barrier.position = CGPoint(x: (lowerWall - 1) * (46), y: 161)
            }
            
            for upperWall in 1...9 {
                let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
                barrier.anchorPoint = CGPoint(x: 0, y: 0)
                barrier.setScale(0.368333333)
                addChild(barrier)
                barrier.position = CGPoint(x: (upperWall - 1) * (46), y: 529)
            }
            
            // Side Walls
            for sideWalls in 1...2 {
                for bothWalls in 1...7 {
                    
                    if bothWalls != 4 {
                        let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
                        barrier.anchorPoint = CGPoint(x: 0, y: 0)
                        barrier.setScale(0.368333333)
                        addChild(barrier)
                        barrier.position = CGPoint(x: (sideWalls - 1) * 368, y: 483 - ((bothWalls - 1) * 46))
                    }
                    
                }
            }
            
            // Starting and ending pathways
            for startEndPaths in 1...2 {
                let path = SKSpriteNode(imageNamed: "Grey Square")
                path.anchorPoint = CGPoint(x: 0, y: 0)
                path.setScale(0.153333333)
                path.position = CGPoint(x: (startEndPaths - 1) * (368), y: 345)
                addChild(path)
            }
            
            print(mazeChoice)
            
        } // Creating the maze ending brackets
        
        createMaze()
        
        //        if player.position > 368 {
        //
        //            createMaze()
        //            player.position = CGPoint(x: size.width / 9, y: size.height * 0.5)
        //
        //        }
        
    }
    
} // Game Scene Class Bracket
