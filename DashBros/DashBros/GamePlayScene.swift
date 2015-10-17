//
//  GameScene.swift
//  DashBros
//
//  Created by H Berson Saint Juste on 10/16/15.
//  Copyright (c) 2015 OneUppDev. All rights reserved.
//

import SpriteKit

// MARK: Enums
enum DeviceType {
    case iPhone4s
    case iPhone5
    case iPhone6
    case iPhone6Plus
    case iPad
    case unkownDevice
    
}

// MARK: GameLayers
let gameLayer1: SKNode = SKNode()
let gameLayer2: SKNode = SKNode()
let gameLayer3: SKNode = SKNode()
let objectsWorld: SKNode = SKNode()
let hudWorld: SKNode = SKNode()
let characterWorld: SKNode = SKNode()

// MARK: ProjectLevelProperties


class GamePlayScene: SKScene {
    //MARK: ClassLevelProperties
    // Declarations
    var screenWidth: CGFloat?
    var screenHeight: CGFloat?
    var userDevice = DeviceType.iPhone4s
    var backgroundImageWidth: CGFloat?
    var backgroundImageHeight: CGFloat?
    
    
    override func didMoveToView(view: SKView) {
        // Background Color
        self.backgroundColor = SKColor.blackColor()
        // Anchor Point (0.5, 0.5) place node directly in the middle of the screen
        self.anchorPoint = CGPointMake(0.5, 0.5)
        // Assing the width & height of the device to the optional values
        screenWidth = self.scene!.view!.bounds.width
        screenHeight = self.scene!.view!.bounds.height
        
        // Call the function determineTheUsersDevice(CGFloat, CGFloat) & pass in the screenWidth, and screenHeight
        determineTheUsersDevice(screenWidth!, deviceHeight: screenHeight!)
        
        // add the game layers
        self.addChild(gameLayer3)
        gameLayer3.zPosition = -3
        self.addChild(gameLayer2)
        gameLayer2.zPosition = -2
        self.addChild(gameLayer1)
        gameLayer1.zPosition = -1
        
        
        // Call the function createGameBackgroundImages() which will add the background images in the Assets.xcassets folder
        createGameBackgroundImages()
    }
    
    // MARK: TouchesBegan
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        /*
        for touch in touches {
            let location = touch.locationInNode(self)
        }
        */
        
    }
   
    // MARK: Update
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    
    // MARK: CreateGameLayers
    func createGameBackgroundImages() {
        let layer3: SKSpriteNode = SKSpriteNode(imageNamed: "Layer3")
        layer3.size = CGSizeMake(backgroundImageWidth!, backgroundImageHeight!)
        gameLayer3.addChild(layer3)
        
        let layer2: SKSpriteNode = SKSpriteNode(imageNamed: "Layer2")
        layer2.size = CGSizeMake(backgroundImageWidth!, backgroundImageHeight!)
        gameLayer2.addChild(layer2)
        
        let layer1: SKSpriteNode = SKSpriteNode(imageNamed: "Layer1")
        layer1.size = CGSizeMake(backgroundImageWidth!, backgroundImageHeight!)
        gameLayer1.addChild(layer1)
        
        
    }
    
    
    
    // MARK: DeviceType
    func determineTheUsersDevice(deviceWidth: CGFloat, deviceHeight: CGFloat) {
        // Create an nested if statement that will check the width & height to assign the corrrect values for the appropriate device
        var deviceString: String?
        if ( (deviceWidth == 480.0) && (deviceHeight == 320.0) ) {
            deviceString = "iPhone4s"
            userDevice = .iPhone4s
            
        } else if ( (deviceWidth == 568.0) && (deviceHeight == 320.0) ) {
            deviceString = "iPhone5"
            userDevice = .iPhone5
            
        } else if ( (deviceWidth == 667.0) && (deviceHeight == 375.0) ) {
            deviceString = "iPhone6"
            userDevice = .iPhone6
            
        } else if ( (deviceWidth == 736.0) && (deviceHeight == 414.0) ) {
            deviceString = "iPhone6Plus"
            userDevice = .iPhone6Plus
            
        } else if ( (deviceWidth == 1024.0) && (deviceHeight == 768.0) ) {
            deviceString = "iPad"
            userDevice = .iPad
            
        } else {
            deviceString = "Unkown Device Type"
            userDevice = .unkownDevice
        }
        
        backgroundImageWidth = deviceWidth * 1.8222
        backgroundImageHeight = deviceHeight * 1.0125
        
        // Check if the deviceString is != nil... then print it out
        /* This will ensure that the app does not crash if app decide to release 
            a new device with a bigger screen and we haven't it in our if statement
        */
        if (deviceString != nil) {
            print(deviceString!)
        }
        print("Device Width: \(deviceWidth) Device Height: \(deviceHeight)")
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
