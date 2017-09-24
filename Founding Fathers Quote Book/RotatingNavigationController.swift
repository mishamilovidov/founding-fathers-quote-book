//
//  RotatingNavigationController.swift
//  Founding Fathers Quote Book
//
//  Created by Misha Milovidov on 9/24/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import UIKit

class RotatingNavigationController : UINavigationController {
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.all
    }
}
