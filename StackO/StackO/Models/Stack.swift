//
//  Stack.swift
//  StackO
//
//  Created by Amanda Baret on 2021/04/10.
//

import Foundation

struct StackModel: Codable {

    let items: [Stack]

}

struct Stack: Codable {
    let tags: [String]
    let owner: Owner
    let is_answered: Bool?
    let view_count: Int?
    let answer_count: Int?
    let score: Int?
    let last_activity_date: Double?
    let creation_date: Double?
    let last_edit_date: Double?
    let question_id: Int?
    let content_license: String?
    let link: String?
    let title: String?
    let body: String?
}

struct Owner: Codable {
    let reputation: Int?
    let user_id: Int?
    let user_type: String?
    let accept_rate: Int?
    let profile_image: String?
    let display_name: String?
    let link: String?
}
