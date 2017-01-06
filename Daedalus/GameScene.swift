//
//  GameScene.swift
//  Daedalus
//
//  Created by Daniel Raymond on 2016-11-24.
//  Copyright © 2016 Daniel Raymond. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // Maze sprites
    let path = SKSpriteNode(imageNamed: "Grey Square")
    let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
    
    // Moving sprites
    let player = SKSpriteNode(imageNamed: "Daedalus Sprite")
    let enemy = SKSpriteNode(imageNamed: "Enemy")
    
    
    // Flashlight
    let flashlight = SKSpriteNode(imageNamed: "Flashlight")
    var flashlightSize: CGFloat = 350
    
    let button = SKSpriteNode(imageNamed: "Flashlight.Button")
    
    // Timer variables
    var elapsedTime : Int = 0
    var startTime : Int?
    var timer = 30
    
    // Title variables
    var mazesCompleted = 0
    let completionLabel = SKLabelNode(fontNamed: "Diogenes-Bold")
    let timerLabel = SKLabelNode(fontNamed: "Diogenes-Bold")
    
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
    
    let mazeOption8: [Bool] = [false, false, false, false, false, false, false,
                               false, true, true, true, true, true, false,
                               false, false, false, false, false, false, true,
                               false, true, true, true, true, true, false,
                               false, false, false, false, false, false, false,
                               false, true, true, true, true, true, false,
                               false, false, false, false, false, false, true]
    
    // Inner maze constructing
    func createMaze() {
        
        let blockSize = size.width/9
        let yBlockSize = size.height/2 - size.width/2
        
        
        
        // Randomizer to create a number to choose the maze
        let mazeChoice = arc4random_uniform(8)
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
        } else if mazeChoice == 7 {
            realMazeOption = mazeOption8
        }
        
        // Builds the chosen maze
        for repeatY in 1...7 {
            for repeatX in 1...7 {
                
                let blockXPosition = CGFloat(repeatX) * blockSize
                let blockYPosition = -CGFloat(repeatY) * blockSize + size.height/2 + size.width/2 - blockSize
                
                combineCoordinate += 1
                
                if realMazeOption[combineCoordinate] == true {
                    let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
                    
                    barrier.name = "barrier"
                    barrier.anchorPoint = CGPoint(x: 0, y: 0)
                    barrier.position = CGPoint(x: blockXPosition, y: blockYPosition)
                    barrier.setScale(size.width/1125)
                    addChild(barrier)
                } else {
                    let path = SKSpriteNode(imageNamed: "Grey Square")
                    
                    path.anchorPoint = CGPoint(x: 0, y: 0)
                    path.setScale(size.width/2700)
                    path.position = CGPoint(x: blockXPosition, y: blockYPosition)
                    
                    addChild(path)
                }}} // Inner maze finish bracket
        
        // Top and Bottom Walls
        for lowerUpperWalls in 1...2 {
            for hWall in 1...9 {
                let blockXPosition = CGFloat(hWall - 1) * blockSize
                let blockYPosition = blockSize * 8 * CGFloat(lowerUpperWalls - 1) + yBlockSize
                
                let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
                barrier.name = "barrier"
                barrier.anchorPoint = CGPoint(x: 0, y: 0)
                barrier.setScale(size.width/1125)
                addChild(barrier)
                barrier.position = CGPoint(x: blockXPosition, y: blockYPosition)
            }}
        
        // Side Walls
        for sideWalls in 1...2 {
            for bothWalls in 1...7 {
                
                if bothWalls != 4 {
                    let blockXPosition = (CGFloat(sideWalls) - 1) * blockSize * 8
                    let blockYPosition = size.height/2 + size.width/2 - (CGFloat(bothWalls) - 1) * blockSize - blockSize * 2
                    
                    let barrier = SKSpriteNode(imageNamed: "Daedalus Barrier")
                    barrier.name = "barrier"
                    barrier.anchorPoint = CGPoint(x: 0, y: 0)
                    barrier.setScale(size.width/1125)
                    addChild(barrier)
                    barrier.position = CGPoint(x: blockXPosition, y: blockYPosition)
                }}}
        
        // Starting and ending pathways
        let startPath = SKSpriteNode(imageNamed: "Grey Square")
        startPath.anchorPoint = CGPoint(x: 0, y: 0)
        startPath.setScale(size.width/2700)
        startPath.position = CGPoint(x: 0, y: size.height/2 - blockSize/2)
        addChild(startPath)
        
        let endPath = SKSpriteNode(imageNamed: "Grey Square")
        endPath.name = "endPath"
        startPath.anchorPoint = CGPoint(x: 0, y: 0)
        endPath.setScale(size.width/2700)
        endPath.position = CGPoint(x: blockSize * 8 + blockSize/2, y: size.height/2)
        addChild(endPath)
        
        print(mazeChoice)
        
    } // Creating the maze ending brackets
    
    // Player model
    func addPlayer() {
        
        player.position = CGPoint(x: size.width / 18, y: size.height / 2)
        player.zPosition = 2
        addChild(player)
        player.setScale(size.width)
        
        flashlight.position = CGPoint(x: size.width / 18, y: size.height / 2)
        flashlight.zPosition = 2
        addChild(flashlight)
        flashlight.setScale(size.width/flashlightSize)
        
    }
    
    override func didMove(to view: SKView) {
        
        let scene = SKScene(size: frame.size)
        
        //Tells the game whether there will be gravity
        physicsWorld.gravity = CGVector.zero
        //Make this class the physics contact delegate
        physicsWorld.contactDelegate = self
        scene.physicsBody = SKPhysicsBody(edgeLoopFrom: scene.frame)
        
        createMaze()
        
        // The parameters for displaying maze completion
        completionLabel.text = String(mazesCompleted)
        completionLabel.fontColor = SKColor.brown
        completionLabel.fontSize = size.width/6
        completionLabel.zPosition = 5
        completionLabel.position = CGPoint(x: size.width - size.width/6, y: size.height / 9)
        addChild(completionLabel)
        
        timerLabel.text = String(timer)
        timerLabel.fontColor = SKColor.brown
        timerLabel.fontSize = size.width/6
        timerLabel.zPosition = 5
        timerLabel.position = CGPoint(x: size.width - size.width/6, y: size.height / 18)
        addChild(timerLabel)
        
    } // DidMove Closing Bracket
    
    // Checking if the player has finished the maze
    func resetMaze() {
        // Gets rid of everything
        for barrier in self.children {
            
            //Determine Details
            barrier.removeFromParent()
        }
        
        flashlight.position = CGPoint(x: size.width / 18, y: size.height / 2)
        flashlight.zPosition = 2
        
        
        // Creates a new maze
        createMaze()
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
    func moveBy(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        movePlayer(touchLocation: touchLocation)
    }
    
    // A function used in touchesBegan and touchesMoves to shorten the length of code needed
    func movePlayer(touchLocation: CGPoint) {
        
        let destination = CGPoint(x: touchLocation.x, y: touchLocation.y)
        
        // Makes the player always go at the same speed
        let YDuration = (Int(destination.y - player.position.y)^2)
        let XDuration = (Int(destination.x - player.position.x)^2)
        var realDuration = Double(YDuration + XDuration) / 64
        
        
        // Makes sure the duration is always positive
        if realDuration < 0 {
            realDuration = realDuration - (2 * realDuration)
        }
        
        let actionMove = SKAction.move(to: destination, duration: realDuration)
        player.run(actionMove)
        flashlight.run(actionMove)
    }
    
    // The function that checks something 60 times a second
    override func update(_ currentTime: TimeInterval) {
        // Check for collisions between the player and barriers
        checkCollisions()
        
        
        // Timer that counts from 30 to zero.
        if timer != 0 {
            if let startTime = startTime {
                
                // If started, how much time has elapsed?
                let time = Int(currentTime) - startTime
                
                if time != elapsedTime {
                    elapsedTime = time
                    
                    print(timer)
                    
                    timer -= 1
                }
                
            } else {
                // If not started, set the start time
                startTime = Int(currentTime) - elapsedTime
                timerLabel.text = String(timer)
                addChild(timerLabel)
            }
        }
    }
    
    // This function checks for collisions
    func checkCollisions() {
        
        // The array of all the hitable objects in the game
        var playerHitBarriers: [SKSpriteNode] = []
        var endWin: [SKSpriteNode] = []
        
        // Finds all the obstacles
        enumerateChildNodes(withName: "barrier", using: {
            node, _ in
            
            // Get a reference to the current code
            let barrier = node as! SKSpriteNode
            
            // Check for obstacle intersection
            if barrier.frame.intersects(self.player.frame) {
                // what to do if they intersect
                playerHitBarriers.append(barrier)
            }
        })
        // Finds the last block that you have to tocuch to reset the maze and the player
        enumerateChildNodes(withName: "endPath", using: {
            node, _ in
            
            // Get a reference to the current code
            let endPath = node as! SKSpriteNode
            
            if endPath.frame.intersects(self.player.frame) {
                
                // what to do if they intersect
                endWin.append(endPath)
            }
        })
        
        // Loop for all th obstacles colliding with things
        for barrier in playerHitBarriers {
            playerHit(by: barrier)
        }
        
        for endPath in endWin {
            playerWin(by: endPath)
        }
    }
    
    // What to do if a player hits a barrier
    func playerHit(by barrier: SKSpriteNode) {
        
        resetMaze()
    }
    
    // What to do if a player hits the end block
    func playerWin(by endPath: SKSpriteNode) {
        resetMaze()
        
        player.position = CGPoint(x: size.width / 18, y: size.height / 2)
        player.zPosition = 2
        addChild(player)
        player.setScale(size.width/15000)
        
        
        flashlight.position = CGPoint(x: size.width / 18, y: size.height / 2)
        addChild(flashlight)
        
        // Shows the number of mazes completed
        mazesCompleted += 1
        completionLabel.text = String(mazesCompleted/6)
        addChild(completionLabel)
        
        timer = 30
    }
    
} // Game Scene Class Bracket
