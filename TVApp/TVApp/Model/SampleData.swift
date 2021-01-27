//
//  SampleData.swift
//  TVApp
//
//  Created by herb.salt on 2021/01/26.
//  Copyright © 2021 com.kakaocorp. All rights reserved.
//

import Foundation
import UIKit

class TVData {
    
    private var originalTVs = [OriginalTV]()
    private var liveTVs = [LiveTV]()
    
    init() {
        
        let decoder = JSONDecoder()
        if let originalData = NSDataAsset(name: "original", bundle: Bundle.main) {
            do {
                self.addOriginalData(ordiginalTVs: try decoder.decode([OriginalTV].self, from: originalData.data))
            } catch {
                print(error.localizedDescription)
            }
        }
        if let liveData = NSDataAsset(name: "live", bundle: Bundle.main) {
            do {
                self.addLiveData(liveTVs: try decoder.decode([LiveTV].self, from: liveData.data))
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    func addOriginalData(ordiginalTVs: [OriginalTV]) {
        for originalTV in originalTVs {
            self.originalTVs.append(originalTV)
        }
    }
    
    func addLiveData(liveTVs: [LiveTV]) {
        for liveTV in liveTVs {
            self.liveTVs.append(liveTV)
        }
    }
    
}
