//
//  AddViewController.swift
//  counter
//
//  Created by Carlos Cardona on 09/04/21.
//

import UIKit
import RxSwift
import RxRelay

class AddViewController: UIViewController {
    
    var modify: Observable<Int> {
        return modifySubject.asObserver()
    }
    
    private var modifySubject = PublishSubject<Int>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func addButtonClicked(_ sender: Any) {
        modifySubject.onNext(1)
        modifySubject.onCompleted()
    }
    
    
    @IBAction func minusButtonClicked(_ sender: Any) {
        modifySubject.onNext(-1)
        modifySubject.onCompleted()
    }
}
