//
//  SampleData.swift
//  TVApp
//
//  Created by herb.salt on 2021/01/26.
//  Copyright © 2021 com.kakaocorp. All rights reserved.
//

import Foundation
import UIKit

class SampleData {
    
    var originalTVs = [OriginalTV]()
    var liveTVs = [LiveTV]()
    
    init() {
        
        let decoder = JSONDecoder()
        if let originalData = NSDataAsset(name: "original", bundle: Bundle.main) {
            do {
                self.originalTVs = try decoder.decode([OriginalTV].self, from: originalData.data)
            } catch {
                print(error.localizedDescription)
            }
        }
        if let liveData = NSDataAsset(name: "live", bundle: Bundle.main) {
            do {
                self.liveTVs = try decoder.decode([LiveTV].self, from: liveData.data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
