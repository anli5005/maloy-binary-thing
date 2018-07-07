//
//  ViewController.swift
//  Maloy Binary Thing
//
//  Created by Anthony Li on 7/7/18.
//  Copyright © 2018 Anthony Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let rows = 36
    let cols = 35
    
    var updateTimer: Timer!
    var updateInterval: TimeInterval = 0.05
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateTimer = Timer.scheduledTimer(timeInterval: updateInterval, target: self, selector: #selector(updateText(timer:)), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var maloyView: UITextView!
    var linescollect: [String] = [];
    
    @objc func updateText(timer: Timer) {
        if linescollect.count > rows {
            linescollect.remove(at: 0)
        }
        var line = ""
        for _ in 1...cols {
            line.append(String(arc4random_uniform(2)))
        }
        linescollect.append(line)
        maloyView.text = linescollect.joined(separator: "\n")
    }
    
}

