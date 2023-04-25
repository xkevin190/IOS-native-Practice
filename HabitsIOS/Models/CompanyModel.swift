//
//  CompanyModel.swift
//  HabitsIOS
//
//  Created by Kevin Velasco on 24/4/23.
//

import Foundation


struct Company: Codable {
    var _id: String?
    var company_goals: [CompanyGoal]
    var filter_category: [TypeContract]
    var used_quota: Int
    var random_activities: Bool
    var license_solicitude: Bool
    var name, key, start_date, exp_date: String
    var active: Bool
    var admin_email: String
    var quota: Int
    var type_contract: TypeContract?
    var picture: Picture?
    var slogan: String
    var logo: [Picture]?
    var createdAt, updatedAt: String
    var restart_monthly_points, email_activation: Bool
    var reference_change, timezone: String
    var custom_range_restart_points: Bool
    var generate_license_csv: Bool
    var wellnessChallengeDescription: String?
    var careCoinMonthly: Bool?
    var linkSpace: String?
    var licensesWithQr: Int?
    
}


struct TypeContract {
    var _id, name, description: String
    var key: Int
    var order: Int?
    var filter: [TypeContract]?
    var isVisible, use_only_for_user: Bool?
    var createdAt, updatedAt: String
    var is_visible_ranking, active: Bool?
}




// MARK: - CompanyGoal
struct CompanyGoal {
    var _id: String
    var goal: Goal
    var points, order: Int
    var active: Bool
    var related: String?
    var createdAt, updatedAt: String
    var group: Int
}


// MARK: - Goal
struct Goal {
        var _id: String
        var name, description: String
        var goal_type: TypeGoal
        var goal_total: Int
        var goal_category: TypeGoal
        var createdAt, updatedAt, createdBy: String
}

struct TypeGoal {
    let _id: String
    var name, description: String
    var key: Int?
    var createdAt, updatedAt: String
    var active: Bool?
    var utf8Flag: String?
}

extension Goal: Codable{}
extension TypeGoal: Codable{}
extension CompanyGoal: Codable{}
extension TypeContract: Codable{}



extension Company {
   static func initalState() -> Company {
        return Company(_id: nil, company_goals: [], filter_category: [], used_quota: 0, random_activities: false, license_solicitude: false, name: "", key: "", start_date: "", exp_date: "", active: false, admin_email: "", quota: 0, type_contract: nil, picture: nil, slogan: "", logo: nil, createdAt: "", updatedAt: "", restart_monthly_points: false, email_activation: false,  reference_change: "", timezone: "", custom_range_restart_points: false, generate_license_csv: false)
    }
}
