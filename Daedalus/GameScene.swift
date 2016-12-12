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
    let flashlight = SKSpriteNode(imageNamed: "Flashlight")
    let completionLabel = SKLabelNode(fontNamed: "Diogenes-Bold")
    var mazesCompleted = 0
    
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
                    
                    barrier.name = "barrier"
                    barrier.anchorPoint = CGPoint(x: 0, y: 0)
                    barrier.position = CGPoint(x: (repeatX) * (46), y: (-(repeatY) * 46) + 529)
                    barrier.setScale(0.368333333)
                    
                    addChild(barrier)
                } else {
                    let path = SKSpriteNode(imageNamed: "Grey Square")
                    
                    path.anchorPoint = CGPoint(x: 0, y: 0)
                    path.setScale(0.153333333)
                    path.position = CGPoint(x: (repeatX) * (46), y: (-(repeatY) * 46) + 529)
                    
                    addChild(path)
                }}} // Inner maze finish bracket
        
        // Top and Bottom Walls
        for lowerUpperWalls in 1...2 {
            for hWall in 1...9 {
                let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
                barrier.name = "barrier"
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
                    barrier.name = "barrier"
                    barrier.anchorPoint = CGPoint(x: 0, y: 0)
                    barrier.setScale(0.368333333)
                    addChild(barrier)
                    barrier.position = CGPoint(x: (sideWalls - 1) * 368, y: 483 - ((bothWalls - 1) * 46))
                }}}
        
        // Starting and ending pathways
        
        let startPath = SKSpriteNode(imageNamed: "Grey Square")
        startPath.anchorPoint = CGPoint(x: 0, y: 0)
        startPath.setScale(0.153333333)
        startPath.position = CGPoint(x: 0, y: 345)
        addChild(startPath)
        
        let endPath = SKSpriteNode(imageNamed: "Grey Square")
        endPath.name = "endPath"
        endPath.anchorPoint = CGPoint(x: 0, y: 0)
        endPath.setScale(0.153333333)
        endPath.position = CGPoint(x: 368, y: 345)
        addChild(endPath)
        
        
        // print(mazeChoice)
        
    } // Creating the maze ending brackets
    
    // Player model
    func addPlayer() {
        
        player.position = CGPoint(x: size.width / 18, y: size.height / 2)
        player.zPosition = 2
        addChild(player)
        player.setScale(0.035)
        
        
        flashlight.position = CGPoint(x: size.width / 18, y: size.height / 2)
        flashlight.zPosition = 2
        addChild(flashlight)
        flashlight.setScale(1.4)
    }
    // Function that adds the enemy
    func addEnemy() {
        let enemy = SKSpriteNode(imageNamed: "Enemy")
        enemy.position = CGPoint(x: size.width * 17 / 18, y: size.height / 2)
        enemy.zPosition = 1
        addChild(enemy)
        enemy.setScale(0.01916666667)
        
        moveEnemyLeft()
    }
    
    // Movement for the enemy
    func moveEnemyLeft() {
        // Create the actions
        let enemyX = enemy.position.x - (46*1)
        let enemyY = enemy.position.y
        
        let actionMove = SKAction.move(to: CGPoint(x: enemyX, y: enemyY), duration: TimeInterval(1))
        enemy.run(actionMove)
    }
    
    func moveEnemyRight() {
        // Create the actions
        let enemyX = enemy.position.x + (46*1)
        let enemyY = enemy.position.y
        
        let actionMove = SKAction.move(to: CGPoint(x: enemyX, y: enemyY), duration: TimeInterval(1))
        enemy.run(actionMove)
    }
    
    func moveEnemyUp() {
        // Create the actions
        let enemyX = enemy.position.x
        let enemyY = enemy.position.y + (46*1)
        
        let actionMove = SKAction.move(to: CGPoint(x: enemyX, y: enemyY), duration: TimeInterval(1))
        enemy.run(actionMove)
    }
    
    func moveEnemyDown() {
        // Create the actions
        let enemyX = enemy.position.x
        let enemyY = enemy.position.y - (46*1)
        
        let actionMove = SKAction.move(to: CGPoint(x: enemyX, y: enemyY), duration: TimeInterval(1))
        enemy.run(actionMove)
    }
    
    
    override func didMove(to view: SKView) {
        
        //Tells the game whether there will be gravity
        physicsWorld.gravity = CGVector.zero
        //Make this class the physics contact delegate
        physicsWorld.contactDelegate = self
        
        addEnemy()
        
        createMaze()
        
        addPlayer()
        
        completionLabel.text = String(mazesCompleted)
        completionLabel.fontColor = SKColor.brown
        completionLabel.fontSize = 150
        completionLabel.zPosition = 5
        completionLabel.position = CGPoint(x: size.width - size.width/8, y: size.height / 9)
        addChild(completionLabel)
        
    } // DidMove Closing Bracket
    
    // Checking if the player has finished the maze
    func resetMaze() {
        // Gets rid of everything
        for barrier in self.children {
            
            //Determine Details
            barrier.removeFromParent()
        }
        player.removeFromParent()
        flashlight.position = CGPoint(x: size.width / 18, y: size.height / 2)
        flashlight.zPosition = 2
        addChild(flashlight)
        flashlight.setScale(1.4)
        
        // Creates a new maze
        createMaze()

        mazesCompleted += 1
        addChild(completionLabel)
    }
    
    // Functions to make the player sprite move to where the mouse has clicked
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        movePlayer(touchLocation: touchLocation)
    }
    
    // Function to make the player sprite follow the mouse while it remains clicked
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        movePlayer(touchLocation: touchLocation)
    }
    
    // A function used in touchesBegan and touchesMoves to shorten the length of code needed
    func movePlayer(touchLocation: CGPoint) {
        
        let destination = CGPoint(x: touchLocation.x, y: touchLocation.y)
        let actionMove = SKAction.move(to: destination, duration: 0.3)
        player.run(actionMove, withKey: "barrierStop")
        flashlight.run(actionMove, withKey: "barrierStop")
    }
    
    // The function that checks something 60 times a second
    override func update(_ currentTime: TimeInterval) {
        // Check for collisions between the player and barriers
        checkCollisions()
        
    }
    
    // This function checks for collisions
    func checkCollisions() {
        
        // The array of all the hitable objects in the game
        var hitBarriers: [SKSpriteNode] = []
        var endWin: [SKSpriteNode] = []
        
        // Finds all the obstacles
        enumerateChildNodes(withName: "barrier", using: {
            node, _ in
            
            // Get a reference to the current code
            let barrier = node as! SKSpriteNode
            
            // Check for obstacle intersection
            if barrier.frame.intersects(self.player.frame) {
                
                // what to do if they intersect
                hitBarriers.append(barrier)
            }
        })
        
        enumerateChildNodes(withName: "endPath", using: {
            node, _ in
            
            // Get a reference to the current code
            let endPath = node as! SKSpriteNode
            if endPath.frame.intersects(self.player.frame) {
                
                // what to do if they intersect
                endWin.append(endPath)
            }
        })
        
        // Loop for all th obstacles colliding with santa
        for barrier in hitBarriers {
            playerHit(by: barrier)
        }
        
        for endPath in endWin {
            playerWin(by: endPath)
        }
    }
    
    func playerHit(by barrier: SKSpriteNode) {
        
        player.removeAction(forKey: "barrierStop")
        flashlight.removeAction(forKey: "barrierStop")
        
    }
    
    func playerWin(by endPath: SKSpriteNode) {
        resetMaze()
        
        player.position = CGPoint(x: size.width / 18, y: size.height / 2)
        player.zPosition = 2
        addChild(player)
        player.setScale(0.035)
    }
    
    
} // Game Scene Class Bracket


