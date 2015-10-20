//
//  GameOver.swift
//  DashBros
//
//  Created by H Berson  Saint Juste on 10/16/15.
//  Copyright © 2015 OneUppDev. All rights reserved.
//

import Foundation
import SpriteKit

class GameOver: SKScene {
    override func didMoveToView(view: SKView) {
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
            let secondScene = GamePlayScene(size: self.size)
            let transition = SKTransition.fadeWithDuration(1.0)
            secondScene.scaleMode = SKSceneScaleMode.AspectFill
            self.scene!.view?.presentScene(secondScene, transition: transition)
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        
        
    }
}