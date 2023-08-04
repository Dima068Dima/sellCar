//
//  CarDetailsPresenterImp.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 03.08.2023.
//

import Foundation

final class CarDetailsPresenterImp: CarDetailsPresenter {
    private weak var view: CarDetailsView?
    private let carDetailsNetworkAPI = CarDetailsNetworkAPI()
    private var carId: String
    
    init(carId: String) {
        self.carId = carId
    }
    
    func loadDetailCar() {
        Task {
            do {
                let carPostResponse = try await carDetailsNetworkAPI.getPostCar(with: carId)
                await MainActor.run {
                    view?.update(with: carPostResponse)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func setView(view: CarDetailsView) {
        self.view = view
    }
}

// MARK: - View Model -

struct CarDetailsModel: Decodable {
    var uuid = UUID()
    
    let car: Car
    let user: OwnerDetails
}

struct Car: Decodable, Hashable {
    let id: Int
    let name: String
    let uin: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case uin = "place_id"
    }
}

struct OwnerDetails: Decodable, Hashable {
    let id: Int
    let username, email, about: String
    let avatar: Avatar
    let autoCount: Int
    let mainAutoName: String
    
    enum CodingKeys: String, CodingKey {
        case id, username, email, about, avatar
        case autoCount = "auto_count"
        case mainAutoName = "main_auto_name"
    }
}

struct Avatar: Decodable, Hashable {
    let url: String
}

extension CarDetailsModel: Hashable {
    static func == (lhs: CarDetailsModel, rhs: CarDetailsModel) -> Bool {
        lhs.uuid == rhs.uuid
    }
}

// MARK: - View Model To Get Posts -

struct Welcome: Codable {
    let posts: [Post]
    let user: User
}

// MARK: - Post
struct Post: Codable {
    let uuid = UUID()
    
    let id: Int
    let text: String
    let likeCount: Int
    let publicationDate: String
    let commentCount: Int
    let img: String?
    
    enum CodingKeys: String, CodingKey {
        case id, text
        case likeCount = "like_count"
        case publicationDate = "created_at"
        case commentCount = "comment_count"
        case img
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let username: String
    let avatar: AvatarModel
    let autoCount: Int
    let mainAutoName: String

    enum CodingKeys: String, CodingKey {
        case id, username, avatar
        case autoCount = "auto_count"
        case mainAutoName = "main_auto_name"
    }
}

// MARK: - Avatar
struct AvatarModel: Codable {
    let path: String
    let url: String
}

extension Post: Hashable {
    static func == (lhs: Post, rhs: Post) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
