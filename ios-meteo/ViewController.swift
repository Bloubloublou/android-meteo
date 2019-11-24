//
//  ViewController.swift
//  ios-meteo
//
//  Created by Christelle on 22/11/2019.
//  Copyright © 2019 b_lagouge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var apiCaller: ApiCaller!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiCaller = ApiCaller()
        apiCaller.updateForecasts(["Miramas","Valbonne","Grasse"])
    }


}

