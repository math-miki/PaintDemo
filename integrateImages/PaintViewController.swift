//
//  PaintViewController.swift
//  integrateImages
//
//  Created by 高橋幹 on 2017/05/27.
//  Copyright © 2017年 高橋幹. All rights reserved.
//

import UIKit

class PaintViewController: UIViewController {

    @IBOutlet weak var canvasView: CanvasImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveAsImage(_ sender: Any) {
        
        UIGraphicsBeginImageContextWithOptions(canvasView.frame.size, true, 0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0,y: 0)
        canvasView.layer.render(in: context)
        let renderedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(renderedImage, self, #selector(self.showResultOfSaveImage(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    func showResultOfSaveImage(_ image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
        
        var title = "保存完了"
        var message = "カメラロールに保存しました"
        
        if error != nil {
            title = "エラー"
            message = "保存に失敗しました"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
