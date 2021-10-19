//
//  SnackbarViewModel.swift
//  ContactEx
//
//  Created by ed on 10/19/21.
//

import Foundation
import UIKit
//View Models should be mustlu structs

typealias Handler = (() -> Void)
enum SnackbarViewType{
    case info
    case action(handler : Handler)
}

struct SnackbarViewModel{
    let type : SnackbarViewType
    let text : String // none optional
    let image : UIImage?
    
}


