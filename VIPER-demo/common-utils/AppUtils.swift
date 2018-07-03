//
//  AppUtils.swift
//  VIPER-demo
//
//  Created by Bipin on 7/3/18.
//  Copyright © 2018 Tootle. All rights reserved.
//

import Foundation
import UIKit


/* Show Progress Indicator */
func showProgressIndicator(view:UIView){
    
    view.isUserInteractionEnabled = false
    
    // Create and add the view to the screen.
    let progressIndicator = ProgressIndicator(text: "Please wait..")
    progressIndicator.tag = PROGRESS_INDICATOR_VIEW_TAG
    view.addSubview(progressIndicator)
    
}

/* Hide progress Indicator */
func hideProgressIndicator(view:UIView){
    
    view.isUserInteractionEnabled = true
    
    if let viewWithTag = view.viewWithTag(PROGRESS_INDICATOR_VIEW_TAG) {
        viewWithTag.removeFromSuperview()
    }
    
}
