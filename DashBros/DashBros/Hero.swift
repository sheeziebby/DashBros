//
//  Hero.swift
//  DashBros
//
//  Created by H Berson  Saint Juste on 10/15/15.
//  Copyright © 2015 OneUppDev. All rights reserved.
//


import Foundation
import SpriteKit

class Hero: SKSpriteNode {
    
    let speedSkill = 10.0
    let breathSkill = 10.0
    let jumpSkill = 10.0
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: SKColor.clearColor(), size: (texture?.size())!)
    }
    
    init(heroImage: String) {
        let heroTexture: SKTexture = SKTexture(imageNamed: heroImage)
        super.init(texture: heroTexture, color: SKColor.clearColor(), size: heroTexture.size())
        self.xScale = 0.65
        self.yScale = 0.65
        //if the heroImage has a certain node name set the attributes
//        if(player.name == "red"){
//            self.setAttributes(10,jump: 10,breath: 10)
//        }
    }
//    
    func setAttributes(speed: CGFloat, jump:CGFloat, breath:CGFloat){
        //define constants for default speed, jumpin, breath.
        
        
    }
    
    
    // When we subclass SKNode & SKSpriteNode We Always Need The Required Init
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder: has not been implemted")
    }
    
}
