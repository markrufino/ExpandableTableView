//
//  MainPresenter.swift
//  ExpandableTableView
//
//  Created by Mark on 24/08/2018.
//  Copyright © 2018 Mark. All rights reserved.
//

import Foundation

class MainPresenter {
    
    func getColors(_ onSuccess: @escaping (([ColorViewModel]) -> Void)) {
        let colors = Repository().getSomeColors()
        onSuccess(colors.map { ColorViewModel(color: $0) })
    }
    
}
