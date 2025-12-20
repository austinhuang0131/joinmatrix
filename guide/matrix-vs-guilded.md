---
title: Matrix vs. Guilded
layout: page-two-col
nav: false
parent: guide
permalink: guide/matrix-vs-guilded/
description: Imagine a place where users are actually respected. Join Matrix, the federated chat platform that does exactly that.
order: 5
---

## Matrix vs. Guilded

Thank you for considering Matrix. Many Discord users have migrated to Guilded after their accounts or communities have been shut down, but this is not recommended, explained below.

Matrix has been a popular alternative to Guilded, but many people still don't get the why. We will start with why you should join Matrix, followed by comparisons of specific feature and some helpful tips. But before we do that, let's start with...

## A Discussion on the Proper Definition of "Server"

Recall the computing [definition](https://en.wiktionary.org/wiki/server#Noun) of the word "server":

> 1. A program that provides services to other programs or devices, either in the same computer or over a computer network.
>
> 2. A computer dedicated to running such programs.

The definitions can hold true for a server for a multiplayer game (eg. Minecraft), a server reserved for a group of people for communication (eg. Mumble & TeamSpeak), and a server where Guilded bots are being operated from. In each case, the server software (such as the Minecraft server jar file) meets definition #1, whereas the server infrastructure (eg. VPS) meets definition #2.

But that's not the case for a Guilded "server": it's just some data, together with data of other "servers," resting on Guilded's computational servers. A Guilded "server" is not a program on its own, nor has any computational infrastructure been dedicated to any specific "server," thus violating both definitions. Presumably to attract gamers who often utilizes the correct "server" concept, Guilded attempts to equate it to a chat group, muddying the waters for the definition of this technical term. (Hence Guilded refers to "servers" as *teams* in API documentations.)

### What about Matrix?

In Matrix, a *homeserver* is a server, in that it meets both definitions: Dedicated infrastructures (definition #2) running [a server software](../#set-up-your-own-homeserver-or-join-an-existing-homeserver) (definition #1). Furthermore, these homeservers, while operated independently of each other and not under the control of a single entity, communicate (transmitting messages and such) with each other using an agreed-upon protocol, thereby keeping the Matrix platform alive. Platforms that use such structure, such as Matrix, [fediverse](https://fediverse.party/en/fediverse) and email, are called federated platforms.

## Why not Guilded?

In the scope of this guide, the key reasons to join Matrix as an ex-Guilded user are:

* **Lack of privacy for private communications**, as private conversations are not only unencrypted, but also actively scanned.
* **Closed source**, thus cannot be independently inspected.
* **Lack of control for private data and no guarantee on reliability**, as Guilded is centralized, not federated. See [here](../matrix-vs-al/#centralized-platforms).
* **Client-server API had serious performance issues**. This is verified by Guilded, has not been resolved despite several attempts. A Guilded channel causes ten times as much data to be retrieved as a similar Matrix room does.
* **Guilded did not allow deleting user accounts initially**. Prior to June 2021, it was not possible to delete Guilded user accounts; they instead advised to just stop using Guilded.
* **Guilded was owned by Roblox**.
 
[Matrix addresses all of the above](../#why-matrix).

### Special Note

Matrix uses free software for its server and client softwares.

## Terminologies

### Channel & DMs vs. Room

In Guilded, a place that allows sending text messages is called a channel (if belongs to a "server") or a DM.

In Matrix, a place that allows sending text messages is called a room.

### "Server" vs. Space

In Guilded, text channels that are not DMs must be associated with a "server." Thus a "server" can be understood as a collection of channels that share certain settings.

In Matrix, rooms *can* be included in a Space. A Space can be used in similar fashion to a Discord "server" (controlled by the admins of the constituent rooms) or a "server" folder (controlled by anyone). A Space may also include another Space. Rooms do not share settings with Spaces, although rooms can require Space membership for joining.

## Feature comparison

Note that Matrix does not (and cannot, due to its decentralized nature) paywall features.

| Feature | Guilded | Matrix |
| ------- | ------- | ------ |
| **Registration** | Required Roblox account since April 2024. Shut down in December 2025. | Depending on homeserver (especially if you're running your own), **email may be optional**, and phone number is usually optional. There is no *automated* human check after registration. |
| Price | Free. No longer available since 5:20 UTC, December 19, 2025. | Free for [most homeservers](../../servers) (but please consider donating to them). Hosting a private homeserver may also incur cost (could be [free](https://matrix.org/docs/guides/free-small-matrix-server)). Note that paying (not donation) only affects where your data is hosted and (to a much lesser degree) server performance; it has no effect on features. |
| **Username** | Users were identified by display name (maximum 32 characters) to fellow users, and user UUIDs and roblox user IDs for programming purposes. | Users are identified by their MXID (eg. `@alice:example.com`), composed of the username (must be ASCII characters, upper case letters are not allowed) and the server name (not exceeding 255 characters when combined, including the introducing at symbol and the colon separating the parts). A display name can be optionally added (up to ~65200 bytes)[^7]. |
| Avatar | Was static, maximum 25 MB. None of avatars retriavable after platform shutdown. | **See "Attachments" for limits.** Can be zoomed (at least in Element/SchildiChat), in which case the avatar will be shown in the uploaded definition. Animated avatars are **supported**. |
| Profile description and background | **Was supported**. | Not supported currently, will be supported using profile rooms. |
| Profile status | **Was supported**. Guilded even had a custom status generator. | Effectively not supported[^1]. |
| Nicknames[^2] | **Never supported**. | **Supported** (`/myroomnick`). Up to ~65200 bytes. |
| Forum channels | Was supported. | Can be implemented as spaces (`m.space`) if each subthread is created as a room. |
| Media-only channels | Was supported. | Not supported. |
| Specific avatars[^2] | **Never supported**. | [**Supported**](../features/#attachments) (`/myroomavatar`). See "Attachments" for limits. |
| 2FA | Email or TOTP were supported. | Not required for login, but required (QR code, emoji verification, or Security Key) for viewing past encrypted messages. |
| **Text messages** | Maximum 36608 characters (main body section could have up to 4000 characters, the rest had to be placed in the embed cards). Formatted in Markdown. History lost after platform shutdown. | **Up to ~65200 bytes (up to ~25260 bytes if a formatted message with plain text fallback sent).[^7] [Supports Markdown and HTML.](../features/#text)** |
| Attachments | Allowed maximum 500 MB (25 MB for still images), limited to multimedia and document filetypes[^9]. None of attachments reachable after platform shutdown. | **Maximum 50~100 MB, no artificial file type limitations** (for most homeservers; customizable if you run your own homeserver). |
| Reactions | Only emotes (Unicode or custom ones) were possible. | Unicode emotes and [text](../features/#reactions). |
| Stickers | **Never supported**. | **Unlimited with setup.** See [here](../features/#stickers). |
| Public read receipts | Never supported. | **Supported.** |
| **Direct messages** | Never end-to-end encrypted. History lost after platform shutdown. | **Encrypted by default**, including VoIP. |
| Starting a DM | Depended on privacy settings of the recipient. Friendship and/or mutual "servers" could be required by the recipient. | Initiating a DM solely requires the recipient to accept the request[^3]. Users can leave DMs anytime they wish. |
| **Group chats** | A channel wass associated with a "server." You can only join 100 "servers" and own 20 at a time. | A room is standalone, but can be optionally included and associated with a Space, which is just a room linking to other rooms. You can join **unlimited** amount of rooms. |
| VoIP in groups | Was supported. | Real-time data using WebRTC, signalling using room state. |
| Organizing chats | Channels in a "server" could only be organized by the "server" owner and moderators with "manage channels" permission, in a many to one fashion into categories and groups, and could not be moved to another "server" or group once created. A team could have up to 100 groups in it, with up to 350 channels in each. | Rooms can be included within an unlimited amount of Spaces. Spaces may also include other Spaces (similar to Guilded's channel categories and groups). |
| Group chat privacy | You could deny new members from reading messages prior to them being invited / joining. Private threads were only visible to their own members and group/team members with "moderator access" permission to that channel. Teams could choose to make their chat history public, with per-channel granularity. | You may deny new members from reading messages prior to them being invited / joining. You may also allow or deny guest access (such as [Matrix Static](http://view.matrix.org/)) from reading messages. You may also enable encryption[^4]. |
| Publicity | Team URLs were first come first served. Teams were searchable by name unless explicitly disabled. | Each homeserver has a room directory which anyone in that homeserver may publish to. Room aliases are usually first come, first served. |
| Invite | Was done through generating invite or application links, or through shareable addresses. | Through directly inviting users, or through shareable [addresses](../features/#promotion). |
| Permissions in group chats | Was single-owner. How long did it take for you to learn role hierarchy? A "server" could only be shut down by its owner, and that affects everyone. Members cannot demote their own permissions. Roles of a member are reset when a member leaves hence do not survive rejoin. | Up to 2^54 power levels (-2^53 to 2^53-1, however I highly doubt you will *ever* reach that limit), with minimal permissions. In room versions 12 and later, the room creator and the users listed as co-creators are permanent owners, and have permanent full permission which cannot be decreased throughout the room's lifetime. A user acquires a permission if their power level is equal to or higher than the power level required for the specific permission. Rooms are not owned by any server, hence cannot usually forcibly be shut down without coordination. Members can demote their own permissions. Power levels of members survive leave and rejoin. |
| Size limits of group chats | No artificial limits, albeit current implementation behaves badly past approximately ten thousand members. | No artificial limits, albeit current implementations do not perform well with rooms having more than a few tens of thousands of members and a few dozens of homeservers. | 
| Bans | Bans were only visible to "server" moderators. One could also see their own ban when they attempt to join a "server", but not the ban reason. | Bans are public to all members, along with the reasons. |
| Disabled and deleted account handling | Deleting an account was irreversible. Messages sent to a "server" from deleted accounts stayed unless explicitly removed by somebody else. User name and user settings from deleted accounts are removed.  "Servers" owned by accounts deleted by T&S were automatically shut down. "Servers" owned by a manually deleted account is not possible to exist as the account delete API had a precondition of no "server" ownership at the time of the request. All accounts have been deleted after platform shutdown. |  Disabling an account is usually irreversible. Users can cause their messages to be forgotten while disabling their account: in that case, their messages are not sent to further users and servers. Rooms created by disabled accounts stay. |
| **Running a bot** | Public bot API existed, self-botting was tolerated as long as it stayed within Guilded and did not propagate to Roblox the game. | You can run bots on any user accounts[^5] [^6]. Selfbotting is permitted (but be nice). |
| **Network access** | **IPv4 and IPv6 supported. This is still the case with platform shutdown page.** | **Most if not all homeservers participating in the public federation have IPv4 connectivity but IPv6 connectivity varies from homeserver to homeserver.** |


## Helpful Tips

* Your user colour is chosen by a hash function (varies by app) that takes in your MXID.

## Footnotes

[^1]: Element and SchildiChat has status available as a lab feature, but it is only visible to those who you have a DM with. Statuses are not encrypted.

[^2]: For Guilded "servers" and for Matrix rooms.

[^3]: Note that Matrix has no concept of "friends" or "contacts" per se, although the DM list can serve the same purpose. However, user-based contact ignoring exists on Matrix, using two different methods. The former method prevents any and all messages from reaching the recipient, and the latter method using policy rooms hides them client-side by interpreting an ignore list. The latter method is currently only available in Element as a labs feature.

[^4]: Enabling encryption is irreversible for security reasons. Note that it is pointless to enable encryption in a public room, with one exception: the case you want to have a persistent cryptographic trail of who read the messages. Furthermore, enabling encryption means users will not see messages before their invitation (if applicable) or their entry.

[^5]: Matrix has no distinction between user and bot accounts (nor is there any dependency between the two). Unless specifically exempted by the homeserver (not needed in most cases), bots have the same ratelimit as other users. In Element and SchildiChat, the user token of an account is available by accessing "User Settings" then "Help & About." When running an autonomous bot, please be courteous and indicate to others (in username or display name) that the account is a bot. Bots that want to control other user accounts need to create an application service, which needs to be approved by an administrator of the homeserver that the bot is using.

[^6]: If your app/bot is good, then [matrix.org would love to hear from you (with the potential possibility of featuring you on their blog)!](https://matrix.to/#/#thisweekinmatrix:matrix.org)

[^7]: Limited by Matrix event size limits. The current event size limit is specified to be 65536 bytes. Formatted message size limit assuming the formatted body takes approximately twice as much as plain text body.

[^8]: Most Matrix servers are known to keep the pre-redaction content of the event for a week, while immediately sending the redaction instruction to their fellow users. Again, redactions are basically a free-for-all matter.

[^9]: The client and the server rejects upload when you attempt to upload a disallowed file type.
