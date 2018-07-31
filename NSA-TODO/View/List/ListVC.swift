//
//  ListVC.swift
//  NSA-TODO
//
//  Created by Tunc Tugcu on 31.07.2018.
//  Copyright © 2018 Tunc Tugcu. All rights reserved.
//

import UIKit

protocol ListVCProtocol: AnyObject {
    func addEventPressed()
    func editEventPressed(event: Event)
}

class ListVC: MainVC {

    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: ListVCProtocol?

    var viewModel: ListViewModel?
    
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "EventCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func rightBarButtonItems() -> [UIBarButtonItem] {
        let addButton = UIButton(type: .custom)
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(.orange, for: .normal)
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        addButton.sizeToFit()
        
        let barButtonItem = UIBarButtonItem(customView: addButton)
        
        return [barButtonItem]
        
    }
    
    @objc func addButtonPressed() {
        delegate?.addEventPressed()
    }
    
    
}

extension ListVC: ListViewModelViewProtocol {
    func refreshList() {
        tableView.reloadData()
    }
}

extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getNumberOfEvents() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
        guard let event = viewModel?.getEventForIndexPath(indexPath) else { return cell }
        cell.textLabel?.text = event.topic
        return cell
    }
}
