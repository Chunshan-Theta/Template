//
//  OnePage.swift
//  template
//
//  Created by Theta Wang on 2017/7/14.
//  Copyright © 2017年 Theta Wang. All rights reserved.
//

import UIKit

class OnePage: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        BulidLeader(LeftName: "Back",RightName: "Next",Title: "hello")
        
        
        // -------- initial cell --------
        // initial Cell
        tableView.register(Cell.self, forCellReuseIdentifier: "cellId")
        tableView.sectionHeaderHeight = 50
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // -------- make header --------
    // Set action of Right & Left Button
    func BulidLeader(LeftName:String="Left",RightName:String = "Right",Title:String = "Title") {
        
        // Left button
        let LeftButton = UIBarButtonItem(
            title: LeftName,
            style: UIBarButtonItemStyle.plain,
            target: self,
            action: #selector(self.LeftAction)
        )
        
        // Right button
        let RightButton = UIBarButtonItem(
            title: RightName,
            style: UIBarButtonItemStyle.plain,
            target: self,
            action: #selector(self.RightAction)
        )
        // add leader into navigationView
        navigationItem.title = Title
        navigationItem.leftBarButtonItem = LeftButton
        navigationItem.rightBarButtonItem = RightButton
        
        
    }
    func LeftAction(){
        print("This is Left Action")
    }
    func RightAction(){
        print("This is Right Action")
    }
    
    
    // -------- Defined cell action --------
    // There are four part you should setted.
    
    // First, Defined class named Cell (check bottom of this template)
    
    // Second, make "namelist" for cell ("namelist" was named "CellList" in the template)
    
    // Third, override two part.
    //   1.func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
    //     Make it to return count of namelist
    //   2.override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
    //     you should set detail of object of cell, like Identifier,label name and action button name
    
    // 4th,Setting Action of clicking button
    
    let CellList=["one","two","three","four","five"]
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CellList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath as IndexPath) as! Cell
        myCell.nameLabel.text = CellList[indexPath.row]
        myCell.actionButton.setTitle("Go", for: .normal)
        myCell.myTableViewController = self
        
        return myCell
    }
    
    // if cell was clicked , this method would startup via "handleAction".
    // you should check "override func tableView" if did not execute action
    // make sure that "cell.myTableViewController = self" is setted
    func CellAction(cell: UITableViewCell){
        //print data
        let index = tableView.indexPath(for: cell)?.row ?? 11
        print("Index:" + String(index))
    }
    
    
    
    //end of OnePage class
}

// -------- Defined cell--------
// add method named "CellAction" into TableView if you need,
// or edit handleAction method.
//
// Must Setting:
//  -- myTableViewController

class Cell: UITableViewCell {
    
    var myTableViewController: OnePage?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "initial Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("initial Name", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupViews() {
        addSubview(nameLabel)
        addSubview(actionButton)
        
        actionButton.addTarget(self, action: #selector(self.handleAction), for: .touchUpInside)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-8-[v1(80)]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel, "v1": actionButton]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": actionButton]))
        
    }
    
    func handleAction() {
        // click cell and execute action
        myTableViewController?.CellAction(cell:self)
        
    }
    
}
