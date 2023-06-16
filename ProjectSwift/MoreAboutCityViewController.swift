//
//  MoreAboutCityViewController.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 15/07/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit
import SDWebImage

class MoreAboutCityViewController: UIViewController {
    static var place: CommunityAndCities?
    var type : String?
    var listAttractions = [Attractions]()
    var listTracks = [Tracks]()
    var listGuidedTours = [GuidedTours]()
    var listFood = [Food]()
    @IBAction func buttonToMore(_ sender: UIButton) {
        let propertyToCheck : String
        propertyToCheck = sender.currentTitle!
        let storyBoard : UIStoryboard = UIStoryboard(name: "MoreAboutCity", bundle:nil)
        
        let secondViewController = storyBoard.instantiateViewController(withIdentifier: "detailsCity") as! DetailsCity
        switch propertyToCheck {
        case "מסלולים":
                type = "מסלולים"
                getTracks().readJsonHttp(city: (MoreAboutCityViewController.place?.getName())!) { (success, list) in
                    if success {
                        secondViewController.listTracks = list
                        secondViewController.type = self.type
                        self.present(secondViewController, animated:true, completion:nil)
                    }
            }
            
        case "אוכל":
                type = "אוכל"
                getFood().readJsonHttp(city: (MoreAboutCityViewController.place?.getName())!) { (success, list) in
                    if success {
                        secondViewController.listFood = list
                        secondViewController.type = self.type
                        self.present(secondViewController, animated:true, completion:nil)
                    }
            }
        case "סיורים מודרכים":
                type = "סיורים מודרכים"
                getGuidedTours().readJsonHttp(city: (MoreAboutCityViewController.place?.getName())!) { (success, list) in
                    if success {
                        secondViewController.listGuidedTours = list
                        secondViewController.type = self.type
                        self.present(secondViewController, animated:true, completion:nil)
                    }
            }
        case "אטרקציות":
                type = "אטרקציות"
                getAttractions().readJsonHttp(city: (MoreAboutCityViewController.place?.getName())!) { (success, list) in
                    if success {
                        secondViewController.listAttractions = list
                        secondViewController.type = self.type
                        self.present(secondViewController, animated:true, completion:nil)
                    }
            }
            default: break
       
        
        }
        UserDefaults.standard.set(self.type, forKey: "type")
    }
//    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var buttonTracks: UIButton!
    @IBOutlet weak var buttonGuidedTours: UIButton!
    @IBOutlet weak var buttonFood: UIButton!
    @IBOutlet weak var imageViewCity: UIImageView!
    @IBOutlet weak var buttonAttractions: UIButton!
    @IBOutlet weak var titleCity: UINavigationItem!
    let imgFolder = "https://motwebmediastg01.blob.core.windows.net/nop-thumbs-images/";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleCity.title = MoreAboutCityViewController.place?.getName()
        let imageCity1 = self.imgFolder + MoreAboutCityViewController.place!.getPicUrl()
        imageViewCity.sd_setImage(with: URL(string: imageCity1))
//       navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.largeTitleDisplayMode = .automatic
//transparent navigation bar
        self.navigationController?.navigationBar.transparentNavigationBar()
        
       

    }
    

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let dest = segue.destination as? DetailsCity
//            else {return}
//
//        //        guard let dest = segue.destination as? SearchCityTableViewController else {return}
//        //
//        print(place)
//        dest.place = place
//
//    }

}

extension UINavigationBar {
    func transparentNavigationBar() {
        self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
    }
}


