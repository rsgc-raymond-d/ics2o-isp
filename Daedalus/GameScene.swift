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
    var randomVariable = 1
    var pathTracker: [Bool] = []
    var path: SKSpriteNode?
    
    
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
    func addpath() {
        
        path = SKSpriteNode(imageNamed: "Grey Square")
        
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
    // The func that creates the maze
    func makeMaze() {
        
        // The randomizer to create a possible path to the end
        
        var pathX: CGFloat = 0
        var pathY = size.height / 2
        var heightOfPathCheck: CGFloat = 0
        
        for _ in 1...30 {
            
            if pathX < (size.width * 7 / 9) - 1 {
                
                let randomizer = arc4random_uniform(6) // Randomizer: different path options to place
                
                if pathY < size.height/2 + size.width/2 && pathY > size.height/2 - size.width/2 {
                   // Create a path square on top of the previous one
                    if randomizer == 0 {
                        
                        pathY = pathY + size.width / 9
                        addpath()
                        heightOfPathCheck += 1
                        // Create two path squares on top of the previous one
                    } else if randomizer == 1 {
                        
                        for _ in 1...2 {
                            pathY = pathY + size.width / 9
                            addpath()
                        }
                        
                        heightOfPathCheck += 2
                        
                        // Create a path square to the right of the previous one
                    } else if randomizer == 2 {
                        
                        pathX = pathX + size.width / 9
                        addpath()
                        // Create two path squares to the right of the previous one
                    } else if randomizer == 3 {
                        
                        for _ in 1...2 {
                            pathX = pathX + size.width / 9
                            addpath()
                        }
                        // Create a path square below of the previous one
                    } else if randomizer == 4 {
                        
                        pathY = pathY - size.width / 9
                        addpath()
                        
                        heightOfPathCheck -= 1
                        
                    } else if randomizer == 5 {
                        // Create two path squares below of the previous one
                        for _ in 1...2 {
                            pathY = pathY - size.width / 9
                            addpath()
                        }
                        heightOfPathCheck -= 2
                    }
                    // If last column & above exit, go down.
                } else if pathY - size.height > heightOfPathCheck {
                    
                    pathY = pathY - size.width / 9
                    addpath()
                    // If last column & below exit, go up.
                } else if pathY - size.height < heightOfPathCheck {
                    
                    pathY = pathY + size.width / 9
                    addpath()
                    
                } // If Y Bracket
            } // Check to make sure it stays within the parameters of the game screen.
        } // Loop Bracket
        
        // Generate blocks and paths around the path to fill the area
        for generatedSpace in 1...20 {
            
            let blockChoice = arc4random_uniform(2)
            
            if blockChoice == 0 {
                pathX = (CGFloat(generatedSpace) - 1) * 20
                pathY = (generatedSpace - 1) * 20
                addpath()
            } else {
                pathX = (generatedSpace - 1) * 20
                pathY = (generatedSpace - 1) * 20
                addbarrier()
            }
            
        } // GeneratedSpace Loop Bracket
    } // func makeMaze Bracket
} // Game Scene Class Bracket
