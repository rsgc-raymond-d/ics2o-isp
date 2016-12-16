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
    let enemy = SKSpriteNode(imageNamed: "Enemy")
    let flashlight = SKSpriteNode(imageNamed: "Flashlight")
    let button = SKLabelNode(imageNamed: "Flashlight.Button")
    let completionLabel = SKLabelNode(fontNamed: "Diogenes-Bold")
    var mazesCompleted = 0
    var flashlightSize: CGFloat = 350
    
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
        
        let blockSize = size.width/9
        let yBlockSize = size.height/2 - size.width/2
        
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
    
    // Function that adds the enemy
    func addEnemy() {
        let enemy = SKSpriteNode(imageNamed: "Enemy")
        enemy.name = "enemy"
        enemy.position = CGPoint(x: size.width * 17 / 18, y: size.height / 2)
        enemy.zPosition = 1
        addChild(enemy)
        enemy.setScale(size.width/2400)
        
        enemyMovement()
        
    }
    
    // Movement for the enemy
    func enemyMovement() {
        var enemyDirectionX = 0
        var enemyDirectionY = 0
        let enemyChoice = arc4random_uniform(4)
        
        if enemyChoice == 0 {
            enemyDirectionX = 1
            
        } else if enemyChoice == 1 {
            enemyDirectionX = -1
            
        } else if enemyChoice == 2 {
            enemyDirectionY = 1
            
        } else if enemyChoice == 3 {
            enemyDirectionY = -1
        }
        
        // Create the actions
        let enemyX = enemy.position.x + (size.width/9 * CGFloat(enemyDirectionX))
        let enemyY = enemy.position.y + (size.width/9 * CGFloat(enemyDirectionY))
        
        let actionMove = SKAction.move(to: CGPoint(x: enemyX, y: enemyY), duration: TimeInterval(1))
        enemy.run(actionMove)
    }
    
    
    func addButton() {
        button.name = "button"
        button.position = CGPoint(x: size.width * 2/9, y: size.width/9)
        button.zPosition = 10
        addChild(button)
        button.setScale(size.width/1000)
    }
    
    
    @IBAction func startButton(sender: AnyObject) {
        if mazesCompleted > 9 {
            mazesCompleted -= 10
            flashlight.removeFromParent()
            flashlightSize -= 10
            addChild(flashlight)
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
        
        addButton()
        
        // The parameters for displaying maze completion
        completionLabel.text = String(mazesCompleted)
        completionLabel.fontColor = SKColor.brown
        completionLabel.fontSize = size.width/6
        completionLabel.zPosition = 5
        completionLabel.position = CGPoint(x: size.width - size.width/6, y: size.height / 9)
        addChild(completionLabel)
        
        let button = SKLabelNode(fontNamed: "Flashlight.Button")
        button.position = CGPoint(x: size.width * 2/9, y: size.width/9)
        button.zPosition = 3
        addChild(button)
        
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
        flashlight.setScale(size.width/300)
        
        // Creates a new maze
        createMaze()
        
        // Shows the number of mazes completed
        mazesCompleted += 1
        completionLabel.text = String(mazesCompleted/3)
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
        var playerHitBarriers: [SKSpriteNode] = []
        var enemyHitBarriers: [SKSpriteNode] = []
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
            
            if barrier.frame.intersects(self.enemy.frame) {
                // what to do if they intersect
                enemyHitBarriers.append(barrier)
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
        
        for barrier in enemyHitBarriers {
            enemyHit(by: barrier)
        }
        
        for endPath in endWin {
            playerWin(by: endPath)
        }
    }
    
    func playerHit(by barrier: SKSpriteNode) {
        
        player.removeAction(forKey: "barrierStop")
        flashlight.removeAction(forKey: "barrierStop")
    }
    
    func enemyHit(by barrier: SKSpriteNode) {
        enemyMovement()
    }
    
    func playerWin(by endPath: SKSpriteNode) {
        resetMaze()
        
        player.position = CGPoint(x: size.width / 18, y: size.height / 2)
        player.zPosition = 2
        addChild(player)
        player.setScale(10/size.width)
    }
    
} // Game Scene Class Bracket
