//
//  ImageModel.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 24/4/23.
//

import Foundation


// MARK: - Picture
struct Picture {
    var gdpr_user: Bool
    var _id: String
    var short_id, original_name, new_name: String
    var mimeType, uuid_firebase, firebase_path_folder: String
    var public_url_firebase: String
    var local_short_url: String
    var createdAt, updatedAt: String
    var local_url_download: String
    var aws_bucket, aws_key: String
}


extension Picture: Codable{}
extension Picture: Equatable{}
