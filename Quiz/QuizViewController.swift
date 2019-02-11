//
//  QuizViewController.swift
//  Quiz
//
//  Created by 川岸樹奈 on 2019/02/11.
//  Copyright © 2019年 juna.Kawagishi. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    var quizArrray = [Any]()
    var correctAnswer:Int = 0
    
    @IBOutlet var quizTextView: UITextView!
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    @IBOutlet var choiceButton4: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tmpArray = [Any]()
        
        tmpArray.append(["ぱーかーの今の体重は？", "65kg", "71kg", "77.8kg", "82kg", 3])
        tmpArray.append(["海星 これなんて読む？", "うに", "ホタテ", "ひとで", "かいせい", 3])
        tmpArray.append(["ASDF〇HJKL　〇に入るのは？", "G", "R", "M", "W", 1])
        tmpArray.append(["日Aスクールの開始時間は？", "10:00", "10:30", "11:00", "9:30", 2])
        tmpArray.append(["今年のSchoolの曲は？", "涙", "明日も", "GLORY", "リトルシンガー", 4])
        tmpArray.append(["「？」に入る食べ物は何？ ５÷２＝？", "にく", "ごはん", "さかな", "チキン", 2])

        //tmpArrayをそのままランダムに入れ替えれないのか
        while (tmpArray.count > 0) {
            let index = Int(arc4random()) % tmpArray.count
            quizArrray.append(tmpArray[index])
            tmpArray.remove(at: index)
        }
        
        choiceQuiz()
    }
    
    func choiceQuiz(){
        let tmpArray = quizArrray[0] as! [Any]
        quizTextView.text = tmpArray[0] as! String
        
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
        choiceButton4.setTitle(tmpArray[4] as? String, for: .normal)
    
    }
    
    @IBAction func choiceAnswer(sender: UIButton){ //sender
        let tmpArray = quizArrray[0] as! [Any]
        
        if tmpArray[5] as! Int == sender.tag {
            correctAnswer += 1
        }
        
        quizArrray.remove(at: 0)
        
        if quizArrray.count == 0{
            performSegueToResult()
        }else{
            choiceQuiz()
        }
    }
    
    func performSegueToResult(){
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
