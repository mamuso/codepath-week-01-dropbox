//
//  CreateAccountFormViewController.swift
//  codepathDropboxWeek1
//
//  Created by mmuno on 9/18/15.
//  Copyright © 2015 Manuel Muñoz Solera. All rights reserved.
//

import UIKit

class CreateAccountFormViewController: UIViewController {

    @IBOutlet weak var passwordIndicator: UIView!
    @IBOutlet weak var passwordIndicatorWeak: UIView!
    @IBOutlet weak var passwordIndicatorMeh: UIView!
    @IBOutlet weak var passwordIndicatorGood: UIView!
    @IBOutlet weak var passwordIndicatorGreat: UIView!
    @IBOutlet weak var passwordIndicatorLabel: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // self.navigationController?.navigationBar.hidden = false
        
        // Border Bottom for the password field
        let bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, passwordIndicator.frame.height - 0.5, passwordIndicator.frame.width, 1.0)
        bottomLine.backgroundColor = UIColor.init(red: 200/255, green: 199/255, blue: 204/255, alpha: 0.8).CGColor
        passwordIndicator.layer.addSublayer(bottomLine)
        
        // Observing password field?
        passwordTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidChange(textField: UITextField) {
        print(textField.text?.characters.count)
        if(textField.text?.characters.count > 0) {
            // Bars
            animateAlpha(passwordIndicator, alphaValue: 1)
            animateAlpha(passwordIndicatorWeak, alphaValue: 1)
            animateAlpha(passwordIndicatorMeh, alphaValue: (textField.text?.characters.count > 3 ? 1 : 0))
            animateAlpha(passwordIndicatorGood, alphaValue: (textField.text?.characters.count > 5 ? 1 : 0))
            animateAlpha(passwordIndicatorGreat, alphaValue: (textField.text?.characters.count > 8 ? 1 : 0))
            
            // Label
            if textField.text?.characters.count > 0 {
                passwordIndicatorLabel.text = "Weak"
                passwordIndicatorLabel.textColor = UIColor(red: 245/255, green: 32/255, blue: 21/255, alpha: 1)
            }
            if textField.text?.characters.count > 3 {
                passwordIndicatorLabel.text = "So-So"
                passwordIndicatorLabel.textColor = UIColor(red: 248/255, green: 138/255, blue: 33/255, alpha: 1)
            }
            if textField.text?.characters.count > 5 {
                passwordIndicatorLabel.text = "Good"
                passwordIndicatorLabel.textColor = UIColor(red: 253/255, green: 203/255, blue: 0, alpha: 1)
            }
            if textField.text?.characters.count > 8 {
                passwordIndicatorLabel.text = "Great!"
                passwordIndicatorLabel.textColor = UIColor(red: 0, green: 192/255, blue: 0, alpha: 1)
            }
            
        } else {
            animateAlpha(passwordIndicator, alphaValue: 0)
        }
    }
    
    func animateAlpha(viewElement: UIView, alphaValue: CGFloat) {
        UIView.animateWithDuration(0.3, animations: {
            viewElement.alpha = alphaValue
        })

    }

    @IBAction func openActionSheet(sender: AnyObject) {
        let refreshAlert = UIAlertController(title: "", message: "Before you can complete your registration, you must accept the Dropbox Terms of Service.", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        refreshAlert.addAction(UIAlertAction(title: "I Agree", style: .Default, handler: { (action: UIAlertAction!) in
            _ = "ok"
            self.performSegueWithIdentifier("emptyCaseSegue", sender: self)
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "View Terms", style: .Default, handler: { (action: UIAlertAction!) in
            let vc = self.storyboard!.instantiateViewControllerWithIdentifier("PopoverViewController")
            vc.modalPresentationStyle = UIModalPresentationStyle.Popover
            let popover: UIPopoverPresentationController = vc.popoverPresentationController!
            popover.barButtonItem = sender as? UIBarButtonItem
            self.presentViewController(vc, animated: true, completion:nil)

        }))
        
        presentViewController(refreshAlert, animated: true, completion: nil)
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
