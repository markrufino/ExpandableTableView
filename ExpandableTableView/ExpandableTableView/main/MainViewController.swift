//
//  MainViewController.swift
//  ExpandableTableView
//
//  Created by Mark on 24/08/2018.
//  Copyright © 2018 Mark. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainPresenter = MainPresenter()
    var colorViewModelArray: [ColorViewModel] = []
    var open: [Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initTableView()
        DispatchQueue.main.async {
            self.presenter.getColors({ (colorViewModelArray) in
                self.colorViewModelArray = colorViewModelArray
                self.colorViewModelArray.enumerated().forEach { _ in self.open.append(false) } // populate the open boolean array with the intial state of headers, which is closed.
                self.tableView.reloadData()
            })
        }
    }
    
    func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "default")
    }
    
    @objc func headerGestureHandler(_ recognizer: UITapGestureRecognizer) {
        let header = recognizer.view!
        let tag = header.tag
        open[tag] = !open[tag]
        tableView.reloadSections([tag], with: .automatic)
    }
    
    private func addTapGesture(for header: UIView, tag: Int) {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(headerGestureHandler(_:)))
        header.tag = tag
        header.isUserInteractionEnabled = true
        header.addGestureRecognizer(gesture)
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame = CGRect(x: 0, y: 0, width: 300, height: 44)
        let header = UILabel(frame: frame)
        let color = colorViewModelArray[section]
        header.backgroundColor = color.backGroundColor
        header.textColor = color.textColor
        header.text = color.headerTitle
        header.textAlignment = .center
        addTapGesture(for: header, tag: section)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 56
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return colorViewModelArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard open[section] else {
            return 0
        }
        return colorViewModelArray[section].numberedObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        let numberedObjectText = colorViewModelArray[indexPath.section].numberedObjects[indexPath.row]
        cell.textLabel?.text = numberedObjectText
        return cell
    }
}
