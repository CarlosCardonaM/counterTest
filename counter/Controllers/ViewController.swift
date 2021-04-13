//
//  ViewController.swift
//  counter
//
//  Created by Carlos Cardona on 09/04/21.
//

import UIKit
import RxSwift
import RxRelay

class ViewController: UIViewController {
    
    
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    private let counter = BehaviorRelay<Int>(value: 0)
    private let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        counter.subscribe(onNext: { [weak self] observer in
            
            self?.counterLabel.text = String(observer)
        }).disposed(by: bag)
        
    }

    @IBAction func addButtonClicked(_ sender: Any) {
        let addViewController = storyboard!.instantiateViewController(identifier: "AddViewController") as! AddViewController
        
        addViewController.modify.subscribe(onNext: { [weak self] one in
            guard let counter = self?.counter else { return }
            
            counter.accept(counter.value + one)
            
            do {
                try self?.context.save()
            } catch {
                
            }
            
        }, onCompleted: {
            print("Completed")
            self.navigationController?.popViewController(animated: true)
        }).disposed(by: bag)
         navigationController?.pushViewController(addViewController, animated: true)
    }
    
}

