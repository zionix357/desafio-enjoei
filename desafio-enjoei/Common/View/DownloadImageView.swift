//
//  DownloadImageView.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/20/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit
class DownloadImageView : UIImageView {
    let queue = OperationQueue()
    let mainQueue = OperationQueue.main
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setUrl(_ url: String, displayLoading: Bool = true) {
        setUrl(url, cache: true, displayLoading: displayLoading)
    }
    
    func setUrl(_ url: String, cache: Bool, displayLoading: Bool) {
        self.image = nil
        queue.cancelAllOperations()
        if displayLoading { displayLoadingIndicator(side: 50, text: "", backgroundColor: .white) }
        queue.addOperation( { self.downloadImg(url, cache: true) } )
    }
    
    func downloadImg(_ url: String, cache: Bool) {
        var data: Data!
        if(!cache) {
            data = try? Data(contentsOf: URL(string: url)!)
        } else {
            var path = StringUtils.replace(url, string: "/", withString: "_")
            path = StringUtils.replace(path, string: "\\", withString: "_")
            path = StringUtils.replace(path, string: ":", withString: "_")
            path = NSHomeDirectory() + "/Documents/" + path

            let exists = FileManager.default.fileExists(atPath: path)
            
            if(exists) {
                data = try? Data(contentsOf: URL(fileURLWithPath: path))
            } else {
                data = try? Data(contentsOf: URL(string: url)!)
                if(data != nil) {
                    try? data.write(to: URL(fileURLWithPath: path))
                    try? data.write(to: URL(fileURLWithPath: path), options: Data.WritingOptions.atomic)
                }
            }
        }
        
        if(data != nil) {
            mainQueue.addOperation( {self.showImg(data)} )
        }
    }
    
    func showImg(_ data: Data) {
        if(data.count > 0) {
            self.image = UIImage(data: data)
        }
        dismissLoadingIndicator()
    }
}
