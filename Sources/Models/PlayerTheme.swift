//
// PlayerTheme.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct PlayerTheme: Codable, Hashable {

    /** The name of the player theme */
    public var name: String?
    /** RGBA color for timer text. Default: rgba(255, 255, 255, 1) */
    public var text: String?
    /** RGBA color for all controls. Default: rgba(255, 255, 255, 1) */
    public var link: String?
    /** RGBA color for all controls when hovered. Default: rgba(255, 255, 255, 1) */
    public var linkHover: String?
    /** RGBA color for the play button when hovered. */
    public var linkActive: String?
    /** RGBA color playback bar: played content. Default: rgba(88, 131, 255, .95) */
    public var trackPlayed: String?
    /** RGBA color playback bar: downloaded but unplayed (buffered) content. Default: rgba(255, 255, 255, .35) */
    public var trackUnplayed: String?
    /** RGBA color playback bar: background. Default: rgba(255, 255, 255, .2) */
    public var trackBackground: String?
    /** RGBA color: top 50% of background. Default: rgba(0, 0, 0, .7) */
    public var backgroundTop: String?
    /** RGBA color: bottom 50% of background. Default: rgba(0, 0, 0, .7) */
    public var backgroundBottom: String?
    /** RGBA color for title text. Default: rgba(255, 255, 255, 1) */
    public var backgroundText: String?
    /** enable/disable player SDK access. Default: true */
    public var enableApi: Bool?
    /** enable/disable player controls. Default: true */
    public var enableControls: Bool?
    /** enable/disable player autoplay. Default: false */
    public var forceAutoplay: Bool?
    /** enable/disable title. Default: false */
    public var hideTitle: Bool?
    /** enable/disable looping. Default: false */
    public var forceLoop: Bool?
    public var playerId: String
    /** When the player was created, presented in ISO-8601 format. */
    public var createdAt: Date?
    /** When the player was last updated, presented in ISO-8601 format. */
    public var updatedAt: Date?
    public var assets: PlayerThemeAssets?

    public init(name: String? = nil, text: String? = nil, link: String? = nil, linkHover: String? = nil, linkActive: String? = nil, trackPlayed: String? = nil, trackUnplayed: String? = nil, trackBackground: String? = nil, backgroundTop: String? = nil, backgroundBottom: String? = nil, backgroundText: String? = nil, enableApi: Bool? = nil, enableControls: Bool? = nil, forceAutoplay: Bool? = nil, hideTitle: Bool? = nil, forceLoop: Bool? = nil, playerId: String, createdAt: Date? = nil, updatedAt: Date? = nil, assets: PlayerThemeAssets? = nil) {
        self.name = name
        self.text = text
        self.link = link
        self.linkHover = linkHover
        self.linkActive = linkActive
        self.trackPlayed = trackPlayed
        self.trackUnplayed = trackUnplayed
        self.trackBackground = trackBackground
        self.backgroundTop = backgroundTop
        self.backgroundBottom = backgroundBottom
        self.backgroundText = backgroundText
        self.enableApi = enableApi
        self.enableControls = enableControls
        self.forceAutoplay = forceAutoplay
        self.hideTitle = hideTitle
        self.forceLoop = forceLoop
        self.playerId = playerId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.assets = assets
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case text
        case link
        case linkHover
        case linkActive
        case trackPlayed
        case trackUnplayed
        case trackBackground
        case backgroundTop
        case backgroundBottom
        case backgroundText
        case enableApi
        case enableControls
        case forceAutoplay
        case hideTitle
        case forceLoop
        case playerId
        case createdAt
        case updatedAt
        case assets
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(link, forKey: .link)
        try container.encodeIfPresent(linkHover, forKey: .linkHover)
        try container.encodeIfPresent(linkActive, forKey: .linkActive)
        try container.encodeIfPresent(trackPlayed, forKey: .trackPlayed)
        try container.encodeIfPresent(trackUnplayed, forKey: .trackUnplayed)
        try container.encodeIfPresent(trackBackground, forKey: .trackBackground)
        try container.encodeIfPresent(backgroundTop, forKey: .backgroundTop)
        try container.encodeIfPresent(backgroundBottom, forKey: .backgroundBottom)
        try container.encodeIfPresent(backgroundText, forKey: .backgroundText)
        try container.encodeIfPresent(enableApi, forKey: .enableApi)
        try container.encodeIfPresent(enableControls, forKey: .enableControls)
        try container.encodeIfPresent(forceAutoplay, forKey: .forceAutoplay)
        try container.encodeIfPresent(hideTitle, forKey: .hideTitle)
        try container.encodeIfPresent(forceLoop, forKey: .forceLoop)
        try container.encode(playerId, forKey: .playerId)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(assets, forKey: .assets)
    }
}

