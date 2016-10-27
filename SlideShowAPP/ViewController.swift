//
//  ViewController.swift
//  SlideShowAPP
//
//  Created by Kan on 2016/10/17.
//  Copyright © 2016年 KanIshijima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
     let photos = ["img_001.jpg", "img_002.jpg", "img_003.jpg", "img_004.jpg"]
    var index = 0
    //上記はindexの変数は初めは０と定義
    var timer = NSTimer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named:photos[0])
        imageView.image = image
        //上記2行は写真をimageとして扱い、ナンバーを０として扱うという意味
            
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTapped(_:))))
        
      

          }
    @IBAction func next(sender: AnyObject) {
        index += 1
        //上記はindexを１づつアップさせる（次のボタンのアクション）
        if index == 4{
            index = 0
        }
        
        let image = UIImage(named:photos[index])
        imageView.image = image
        //上記２行は
        
    }
    
    @IBAction func back(sender: AnyObject) {
        
        index -= 1
        //上記はindexを１づつダウンさせる（戻るボタンのアクション）
        if index < 0{
            index = 3
        }
        let image = UIImage(named:photos[index])
        imageView.image = image
        //上記２行は

    }
    
    @IBAction func play(sender: AnyObject) {
        if timer.valid == true{
            timer.invalidate()
            playButton.setTitle("再生", forState: .Normal)
            nextButton.enabled = true
            backButton.enabled = true
            
        }else{
            timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(ViewController.onUpdate(_:)), userInfo: nil, repeats: true)
            playButton.setTitle("停止", forState: .Normal)
            nextButton.enabled = false
            backButton.enabled = false
        }
        


    }

    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func imageTapped(sender: UITapGestureRecognizer) {
        print(sender)
        
        presentViewController(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }
    
    //この後タイマー　時間計測用の変数.
    var cnt : Float = 0
    
    
    //NSTimerIntervalで指定された秒数毎に呼び出されるメソッド.
    func onUpdate(timer : NSTimer){
        
       next(timer)
    }
    
//
//        var barHeight: CGFloat = 0.0
//        var displayWidth: CGFloat = 0.0
//        var displayHeight: CGFloat = 0.0
//        var imageView: UIImageView!
//        var timer: NSTimer!
//        var slider: UISlider!
//        
//            
//            // statusbarの高さ取得
//            barHeight = UIApplication.sharedApplication().statusBarFrame.size.height
//            
//            // viewのサイズ取得
//            displayWidth = self.view.frame.width
//            displayHeight = self.view.frame.height
//            
//            // 一枚目の原稿を読み込む
//            let image:UIImage! = UIImage(named: photos[0])
//            // 画像のアスペクト比を出して横幅いっぱいに画像を表示する
//            let aspect:CGFloat = image.size.height / image.size.width
//            imageView = UIImageView(frame: CGRect(x: 0, y: barHeight + ((displayHeight - barHeight - displayWidth * aspect) / 2), width: displayWidth, height: displayWidth * aspect))
//            imageView.image = image;
//            self.view.addSubview(imageView)
//            
//            // Sliderを作成する.
//            slider = UISlider(frame: CGRectMake(0, 0, displayWidth*0.9, 20))
//            slider.layer.position = CGPointMake(displayWidth / 2, displayHeight - 30)
//            slider.backgroundColor = UIColor.whiteColor()
//            slider.layer.cornerRadius = 10.0
//            slider.layer.masksToBounds = false
//            
//            // 目盛の最小値と最大値を設定する.
//            slider.minimumValue = 0
//            slider.maximumValue = Float(manuscripts.count) - 1.0
//            
//            // Sliderの初期位置を設定する.
//            slider.value = 0
//            
//            // Sliderの現在位置より右のTintカラーを変える.
//            slider.maximumTrackTintColor = UIColor.grayColor()
//            
//            // Sliderの現在位置より左のTintカラーを変える.
//            slider.minimumTrackTintColor = UIColor.greenColor()
//            
//            // 値が変化した時
//            slider.addTarget(self, action: "onChangeValueSlider:", forControlEvents: UIControlEvents.ValueChanged)
//            // 指を付けた時
//            slider.addTarget(self, action: "timerStart:", forControlEvents: UIControlEvents.TouchUpInside)
//            // 指を離した時
//            slider.addTarget(self, action: "timerStop:", forControlEvents: UIControlEvents.TouchDown)
//            
//            self.view.addSubview(slider)
//            
//            timerInitialized()
//        }
//        
//        func didReceiveMemoryWarning() {
//            super.didReceiveMemoryWarning()
//        }
//        
//        func timerInitialized () {
//            timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("nextPage"), userInfo: nil, repeats: true)
//        }
//        
//        func timerStart (sender : UISlider) {
//            if (!timer.valid) {
//                timerInitialized()
//            }
//        }
//        
//        func timerStop (sender : UISlider){
//            if (timer.valid) {
//                timer.invalidate()
//            }
//        }
//        
//        // Sliderの値が変わった時に呼ばれるメソッド
//        func onChangeValueSlider(sender : UISlider){
//            let index = Int(sender.value)
//            
//            // 再びUIView処理済み画像を設定する.
//            imageView.image = UIImage(named: photos[index])
//            
//            // 再描画をおこなう.
//            imageView.setNeedsDisplay()
//        }
//        
//        func nextPage (){
//            slider.value++
//            onChangeValueMySlider(slider)
//        }
//


}