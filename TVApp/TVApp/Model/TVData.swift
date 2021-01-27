//
//  SampleData.swift
//  TVApp
//
//  Created by herb.salt on 2021/01/26.
//  Copyright © 2021 com.kakaocorp. All rights reserved.
//

import Foundation
import UIKit

protocol TVDataProtocol {
    var originalTVs: [OriginalTV] { get }
    var liveTVs: [LiveTV] { get }
}

class TVData: TVDataProtocol {
    
    private(set) var originalTVs: [OriginalTV]
    private(set) var liveTVs: [LiveTV]
    
    init() {
        
        originalTVs = [OriginalTV]()
        liveTVs = [LiveTV]()
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
