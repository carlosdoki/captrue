//
//  Dataservice.swift
//  Teste
//
//  Created by Carlos Doki on 07/04/19.
//  Copyright © 2019 Carlos Doki. All rights reserved.
//

import Foundation
import Firebase

let STORAGE_BASE = Storage.storage().reference()

class DataService {
    static let ds = DataService()

    // Storage References
    private var _REF_POST_IMAGES=STORAGE_BASE.child("post-pics")
    
    var REF_POST_IMAGES: StorageReference {
        return _REF_POST_IMAGES
    }
}
