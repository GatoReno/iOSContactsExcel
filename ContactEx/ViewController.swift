//
//  ViewController.swift
//  ContactEx
//
//  Created by ed on 10/18/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        //navigate
        self.performSegue(withIdentifier:"goToAddContact", sender: self)
    }
    
    @IBAction func snackButtonAction(_ sender: UIButton) {
        let viewModel: SnackbarViewModel
        let frame = CGRect(x: 0,
                           y: 0,
                           width: view.frame.size.width/1.5,
                           height: 60)
        
        viewModel = SnackbarViewModel(type: .info, text: "hey", image: nil)
        let snackbar = SnackbarView(viewModel: viewModel,frame: frame)
        showSnackbar(snackbar: snackbar)
       
    }
    public func showSnackbar(snackbar: SnackbarView){
        let w = view.frame.size.width/1.5
        let h = view.frame.size.height
        snackbar.frame = CGRect(x: (view.frame.size.width - w) / 2,
                                y: h,
                                width: w,
                                height: 60)
        view.addSubview(snackbar)
        
        UIView.animate(withDuration: 0.6, animations: {
            snackbar.frame = CGRect(x: (self.view.frame.size.width - w) / 2,
                                    y: h,
                                    width: w,
                                    height: 60)
        },completion: {done in
            if done{
                DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                    UIView.animate(withDuration: 0.6, animations: {
                        snackbar.frame = CGRect(x: (self.view.frame.size.width - w) / 2,
                                                y: h,
                                                width: w,
                                                height: 60)
                    },completion: {finished in
                        if finished{
                            snackbar.removeFromSuperview()
                        }
                    })
                })
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

