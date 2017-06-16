//
//  ViewController.swift
//  Photo_Tap
//
//  Created by Khant Thu Linn on 6/16/17.
//  Copyright © 2017 DBS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SingleImageDelegate {

    @IBOutlet var tblListing: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "SingleImage", bundle: nil)
        tblListing.register(nib, forCellReuseIdentifier: "SingleImage")

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SingleImage", for: indexPath) as! SingleImage
        cell.delegate = self
        return cell
    }
    
    func getController() -> UIViewController {
        return self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
}

