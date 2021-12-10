//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Arslan Abdullaev on 07.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var number: Int = 0
    var round: Int = 1
    var points: Int = 0
    
    override func loadView() {
        super.loadView()
        print("LoadView")
        let labelVersion = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        labelVersion.text = "Version 1.1"
        self.view.addSubview(labelVersion)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
        print("ViewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewWillDisapear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewDidDisapear")
    }
    
    

    @IBAction func checkNumber() {
        
            let numSlider = Int(self.slider.value.rounded())
            if numSlider > self.number {
                self.points += 50 - numSlider + self.number
            } else if numSlider < self.number {
                    self.points += 50 - self.number + numSlider
                } else {
                    self.points += 50
                }
            if self.round == 5 {
                let alert = UIAlertController(title: "Game Over", message: "You have \(self.points) points", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Start Again", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.round = 1
                self.points = 0
            } else {
                self.round += 1
            }
            self.number = Int.random(in: 1...50)
            self.label.text = String(self.number)
            }
    
    @IBAction func showNextScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        self.present(secondViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func hideScreen() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
        }

