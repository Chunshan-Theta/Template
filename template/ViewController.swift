//
//  ViewController.swift
//  template
//
//  Created by Theta Wang on 2017/7/14.
//  Copyright © 2017年 Theta Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func GoToOne(_ sender: Any) {
        // go old test
        let vc = self.storyboard?.instantiateViewController(withIdentifier:"EntranceOfOne")
        self.present(vc!,animated: true,completion: nil)
    }

}

