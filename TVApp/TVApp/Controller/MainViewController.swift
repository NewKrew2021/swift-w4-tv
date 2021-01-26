//
//  ViewController.swift
//  TVApp
//
//  Created by 윤준수 on 2021/01/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let decoder = JSONDecoder()
        guard let json = NSDataAsset(name: "live") else {return}
        do {
            var datas: [LiveCell] = try decoder.decode([LiveCell].self, from: json.data)
            print(datas)
        }
        catch {
            print(error.localizedDescription)
        }
    }


}

