//
//  MoreAboutCitySaveViewController.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 04/08/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit
import Firebase

class MoreAboutCitySaveViewController: UIViewController {
    
    @IBAction func buttonToMoreSave(_ sender: UIButton) {
        let propertyToCheck : String
        propertyToCheck = sender.currentTitle!
        let storyBoard : UIStoryboard = UIStoryboard(name: "MoreAboutCity", bundle:nil)
        
        let secondViewController = storyBoard.instantiateViewController(withIdentifier: "detailsCity") as! DetailsCity
       
        switch propertyToCheck {
        case "מסלולים":
            type = "מסלולים"
            getTracks().readJsonHttp(city: (MoreAboutCityViewController.place?.getName())!) { (success, list) in
                if success {
                    for track in list{
                        for trackName in self.listFavoriteNametTracks{
                            if track.Name == trackName{
                                self.listTracks.append(track)
                            }
                        }
                    }
                    secondViewController.listTracks = self.listTracks
                    secondViewController.type = self.type
                    self.present(secondViewController, animated:true, completion:nil)
                }
                
            }
        case "אוכל":
            type = "אוכל"
            getFood().readJsonHttp(city: (MoreAboutCityViewController.place?.getName())!) { (success, list) in
                if success {
                    for food in list{
                        for foodName in self.listFavoriteNametFood{
                            if food.Name == foodName{
                                self.listFood.append(food)
                            }
                        }
                    }
                    secondViewController.listFood = self.listFood
                    secondViewController.type = self.type
                    self.present(secondViewController, animated:true, completion:nil)
                }
            }
        case "סיורים מודרכים":
            type = "סיורים מודרכים"
            getGuidedTours().readJsonHttp(city: (MoreAboutCityViewController.place?.getName())!) { (success, list) in
                if success {
                    for guidedTours in list{
                        for guidedToursName in self.listFavoriteNametGuidedTours{
                            if guidedTours.Name == guidedToursName{
                                self.listGuidedTours.append(guidedTours)
                            }
                        }
                    }
                    secondViewController.listGuidedTours = self.listGuidedTours
                    secondViewController.type = self.type
                    self.present(secondViewController, animated:true, completion:nil)
                }
            }
        case "אטרקציות":
            type = "אטרקציות"
            getAttractions().readJsonHttp(city: (MoreAboutCityViewController.place?.getName())!) { (success, list) in
                if success {
                    for attraction in list{
                        for attractionName in self.listFavoriteNametAttractions{
                            if attraction.Name == attractionName{
                                self.listAttractions.append(attraction)
                            }
                        }
                    }
                    secondViewController.listAttractions = self.listAttractions
                    secondViewController.type = self.type
                    self.present(secondViewController, animated:true, completion:nil)
                }
            }
        default: break
            
            
        }
        UserDefaults.standard.set(self.type, forKey: "type")
    }
    
    @IBOutlet weak var buttonFood: UIButton!
    @IBOutlet weak var buttonTrack: UIButton!
    @IBOutlet weak var imageCitySave: UIImageView!
    
    @IBOutlet weak var buttonGuidedTours: UIButton!
    @IBOutlet weak var titleCitySave: UINavigationItem!
    @IBOutlet weak var buttonAttraction: UIButton!
    var type : String?
    var listAttractions = [Attractions]()
    var listTracks = [Tracks]()
    var listGuidedTours = [GuidedTours]()
    var listFood = [Food]()
    var place: CommunityAndCities?
    var listFavoriteNametAttractions = [String]()
    var listFavoriteNametFood = [String]()
    var listFavoriteNametGuidedTours = [String]()
    var listFavoriteNametTracks = [String]()
    
    let imgFolder = "https://motwebmediastg01.blob.core.windows.net/nop-thumbs-images/";
    override func viewDidLoad() {
        super.viewDidLoad()
        
      place = MoreAboutCityViewController.place
        titleCitySave.title = place?.Name
        let imageCity1 = self.imgFolder + MoreAboutCityViewController.place!.getPicUrl()
        imageCitySave.sd_setImage(with: URL(string: imageCity1))
        //       navigationController?.navigationBar.prefersLargeTitles = true
        //        navigationItem.largeTitleDisplayMode = .automatic
        //transparent navigation bar
        self.navigationController?.navigationBar.transparentNavigationBarSave()
        
        if Auth.auth().currentUser?.uid == nil{
            buttonFood.isHidden = true
            buttonGuidedTours.isHidden = true
            buttonTrack.isHidden = true
            buttonAttraction.isHidden = true
            let alert = UIAlertController(title: "שמור", message: "לא עשית LogIn לכן אי אפשר לגשת לדברים ששמרת", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "הבנתי", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let user = Auth.auth().currentUser?.uid
            let ref = Database.database().reference().child("users").child(user!).child("favorite").child((place?.getName())!)
            
            ref.child("מסלולים").observeSingleEvent(of: .value, with: { (snapshot) in
                let valueName = snapshot.childSnapshot(forPath: String(0))
                if valueName.value is NSNull{
                    self.buttonTrack.isHidden = true
                    return
                }else{
                    self.buttonTrack.isHidden = false
                }
                for i in 0...snapshot.childrenCount-1{
                    let username = snapshot.childSnapshot(forPath: String(i))
                    
                    if username.value is NSNull{
                        return
                    }
                    self.listFavoriteNametTracks.append(username.value as! String)
                    
                }
                
            })
            print(listFavoriteNametTracks.count)
            ref.child("אוכל").observeSingleEvent(of: .value, with: { (snapshot) in
                let valueName = snapshot.childSnapshot(forPath: String(0))
                if valueName.value is NSNull{
                    self.buttonFood.isHidden = true
                    return
                }else{
                    self.buttonFood.isHidden = false
                }
                for i in 0...snapshot.childrenCount-1{
                    let username = snapshot.childSnapshot(forPath: String(i))
                    
                    if username.value is NSNull{
                        return
                    }
                    self.listFavoriteNametFood.append(username.value as! String)
                    
                }
            })
            
            ref.child("אטרקציות").observeSingleEvent(of: .value, with: { (snapshot) in
                let valueName = snapshot.childSnapshot(forPath: String(0))
                if valueName.value is NSNull{
                    self.buttonAttraction.isHidden = true
                    return
                }else{
                    self.buttonAttraction.isHidden = false
                }
                for i in 0...snapshot.childrenCount-1{
                    let username = snapshot.childSnapshot(forPath: String(i))
                    
                    if username.value is NSNull{
                        return
                    }
                    self.listFavoriteNametAttractions.append(username.value as! String)
                    
                }
            })
            
            ref.child("סיורים מודרכים").observeSingleEvent(of: .value, with: { (snapshot) in
                let valueName = snapshot.childSnapshot(forPath: String(0))
                if valueName.value is NSNull{
                    self.buttonGuidedTours.isHidden = true
                    return
                }else{
                    self.buttonGuidedTours.isHidden = false
                }
                for i in 0...snapshot.childrenCount-1{
                    let username = snapshot.childSnapshot(forPath: String(i))
                    
                    if username.value is NSNull{
                        return
                    }
                    self.listFavoriteNametGuidedTours.append(username.value as! String)
                    
                }
                
            })
            
        }
    }
    
}
extension UINavigationBar {
    func transparentNavigationBarSave() {
        self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
    }
}
