//
//  ViewController.swift
//  Calculator
//
//  Created by Kevin Lin MAC Air on 6/5/19.
//  Copyright © 2019 Kevin Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var displayNumber:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true
        {
            label.text = String(sender.tag)
            displayNumber = Double(label.text!)!
            performingMath = false
        }
        else
        {
            if sender.tag != 18
            {
                label.text = label.text! + String(sender.tag)
                displayNumber = Double(label.text!)!
            }
            else if sender.tag == 18
            {
                label.text = label.text! + "."
                displayNumber = Double(label.text!)!
            }
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 10 && sender.tag != 15
        {
            previousNumber = Double(label.text!)!
            
            if sender.tag == 11 //divide
            {
                label.text = "÷";
            }
            else if sender.tag == 12 //multiply
            {
                label.text = "X";
            }
            else if sender.tag == 13 //subtract
            {
                label.text = "-";
            }
            else if sender.tag == 14 //add
            {
                label.text = "+";
            }
            
            operation = sender.tag
            performingMath = true;
        }
        else if sender.tag == 15
        {
            if operation == 11
            {
                label.text = String(previousNumber / displayNumber)
            }
            else if operation == 12
            {
                label.text = String(previousNumber * displayNumber)
            }
            else if operation == 13
            {
                label.text = String(previousNumber - displayNumber)
            }
            else if operation == 14
            {
                label.text = String(previousNumber + displayNumber)
            }
        }
        else if sender.tag == 10
        {
            label.text = ""
            previousNumber = 0;
            displayNumber = 0;
            operation = 0;
        }
    }
    
    @IBAction func misc(_ sender: UIButton)
    {
        if label.text != ""
        {
            if sender.tag == 16
            {
                label.text = String(-displayNumber)
                displayNumber = Double(label.text!)!
            }
            else if sender.tag == 17
            {
                label.text = String(displayNumber/100)
                displayNumber = Double(label.text!)!
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

