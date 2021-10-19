//
//  SnackbarView.swift
//  ContactEx
//
//  Created by ed on 10/19/21.
//

import UIKit

class SnackbarView: UIView {
    
    let viewModel : SnackbarViewModel
    private var handler : Handler?
    
    private let label : UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    //init view and adding view elements
    init(viewModel : SnackbarViewModel, frame: CGRect){
        self.viewModel = viewModel
        super.init(frame: frame)
        
        addSubview(label)
        addSubview(imageView)
        //nothing overflow
        backgroundColor = .label
        clipsToBounds = true
        layer.cornerRadius = 8
        layer.masksToBounds = true
        
        
        configure()
    }
    
    
    //attaching gestures to view
    private func configure(){
        label.text = viewModel.text
        imageView.image = viewModel.image
        
        switch viewModel.type{
            
        case .action(let handler):
            self.handler = handler
            isUserInteractionEnabled = true
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapSelector))
            gesture.numberOfTapsRequired = 1
            gesture.numberOfTouchesRequired = 1
            addGestureRecognizer(gesture)
            
        case .info: break
        }
    }
    
    @objc private func didTapSelector(){
        handler?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if viewModel.image != nil
        {
            // label &  imge
            imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
            label.frame = CGRect(x: imageView.frame.size.width,
                                 y: 0,
                                 width: frame.size.width - imageView.frame.size.width,
                                 height: frame.size.height)
        }
        else{
            label.frame = bounds
        }
    }
    
}
