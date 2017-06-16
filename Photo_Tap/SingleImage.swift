//
//  SingleImage.swift
//  Photo_Tap
//
//  Created by Khant Thu Linn on 6/16/17.
//  Copyright © 2017 DBS. All rights reserved.
//

import UIKit
import MWPhotoBrowser

@objc protocol SingleImageDelegate {
    @objc optional func getController() -> UIViewController
}

class SingleImage: UITableViewCell, MWPhotoBrowserDelegate {
    @IBOutlet var ivMain: UIImageView!

    let media = NSMutableArray()
    var delegate: SingleImageDelegate?

    @IBOutlet var btnTap: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        let photo =  MWPhoto.init(image: ivMain.image)
        media.add(photo!)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tapImage(_ sender: Any) {
        let browser = MWPhotoBrowser.init()
        browser.delegate = self
        let nav = UINavigationController.init(rootViewController: browser)
        self.delegate?.getController!().present(nav, animated: true, completion: nil)
    }
    
    func numberOfPhotos(in photoBrowser: MWPhotoBrowser!) -> UInt {
        return UInt(media.count)
    }

    func photoBrowser(_ photoBrowser: MWPhotoBrowser!, photoAt index: UInt) -> MWPhotoProtocol! {
        return media[Int(index)] as! MWPhotoProtocol
    }
}
