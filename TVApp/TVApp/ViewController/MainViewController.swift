//
//  ViewController.swift
//  TVApp
//
//  Created by 이청원 on 2021/01/25.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

//    func jsonParsing() {
//        var originals : [Original] = []
//        let jsonDecoder: JSONDecoder = JSONDecoder()
//        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: "live") else {return}
//
//        do {
//            originals = try jsonDecoder.decode([Original].self, from: dataAsset.data)
//            print(originals)
//        } catch let DecodingError.dataCorrupted(context) {
//            print(context)
//        } catch let DecodingError.keyNotFound(key, context) {
//            print("Key '\(key)' not found:", context.debugDescription)
//            print("codingPath:", context.codingPath)
//        } catch let DecodingError.valueNotFound(value, context) {
//            print("Value '\(value)' not found:", context.debugDescription)
//            print("codingPath:", context.codingPath)
//        } catch let DecodingError.typeMismatch(type, context)  {
//            print("Type '\(type)' mismatch:", context.debugDescription)
//            print("codingPath:", context.codingPath)
//        } catch {
//            print("error: ", error)
//        }
//    }
}

extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath)
        return cell
    }
    
    
}
