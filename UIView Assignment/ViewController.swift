//
//  ViewController.swift
//  UIView Assignment
//
//  Created by Ataman on 05.04.2020.
//  Copyright © 2020 Ataman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildPiramida()
        
    }
    func buildPiramida() {
        let boxesInBase = countBoxesInBase()
        let xStartPosition = CGFloat(2)
        let yStartPosition = calcHeightOfScreen() - 66
        
        buildRow(boxesInRow: boxesInBase, xStart: xStartPosition, yStart: yStartPosition)
    }
    func box(x: CGFloat, y: CGFloat) {
        let box = UIView()
        box.frame.size.width = 64
        box.frame.size.height = 64
        box.frame.origin.x = x
        box.frame.origin.y = y
        box.backgroundColor = .cyan
        view.addSubview(box)
    }
    func buildRow(boxesInRow: Int, xStart: CGFloat, yStart: CGFloat) {
        if boxesInRow < 1 {
            return
        }
        var boxesInRow = boxesInRow
        var xPosition = xStart
        var yPosition = yStart
        box(x: xPosition, y: yPosition)
        for _ in 1..<boxesInRow {
            xPosition = xPosition + 66
            box(x: xPosition, y: yPosition)
        }
       boxesInRow = boxesInRow - 1
        xPosition = xStart + 64/2
        yPosition = yStart - 66
        
        buildRow(boxesInRow: boxesInRow, xStart: xPosition, yStart: yPosition)

    }
    func countBoxesInBase() -> Int {
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        let boxNumber = (screenWidth - 2) / (64 + 2)
        return Int(boxNumber)
    }
    func calcHeightOfScreen() -> CGFloat {
        let screenRect = UIScreen.main.bounds
        let screenHeight = screenRect.size.height
        return screenHeight
    }


}


