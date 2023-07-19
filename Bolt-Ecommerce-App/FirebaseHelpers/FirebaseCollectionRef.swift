//
//  FirebaseCollectionRef.swift
//  Bolt-Ecommerce-App
//
//  Created by ME-MAC on 7/6/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore


enum FCollectionRef: String {
    case user
    case recent
    case cartItems
}

func  firebaseReferance(_ collectionReferance: FCollectionRef) -> CollectionReference {
    return Firestore.firestore().collection(collectionReferance.rawValue)
}
