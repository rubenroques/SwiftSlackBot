//
//  Event.swift
//  SwiftSlackBot
//
//  Created by Ruben Roques on 12/02/16.
//  Copyright © 2016 Ruben Roques. All rights reserved.
//



//Almost everything that happens in Slack will result in an Event being sent to all connected clients.
enum Event {
    case hello  //The client has successfully connected to the server
    case message  //A message was sent to a channel
    case userTyping  //A channel member is typing a message
    case channelMarked  //Your channel read marker was updated
    case channelCreated  //A team channel was created
    case channelJoined  //You joined a channel
    case channelLeft  //You left a channel
    case channelDeleted  //A team channel was deleted
    case channelRename  //A team channel was renamed
    case channelArchive  //A team channel was archived
    case channelUnarchive  //A team channel was unarchived
    case channelHistoryChanged  //Bulk updates were made to a channel&#039;s history
    case dndUpdated  //Do not Disturb settings changed for the current user
    case dndUpdatedUser  //Do not Disturb settings changed for a team member
    case imCreated  //A direct message channel was created
    case imOpen  //You opened a direct message channel
    case imClose  //You closed a direct message channel
    case imMarked  //A direct message read marker was updated
    case imHistoryChanged  //Bulk updates were made to a DM channel&#039;s history
    case groupJoined  //You joined a private group
    case groupLeft  //You left a private group
    case groupOpen  //You opened a group channel
    case groupClose  //You closed a group channel
    case groupArchive  //A private group was archived
    case groupUnarchive  //A private group was unarchived
    case groupRename  //A private group was renamed
    case groupMarked  //A private group read marker was updated
    case groupHistoryChanged  //Bulk updates were made to a groups history
    case fileCreated  //A file was created
    case fileShared  //A file was shared
    case fileUnshared  //A file was unshared
    case filePublic  //A file was made public
    case filePrivate  //A file was made private
    case fileChange  //A file was changed
    case fileDeleted  //A file was deleted
    case fileCommentAdded  //A file comment was added
    case fileCommentEdited  //A file comment was edited
    case fileCommentDeleted  //A file comment was deleted
    case pinAdded  //A pin was added to a channel
    case pinRemoved  //A pin was removed from a channel
    case presenceChange  //A team member&#039;s presence changed
    case manualPresenceChange  //You manually updated your presence
    case prefChange  //You have updated your preferences
    case userChange  //A team member&#039;s data has changed
    case teamJoin  //A new team member has joined
    case starAdded  //A team member has starred an item
    case starRemoved  //A team member removed a star
    case reactionAdded  //A team member has added an emoji reaction to an item
    case reactionRemoved  //A team member removed an emoji reaction
    case emojiChanged  //A team custom emoji has been added or changed
    case commandsChanged  //A team slash command has been added or changed
    case teamPlanChange  //The team billing plan has changed
    case teamPrefChange  //A team preference has been updated
    case teamRename  //The team name has changed
    case teamDomainChange  //The team domain has changed
    case emailDomainChanged  //The team email domain has changed
    case teamProfileChange  //Team profile fields have been updated
    case teamProfileDelete  //Team profile fields have been deleted
    case teamProfileReorder  //Team profile fields have been reordered
    case botAdded  //An integration bot was added
    case botChanged  //An integration bot was changed
    case accountsChanged  //The list of accounts a user is signed into has changed
    case teamMigrationStarted  //The team is being migrated between servers
    case reconnectUrl  //Experimental
    case subteamCreated  //A user group has been added to the team
    case subteamUpdated  //An existing user group has been updated or its members changed
    case subteamSelfAdded  //You have been added to a user group
    case subteamSelfRemoved  //You have been removed from a user group
    case unknown  //Ho ho
}

func eventForMessageType(_ messageType:String) -> Event {
    switch messageType {
    case "hello" : return .hello
    case "message" : return .message
    case "user_typing" : return .userTyping
    case "channel_marked" : return .channelMarked
    case "channel_created" : return .channelCreated
    case "channel_joined" : return .channelJoined
    case "channel_left" : return .channelLeft
    case "channel_deleted" : return .channelDeleted
    case "channel_rename" : return .channelRename
    case "channel_archive" : return .channelArchive
    case "channel_unarchive" : return .channelUnarchive
    case "channel_history_changed" : return .channelHistoryChanged
    case "dnd_updated" : return .dndUpdated
    case "dnd_updated_user" : return .dndUpdatedUser
    case "im_created" : return .imCreated
    case "im_open" : return .imOpen
    case "im_close" : return .imClose
    case "im_marked" : return .imMarked
    case "im_history_changed" : return .imHistoryChanged
    case "group_joined" : return .groupJoined
    case "group_left" : return .groupLeft
    case "group_open" : return .groupOpen
    case "group_close" : return .groupClose
    case "group_archive" : return .groupArchive
    case "group_unarchive" : return .groupUnarchive
    case "group_rename" : return .groupRename
    case "group_marked" : return .groupMarked
    case "group_history_changed" : return .groupHistoryChanged
    case "file_created" : return .fileCreated
    case "file_shared" : return .fileShared
    case "file_unshared" : return .fileUnshared
    case "file_public" : return .filePublic
    case "file_private" : return .filePrivate
    case "file_change" : return .fileChange
    case "file_deleted" : return .fileDeleted
    case "file_comment_added" : return .fileCommentAdded
    case "file_comment_edited" : return .fileCommentEdited
    case "file_comment_deleted" : return .fileCommentDeleted
    case "pin_added" : return .pinAdded
    case "pin_removed" : return .pinRemoved
    case "presence_change" : return .presenceChange
    case "manual_presence_change" : return .manualPresenceChange
    case "pref_change" : return .prefChange
    case "user_change" : return .userChange
    case "team_join" : return .teamJoin
    case "star_added" : return .starAdded
    case "star_removed" : return .starRemoved
    case "reaction_added" : return .reactionAdded
    case "reaction_removed" : return .reactionRemoved
    case "emoji_changed" : return .emojiChanged
    case "commands_changed" : return .commandsChanged
    case "team_plan_change" : return .teamPlanChange
    case "team_pref_change" : return .teamPrefChange
    case "team_rename" : return .teamRename
    case "team_domain_change" : return .teamDomainChange
    case "email_domain_changed" : return .emailDomainChanged
    case "team_profile_change" : return .teamProfileChange
    case "team_profile_delete" : return .teamProfileDelete
    case "team_profile_reorder" : return .teamProfileReorder
    case "bot_added" : return .botAdded
    case "bot_changed" : return .botChanged
    case "accounts_changed" : return .accountsChanged
    case "team_migration_started" : return .teamMigrationStarted
    case "reconnect_url" : return .reconnectUrl
    case "subteam_created" : return .subteamCreated
    case "subteam_updated" : return .subteamUpdated
    case "subteam_self_added" : return .subteamSelfAdded
    case "subteam_self_removed" : return .subteamSelfRemoved
    default : return .unknown
    }
}
