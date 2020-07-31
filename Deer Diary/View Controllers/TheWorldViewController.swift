//
//  TheWorldViewController.swift
//  Deer Diary
//
//  Created by jenny nuo on 7/30/20.
//  Copyright © 2020 jenny and clara. All rights reserved.
//

import UIKit

class TheWorldViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let eventName = ["Crisis in Yemen", "Portland Protests", "Justice for Breonna Taylor", "Hong Kong at Risk", "Uighur Concentration Camps"]
    
    let eventImage = [UIImage(named: "yemen"), UIImage(named: "portland"), UIImage(named: "breonna"), UIImage(named: "hongkong"), UIImage(named: "uighurs")]
    
    let eventDescription = ["A brutal civil war is ravaging Yemen even amid COVID-19. Its people are among the most vulnerable to war and sickness.", "Peaceful protestors and journalists in Portland, Oregon are being tear-gassed and arreseted by federal officers.", "It's been months since EMT Breonna Taylor was shot and killed by police. Her killers? They're still walking free.", "New security laws by China are upending the very definition of democracy in Hong Kong. The CCP is cracking down on liberties like never before.", "China doesn't want the world to know that it is running Muslim concentration camps in Xinjiang. "]
    
    
    @IBAction func learnBtnPressed(_ sender: UIButton) {
        if let url = URL(string: "https://issuesintheworld.carrd.co/") {
            UIApplication.shared.open(url)
        }

    }
        
    override func viewDidLoad() {
        super.viewDidLoad();
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EventCollectionViewCell
        
        cell.eventName.text = eventName[indexPath.row]
        cell.eventImage.image = eventImage[indexPath.row]
        cell.eventDescription.text = eventDescription[indexPath.row]
        
        cell.contentView.layer.cornerRadius = 25.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.white.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        
        return cell
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
