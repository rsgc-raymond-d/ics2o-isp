//
//  GameScene.swift
//  Daedalus
//
//  Created by Daniel Raymond on 2016-11-24.
//  Copyright © 2016 Daniel Raymond. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let path = SKSpriteNode(imageNamed: "Grey Square")
    let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
    let player = SKSpriteNode(imageNamed: "Daedalus Sprite")
    let button = SKSpriteNode(imageNamed: "ArrowButton")
    let enemy = SKSpriteNode(imageNamed: "Enemy")
    
    // The different maze choices
    
    var realMazeOption: [Bool] = []
    
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
                               false, true, false, true, false, true, true,
                               false, false, true, false, true, true, false,
                               false, true, false, false, false, false, false]
    
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
    
    let mazeOption6: [Bool] = [false, true, false, false, false, true, false,
                               false, false, false, true, false, false, false,
                               true, true, false, false, true, true, false,
                               false, false, true, false, false, true, false,
                               false, true, false, true, false, false, true,
                               false, false, false, true, false, true, false,
                               false, true, false, false, false, false, false]
    
    let mazeOption7: [Bool] = [false, false, false, false, false, false, true,
                               false, true, false, true, true, false, false,
                               false, true, true, false, false, true, false,
                               false, false, false, false, true, false, false,
                               false, true, false, false, false, true, false,
                               false, true, false, true, true, false, true,
                               false, false, false, false, false, true, false]
    
    // Inner maze constructing
    func createMaze() {
        
        // Randomizer to create a number
        let mazeChoice = arc4random_uniform(7)
        var combineCoordinate = -1
        
        // Uses the random number to decide what maze to build
        if mazeChoice == 0 {
            realMazeOption = mazeOption1
        } else if mazeChoice == 1 {
            realMazeOption = mazeOption2
        } else if mazeChoice == 2 {
            realMazeOption = mazeOption3
        } else if mazeChoice == 3 {
            realMazeOption = mazeOption4
        } else if mazeChoice == 4 {
            realMazeOption = mazeOption5
        } else if mazeChoice == 5 {
            realMazeOption = mazeOption6
        } else if mazeChoice == 6 {
            realMazeOption = mazeOption7
        }
        
        // Builds the chosen maze
        for repeatY in 1...7 {
            for repeatX in 1...7 {
                
                combineCoordinate += 1
                
                if realMazeOption[combineCoordinate] == true {
                    let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
                    
                    barrier.anchorPoint = CGPoint(x: 0, y: 0)
                    barrier.position = CGPoint(x: (repeatX) * (46), y: (-(repeatY) * 46) + 529)
                    barrier.setScale(0.368333333)
                    let barrierDistance = (player.position.x - barrier.position.x) + (player.position.y - barrier.position.y)
                    let darkBarrierColor = SKAction.colorize(with: SKColor.black, colorBlendFactor: 1.0, duration: 0.5)
                    //  let normalBarrierColor = SKAction.colorize(with: SKColor.black, colorBlendFactor: 1.0, duration: 0.5)
                    
                    if barrierDistance > 4232 {
                        barrier.run(darkBarrierColor)
                    } else {
                        //  barrier.run(normalBarrierColor)
                    }
                    addChild(barrier)
                } else {
                    let path = SKSpriteNode(imageNamed: "Grey Square")
                    
                    path.anchorPoint = CGPoint(x: 0, y: 0)
                    path.setScale(0.153333333)
                    path.position = CGPoint(x: (repeatX) * (46), y: (-(repeatY) * 46) + 529)
                    flashlight()
                    addChild(path)
                }
            }} // Inner maze finish bracket
        
        // Top and Bottom Walls
        for lowerUpperWalls in 1...2 {
            for hWall in 1...9 {
                let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
                barrier.anchorPoint = CGPoint(x: 0, y: 0)
                barrier.setScale(0.368333333)
                addChild(barrier)
                barrier.position = CGPoint(x: (hWall - 1) * (46), y: (368 * (lowerUpperWalls - 1)) + 161)
            }}
        
        // Side Walls
        for sideWalls in 1...2 {
            for bothWalls in 1...7 {
                
                if bothWalls != 4 {
                    let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
                    barrier.anchorPoint = CGPoint(x: 0, y: 0)
                    barrier.setScale(0.368333333)
                    addChild(barrier)
                    barrier.position = CGPoint(x: (sideWalls - 1) * 368, y: 483 - ((bothWalls - 1) * 46))
                }}}
        
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
    
    // Player model
    func addPlayer() {
        
        player.position = CGPoint(x: size.width / 18, y: size.height / 2)
        player.zPosition = 2
        addChild(player)
        player.setScale(0.035)
    }
    // Function that adds the enemy
    func addEnemy() {
        let enemy = SKSpriteNode(imageNamed: "Enemy")
        enemy.position = CGPoint(x: size.width * 17 / 18, y: size.height / 2)
        enemy.zPosition = 2
        addChild(enemy)
        enemy.setScale(0.01916666667)
        
        moveEnemy()
    }
    func moveEnemy() {
        // Create the actions
        let enemyX = enemy.position.x - (46*1)
        let enemyY = enemy.position.y + (46*0)
        
        let actionMove = SKAction.move(to: CGPoint(x: enemyX, y: enemyY), duration: TimeInterval(1))
        enemy.run(actionMove)
    }
    //
    func flashlight() {
        let barrierDistance = (player.position.x - barrier.position.x) + (player.position.y - barrier.position.y)
        let darkBarrierColor = SKAction.colorize(with: SKColor.black, colorBlendFactor: 1.0, duration: 0.5)
        //  let normalBarrierColor = SKAction.colorize(with: SKColor.black, colorBlendFactor: 1.0, duration: 0.5)
        
        if barrierDistance > 300 {
            barrier.run(darkBarrierColor)
        } else {
            //  barrier.run(normalBarrierColor)
        }
        
        let pathDistance = (player.position.x - path.position.x) * (player.position.x - path.position.x) + (player.position.y - path.position.y) * (player.position.y - path.position.y)
        let darkPathColor = SKAction.colorize(with: SKColor.black, colorBlendFactor: 1.0, duration: 0.5)
        //  let normalPathColor = SKAction.colorize(with: SKColor.white, colorBlendFactor: 1.0, duration: 0.5)
        
        if pathDistance > 300 {
            path.run(darkPathColor)
        } else {
            //  path.run(normalPathColor)
        }
        
    }
    
    override func didMove(to view: SKView) {
        
        //Tells the game whether there will be gravity
        physicsWorld.gravity = CGVector.zero
        //Make this class the physics contact delegate
        physicsWorld.contactDelegate = self
        
        addEnemy()
        
        createMaze()
        
        addPlayer()
        
    } // DidMove Closing Bracket
    
    // Checking if the player has finished the maze
    func resetMaze() {
        if player.position.x > 370 {
            
            // Gets rid of everything
            for barrier in self.children {
                
                //Determine Details
                barrier.removeFromParent()
            }
            addPlayer()
            addEnemy()
            
            // Creates a new maze
            createMaze()
        }
    }
    
    // Functions to make the player sprite move to where the mouse has clicked
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        movePlayer(touchLocation: touchLocation)
        resetMaze()
        flashlight()
    }
    
    // Function to make the player sprite follow the mouse while it remains clicked
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        movePlayer(touchLocation: touchLocation)
        
        resetMaze()
        flashlight()
    }
    
    // A function used in touchesBegan and touchesMoves to shorten the length of code needed
    func movePlayer(touchLocation: CGPoint) {
        
        let destination = CGPoint(x: touchLocation.x, y: touchLocation.y)
        let actionMove = SKAction.move(to: destination, duration: 0.7)
        player.run(actionMove)
        print(player.position.x)
    }
    
} // Game Scene Class Bracket
