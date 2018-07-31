//
//  EventVC.swift
//  NSA-TODO
//
//  Created by Tunc Tugcu on 31.07.2018.
//  Copyright © 2018 Tunc Tugcu. All rights reserved.
//

import UIKit

protocol EventVCDelegate: AnyObject {
    func didFinishWith(event: Event?)
}

class EventVC: MainVC {
    
    @IBOutlet private weak var topicTextField: UITextField!
    @IBOutlet private weak var descTextField: UITextField!
    @IBOutlet private weak var picker: UIDatePicker?
    
    private var viewModel: EventViewModel?
    
    weak var delegate: EventVCDelegate?
    
    init(viewModel: EventViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func rightBarButtonItems() -> [UIBarButtonItem] {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        
        return [barButtonItem]
    }
    
    @objc private func donePressed() {
        guard let topic = topicTextField.text,
            let desc = descTextField.text,
            !topic.isEmpty, !desc.isEmpty
            else { delegate?.didFinishWith(event: nil); return}
        
        delegate?.didFinishWith(event: Event.build(topic: topic, desc: desc))
    }
}
