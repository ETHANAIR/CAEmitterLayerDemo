//
//  ViewController.swift
//  CAEmitterLayerDemo
//
//  Created by ETHAN on 2016/11/16.
//  Copyright © 2016年 ETHAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var snowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupEmitterLayer()
    }
    
    func setupEmitterLayer() {
        
        let snowEmitter = CAEmitterLayer.init()
        let width = self.view.bounds.size.width
        
        snowEmitter.emitterPosition = CGPoint(x: width / 2.0, y: 0) //The center of the emission shape
        snowEmitter.emitterSize = CGSize(width: width * 2.0, height: 0.0)
        
        snowEmitter.emitterMode = kCAEmitterLayerSurface
        snowEmitter.emitterShape = kCAEmitterLayerRectangle
        
        let temArray = NSMutableArray.init()
        temArray.add(self.cellWithPoint(points: CGPoint(x: 1, y: 1)))
        temArray.add(self.cellWithPoint(points: CGPoint(x: 1, y: 1)))
        temArray.add(self.cellWithPoint(points: CGPoint(x: 1, y: 1)))
        temArray.add(self.cellWithPoint(points: CGPoint(x: 1, y: 1)))
        temArray.add(self.cellWithPoint(points: CGPoint(x: 1, y: 1)))
        temArray.add(self.cellWithPoint(points: CGPoint(x: 1, y: 1)))
        
        snowEmitter.emitterCells = NSArray.init(array: temArray) as? [CAEmitterCell]
        self.snowView.layer.insertSublayer(snowEmitter, at: 0)
        
    }
    
    func cellWithPoint(points: CGPoint) -> CAEmitterCell {
        let snowFlake = CAEmitterCell.init()
        snowFlake.birthRate = 5 //The number of emitted objects created every second
        snowFlake.lifetime = 120.0 //The lifetime of each emitted object in seconds
        snowFlake.velocity = CGFloat(arc4random()%4) //The initial mean velocity of each emitted object, its range
        snowFlake.xAcceleration = points.x * 0.02 //The acceleration vector applied to emitted objects
        snowFlake.yAcceleration = points.y * 1.1 //The acceleration vector applied to emitted objects
        snowFlake.emissionRange = CGFloat(0.5 * M_PI)
        snowFlake.spinRange = CGFloat(2 * M_PI)
        snowFlake.scale = 0.05
        snowFlake.contents = UIImage.init(named: "DazRing")?.cgImage
        snowFlake.color = UIColor.white.cgColor
        return snowFlake;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

