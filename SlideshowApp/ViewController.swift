//
//  ViewController.swift
//  SlideshowApp
//
//  Created by タグチミツオ on 2024/10/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0
    var mode:Int = 1    // 再生順のモードセット
    var timer: Timer!   // スライドショーに使用するタイマーを宣言
    
    // スライドショーさせる画像の配列を宣言
    var imageArray:[UIImage] = [
        UIImage(named: "img01")!,
        UIImage(named: "img02")!,
        UIImage(named: "img03")!,
        UIImage(named: "img04")!
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = imageArray[0]
        start.setTitle("再生", for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        resultViewController.imageSet = imageArray[nowIndex]
    }
    // 再生ボタンを押した時の処理
    @IBAction func startSlide(_ sender: Any) {
        if (timer == nil) {
            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            // ボタンの名前を停止に変える
            start.setTitle("停止", for: .normal)
            //UIButtonを無効化
            nextButton.isEnabled = false
            backButton.isEnabled = false

        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()
            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil
            // ボタンの名前を再生に直しておく
            start.setTitle("再生", for: .normal)
            //UIButtonを有効化
            nextButton.isEnabled = true
            backButton.isEnabled = true
        }
     }

    @IBAction func next(_ sender: Any) {
        mode = 1
        changeImage()
    }
    
    @IBAction func back(_ sender: Any) {
        mode = 2
        changeImage()
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    @IBAction func imageTap(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: self )
    }
    
    //次の画像を表示
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        if (mode == 1){
            nowIndex += 1
        } else {
            nowIndex -= 1
        }
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        if (nowIndex == -1){
            nowIndex = nowIndex + imageArray.count
        }
        // indexの画像をstoryboardの画像にセットする
        image.image = imageArray[nowIndex]
    }
 
}

