//
//  PopoverViewController.swift
//  codepathDropboxWeek1
//
//  Created by mmuno on 9/21/15.
//  Copyright © 2015 Manuel Muñoz Solera. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
