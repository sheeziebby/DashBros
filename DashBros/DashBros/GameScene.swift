//
//  GameScene.swift
//  DashBros
//
//  Created by H Berson  Saint Juste on 10/15/15.
//  Copyright (c) 2015 OneUppDev. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
    // MARK: GameLayers
    /* 
        We will have a gameLayer, characterLayer as well as obstableLayer, hudLayer to hold the sprites and backgrounds
        this will be good b/c it will help optimize the CPU of the devices.
    */
    var gameLayerOne: SKNode = SKNode()
    var gameLayerTwo: SKNode = SKNode()
    var gameLayerThree: SKNode = SKNode()
    var characterLayer: SKNode = SKNode()
    var obstableLayer: SKNode = SKNode()
    var hudLayer: SKNode = SKNode()
    var pauseButton: SKNode = SKNode()
    
    // MARK: Properties
    var screenWidth: CGFloat?
    var screenHeight: CGFloat?
    var player: Hero?
    var player2: Hero?
    var player3: Hero?
    var player4: Hero?
    var playerRunning: SKAction!
    var player2Running: SKAction!
    var player3Running: SKAction!
    var player4Running: SKAction!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        screenWidth = self.view!.bounds.width
        screenHeight = self.view!.bounds.height
        self.anchorPoint = CGPointMake(0.5, 0.5)
        //print("The Device Width: \(screenWidth!) | The Device Height: \(screenHeight!)")
        self.physicsWorld.gravity = CGVectorMake(0.0, -9.8)
        
        //set the scene's physics body.
        let sceneBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        
        sceneBody.friction = 1;
        
        self.physicsBody = sceneBody
        setUpUI()
        print("Scene")
        
        player = Hero(heroImage: "red1")
        player?.position = CGPointMake(-270.0, 0.0)
        player2 = Hero(heroImage: "1")
        player2?.position = CGPointMake(-170.0, -25.0)
        player3 = Hero(heroImage: "greenRun1")
        player3?.position = CGPointMake(-100.0,80.0)
        player4 = Hero(heroImage: "yellowRunning1")
        player4?.position = CGPointMake(200.0, -80.0)
        
        characterLayer.addChild(player!)
        characterLayer.addChild(player2!)
        characterLayer.addChild(player3!)
        characterLayer.addChild(player4!)
        startRunning()
        
        player?.runAction(playerRunning)
        player2?.runAction(player2Running)
        //player3?.runAction(player3Running)
        player4?.runAction(player4Running)
        
}
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        /*
        for touch in touches {
            let location = touch.locationInNode(self)
        }
        */
        // If next button is touched, start transition to second scene
       // if (node.name == "menuButton") {
            let secondScene = GameOver(size: self.size)
            let transition = SKTransition.fadeWithDuration(0.5)
            secondScene.scaleMode = SKSceneScaleMode.AspectFill
            self.scene!.view?.presentScene(secondScene, transition: transition)
       // }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func startRunning(){
        
        let redAtlas = SKTextureAtlas(named: "RedRunning")
        let runningAnimation = SKAction.animateWithTextures([redAtlas.textureNamed("red1"),
            redAtlas.textureNamed("red2"),
            redAtlas.textureNamed("red3"),
            redAtlas.textureNamed("red4")],
            timePerFrame: 0.1)
        
        let blueAtlas = SKTextureAtlas(named: "BlueRunning")
        let runningAnimation2 = SKAction.animateWithTextures([blueAtlas.textureNamed("1"),
            blueAtlas.textureNamed("2"),
            blueAtlas.textureNamed("3"),
            blueAtlas.textureNamed("4")],
            timePerFrame: 0.07)
        
        let greenAtlas = SKTextureAtlas(named: "GreenRunning")
        let runningAnimation3 = SKAction.animateWithTextures([greenAtlas.textureNamed("greenRun1"),
            blueAtlas.textureNamed("greenRun2"),
            blueAtlas.textureNamed("greenRun3"),
            blueAtlas.textureNamed("greenRun4")],
            timePerFrame: 0.1)
        
        let yellowAtlas = SKTextureAtlas(named: "YellowRunning")
        let runningAnimation4 = SKAction.animateWithTextures([yellowAtlas.textureNamed("yellowRunning1"),
            yellowAtlas.textureNamed("yellowRunning2"),
            yellowAtlas.textureNamed("yellowRunning3"),
            yellowAtlas.textureNamed("yellowRunning4")],
            timePerFrame: 0.1)
        
        playerRunning = SKAction.repeatActionForever(runningAnimation)
        player2Running = SKAction.repeatActionForever(runningAnimation2)
        player3Running = SKAction.repeatActionForever(runningAnimation3)
        player4Running = SKAction.repeatActionForever(runningAnimation4)
    }
    
    func setUpUI() {
        // gameLayer
        self.addChild(gameLayerThree)
        gameLayerThree.zPosition = -3
        self.addChild(gameLayerTwo)
        gameLayerTwo.zPosition = -2
        self.addChild(gameLayerOne)
        gameLayerOne.zPosition = -1
        
        self.addChild(hudLayer)
        hudLayer.zPosition = 1
        
        // obstableLayer
        self.addChild(obstableLayer)
        obstableLayer.zPosition = 2
        
        // characterLayer
        self.addChild(characterLayer)
        characterLayer.zPosition = 100
        
        // creatring layer3
        let layer3: SKSpriteNode = SKSpriteNode(imageNamed: "Layer3")
        layer3.size = CGSizeMake(screenWidth!, screenHeight!)
        gameLayerThree.addChild(layer3)
        
        // creating layer2
        let layer2: SKSpriteNode = SKSpriteNode(imageNamed: "Layer2")
        layer2.size = CGSizeMake(screenWidth!, screenHeight!)
        gameLayerTwo.addChild(layer2)
        
        let layer1: SKSpriteNode = SKSpriteNode(imageNamed: "Layer1")
        layer1.size = CGSizeMake(screenWidth!, screenHeight!)
        gameLayerOne.addChild(layer1)
        
        let background: SKSpriteNode = SKSpriteNode(imageNamed: "platform02")
        background.size = CGSizeMake(screenWidth!, screenHeight!)
        gameLayerOne.addChild(background)

    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
