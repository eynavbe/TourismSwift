//
//  ButtonTypeCollectionViewController.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 30/07/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit

private let reuseIdentifier = "buttonType"

class ButtonTypeCollectionViewController: UICollectionViewController {
var icons = [String]()
    var searching : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        var type: String?
        
        if UserDefaults.standard.string(forKey: "type") != nil {
            type = UserDefaults.standard.string(forKey: "type")
        }
        
        switch type {
        case "אטרקציות":
            icons = ["הכל", "מוזיאונים ותרבות", "פארקים וגנים", "חופים", "יקבים","אטרקציות חקלאיות","טבע ובעלי חיים","ארכיאולוגיה והיסטוריה","ספורט אתגרי","אתרים לאומיים","טבע ובעלי חיים","שווקים ומרכזי קניות","מקומות קדושים","מרכזי צפרות","סדנאות וחוויות"]
        case "מסלולים":
          icons = []
        case "אוכל":
           icons = ["הכל","טבעונית","בשר","מזרחית","דגים","יפנית","איטלקית","אסייתית","המבורגרים ומזון מהיר","צמחונית","תאילנדית","בית קפה","צרפתית","סינית","הודית","מאכלי עמים","תימנית"]
        case "סיורים מודרכים":
            icons = []
        default:
            break
        }
        
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return icons.count
    }
    @objc func buttonClicked(_ sender: UIButton) {
        searching = sender.title(for: .normal)
        UserDefaults.standard.set(searching, forKey: "searching")
//        DetailsCity().checkssssss(searchingBefore : searching!)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)  as! ButtonTypeCollectionViewCell
        cell.buttonTypeCell.setTitle(icons[indexPath.item], for: .normal)
        cell.buttonTypeCell.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
        return cell
    }
    
}
