//
//  Event.swift
//  SwiftSlackBot
//
//  Created by Ruben Roques on 12/02/16.
//  Copyright © 2016 Ruben Roques. All rights reserved.
//



/**
Almost everything that happens in Slack will result in an event being sent to all connected clients.

- Hello: The client has successfully connected to the server.
- Message: A message was sent to a channel.
- UserTyping: A channel member is typing a message.
- ChannelMarked: Your channel read marker was updated.
- ChannelCreated: A team channel was created.
- ChannelJoined: You joined a channel.
- ChannelLeft: You left a channel.
- ChannelDeleted: A team channel was deleted.
- ChannelRename: A team channel was renamed.
- ChannelArchive: A team channel was archived.
- ChannelUnarchive: A team channel was unarchived.
- ChannelHistoryChanged: Bulk updates were made to a channel&#039;s history.
- DndUpdated: Do not Disturb settings changed for the current user.
- DndUpdatedUser: Do not Disturb settings changed for a team member.
- ImCreated: A direct message channel was created.
- ImOpen: You opened a direct message channel.
- ImClose: You closed a direct message channel.
- ImMarked: A direct message read marker was updated.
- ImHistoryChanged: Bulk updates were made to a DM channel&#039;s history.
- GroupJoined: You joined a private group.
- GroupLeft: You left a private group.
- GroupOpen: You opened a group channel.
- GroupClose: You closed a group channel.
- GroupArchive: A private group was archived.
- GroupUnarchive: A private group was unarchived.
- GroupRename: A private group was renamed.
- GroupMarked: A private group read marker was updated.
- GroupHistoryChanged: Bulk updates were made to a groups history.
- FileCreated: A file was created.
- FileShared: A file was shared.
- FileUnshared: A file was unshared.
- FilePublic: A file was made public.
- FilePrivate: A file was made private.
- FileChange: A file was changed.
- FileDeleted: A file was deleted.
- FileCommentAdded: A file comment was added.
- FileCommentEdited: A file comment was edited.
- FileCommentDeleted: A file comment was deleted.
- PinAdded: A pin was added to a channel.
- PinRemoved: A pin was removed from a channel.
- PresenceChange: A team member&#039;s presence changed.
- ManualPresenceChange: You manually updated your presence.
- PrefChange: You have updated your preferences.
- UserChange: A team member&#039;s data has changed.
- TeamJoin: A new team member has joined.
- StarAdded: A team member has starred an item.
- StarRemoved: A team member removed a star.
- ReactionAdded: A team member has added an emoji reaction to an item.
- ReactionRemoved: A team member removed an emoji reaction.
- EmojiChanged: A team custom emoji has been added or changed.
- CommandsChanged: A team slash command has been added or changed.
- TeamPlanChange: The team billing plan has changed.
- TeamPrefChange: A team preference has been updated.
- TeamRename: The team name has changed.
- TeamDomainChange: The team domain has changed.
- EmailDomainChanged: The team email domain has changed.
- TeamProfileChange: Team profile fields have been updated.
- TeamProfileDelete: Team profile fields have been deleted.
- TeamProfileReorder: Team profile fields have been reordered.
- BotAdded: An integration bot was added.
- BotChanged: An integration bot was changed.
- AccountsChanged: The list of accounts a user is signed into has changed.
- TeamMigrationStarted: The team is being migrated between servers.
- ReconnectUrl: Experimental.
- SubteamCreated: A user group has been added to the team.
- SubteamUpdated: An existing user group has been updated or its members changed.
- SubteamSelfAdded: You have been added to a user group.
- SubteamSelfRemoved: You have been removed from a user group.
- Unknown: Some unknown message type was received.
*/
enum Event {
    case Hello  //The client has successfully connected to the server
    case Message  //A message was sent to a channel
    case UserTyping  //A channel member is typing a message
    case ChannelMarked  //Your channel read marker was updated
    case ChannelCreated  //A team channel was created
    case ChannelJoined  //You joined a channel
    case ChannelLeft  //You left a channel
    case ChannelDeleted  //A team channel was deleted
    case ChannelRename  //A team channel was renamed
    case ChannelArchive  //A team channel was archived
    case ChannelUnarchive  //A team channel was unarchived
    case ChannelHistoryChanged  //Bulk updates were made to a channel&#039;s history
    case DndUpdated  //Do not Disturb settings changed for the current user
    case DndUpdatedUser  //Do not Disturb settings changed for a team member
    case ImCreated  //A direct message channel was created
    case ImOpen  //You opened a direct message channel
    case ImClose  //You closed a direct message channel
    case ImMarked  //A direct message read marker was updated
    case ImHistoryChanged  //Bulk updates were made to a DM channel&#039;s history
    case GroupJoined  //You joined a private group
    case GroupLeft  //You left a private group
    case GroupOpen  //You opened a group channel
    case GroupClose  //You closed a group channel
    case GroupArchive  //A private group was archived
    case GroupUnarchive  //A private group was unarchived
    case GroupRename  //A private group was renamed
    case GroupMarked  //A private group read marker was updated
    case GroupHistoryChanged  //Bulk updates were made to a groups history
    case FileCreated  //A file was created
    case FileShared  //A file was shared
    case FileUnshared  //A file was unshared
    case FilePublic  //A file was made public
    case FilePrivate  //A file was made private
    case FileChange  //A file was changed
    case FileDeleted  //A file was deleted
    case FileCommentAdded  //A file comment was added
    case FileCommentEdited  //A file comment was edited
    case FileCommentDeleted  //A file comment was deleted
    case PinAdded  //A pin was added to a channel
    case PinRemoved  //A pin was removed from a channel
    case PresenceChange  //A team member&#039;s presence changed
    case ManualPresenceChange  //You manually updated your presence
    case PrefChange  //You have updated your preferences
    case UserChange  //A team member&#039;s data has changed
    case TeamJoin  //A new team member has joined
    case StarAdded  //A team member has starred an item
    case StarRemoved  //A team member removed a star
    case ReactionAdded  //A team member has added an emoji reaction to an item
    case ReactionRemoved  //A team member removed an emoji reaction
    case EmojiChanged  //A team custom emoji has been added or changed
    case CommandsChanged  //A team slash command has been added or changed
    case TeamPlanChange  //The team billing plan has changed
    case TeamPrefChange  //A team preference has been updated
    case TeamRename  //The team name has changed
    case TeamDomainChange  //The team domain has changed
    case EmailDomainChanged  //The team email domain has changed
    case TeamProfileChange  //Team profile fields have been updated
    case TeamProfileDelete  //Team profile fields have been deleted
    case TeamProfileReorder  //Team profile fields have been reordered
    case BotAdded  //An integration bot was added
    case BotChanged  //An integration bot was changed
    case AccountsChanged  //The list of accounts a user is signed into has changed
    case TeamMigrationStarted  //The team is being migrated between servers
    case ReconnectUrl  //Experimental
    case SubteamCreated  //A user group has been added to the team
    case SubteamUpdated  //An existing user group has been updated or its members changed
    case SubteamSelfAdded  //You have been added to a user group
    case SubteamSelfRemoved  //You have been removed from a user group
    case Unknown  //Ho ho
}

func eventForMessageType(messageType:String) -> Event {
    switch messageType {
    case "hello" : return .Hello
    case "message" : return .Message
    case "user_typing" : return .UserTyping
    case "channel_marked" : return .ChannelMarked
    case "channel_created" : return .ChannelCreated
    case "channel_joined" : return .ChannelJoined
    case "channel_left" : return .ChannelLeft
    case "channel_deleted" : return .ChannelDeleted
    case "channel_rename" : return .ChannelRename
    case "channel_archive" : return .ChannelArchive
    case "channel_unarchive" : return .ChannelUnarchive
    case "channel_history_changed" : return .ChannelHistoryChanged
    case "dnd_updated" : return .DndUpdated
    case "dnd_updated_user" : return .DndUpdatedUser
    case "im_created" : return .ImCreated
    case "im_open" : return .ImOpen
    case "im_close" : return .ImClose
    case "im_marked" : return .ImMarked
    case "im_history_changed" : return .ImHistoryChanged
    case "group_joined" : return .GroupJoined
    case "group_left" : return .GroupLeft
    case "group_open" : return .GroupOpen
    case "group_close" : return .GroupClose
    case "group_archive" : return .GroupArchive
    case "group_unarchive" : return .GroupUnarchive
    case "group_rename" : return .GroupRename
    case "group_marked" : return .GroupMarked
    case "group_history_changed" : return .GroupHistoryChanged
    case "file_created" : return .FileCreated
    case "file_shared" : return .FileShared
    case "file_unshared" : return .FileUnshared
    case "file_public" : return .FilePublic
    case "file_private" : return .FilePrivate
    case "file_change" : return .FileChange
    case "file_deleted" : return .FileDeleted
    case "file_comment_added" : return .FileCommentAdded
    case "file_comment_edited" : return .FileCommentEdited
    case "file_comment_deleted" : return .FileCommentDeleted
    case "pin_added" : return .PinAdded
    case "pin_removed" : return .PinRemoved
    case "presence_change" : return .PresenceChange
    case "manual_presence_change" : return .ManualPresenceChange
    case "pref_change" : return .PrefChange
    case "user_change" : return .UserChange
    case "team_join" : return .TeamJoin
    case "star_added" : return .StarAdded
    case "star_removed" : return .StarRemoved
    case "reaction_added" : return .ReactionAdded
    case "reaction_removed" : return .ReactionRemoved
    case "emoji_changed" : return .EmojiChanged
    case "commands_changed" : return .CommandsChanged
    case "team_plan_change" : return .TeamPlanChange
    case "team_pref_change" : return .TeamPrefChange
    case "team_rename" : return .TeamRename
    case "team_domain_change" : return .TeamDomainChange
    case "email_domain_changed" : return .EmailDomainChanged
    case "team_profile_change" : return .TeamProfileChange
    case "team_profile_delete" : return .TeamProfileDelete
    case "team_profile_reorder" : return .TeamProfileReorder
    case "bot_added" : return .BotAdded
    case "bot_changed" : return .BotChanged
    case "accounts_changed" : return .AccountsChanged
    case "team_migration_started" : return .TeamMigrationStarted
    case "reconnect_url" : return .ReconnectUrl
    case "subteam_created" : return .SubteamCreated
    case "subteam_updated" : return .SubteamUpdated
    case "subteam_self_added" : return .SubteamSelfAdded
    case "subteam_self_removed" : return .SubteamSelfRemoved
    default : return .Unknown
    }
}
