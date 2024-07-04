---
title: Matrix vs. Discord
layout: page-two-col
nav: false
parent: guide
permalink: guide/matrix-vs-discord/
description: It's time to ditch Discord. Imagine a place where users are actually respected. Join Matrix, the federated chat platform that does exactly that.
order: 4
---

## Matrix vs. Discord

Thank you for considering Matrix.

Matrix has been a popular alternative to Discord, but many people still don't get the why. We will start with why you should move from Discord to Matrix, followed by comparisons of specific feature and some helpful tips. But before we do that, let's start with...

## A Discussion on the Proper Definition of "Server"

Recall the computing [definition](https://en.wiktionary.org/wiki/server#Noun) of the word "server":

> 1. A program that provides services to other programs or devices, either in the same computer or over a computer network.
>
> 2. A computer dedicated to running such programs.

The definitions can hold true for a server for a multiplayer game (eg. Minecraft), a server reserved for a group of people for communication (eg. Mumble & TeamSpeak), and a server where Discord bots are being operated from. In each case, the server software (such as the Minecraft server jar file) meets definition #1, whereas the server infrastructure (eg. VPS) meets definition #2.

But that's not the case for a Discord "server": it's just some data, together with data of other "servers," resting on Google's computational servers running the Discord server software. A Discord "server" is not a program on its own, nor has any computational infrastructure been dedicated to any specific "server,"[^13] thus violating both definitions. Presumably to attract gamers who often utilizes the correct "server" concept, Discord attempts to equate it to a chat group, muddying the waters for the definition of this technical term. (Hence Discord refers to "servers" as *guilds* in API documentations.)

### What about Matrix?

In Matrix, a *homeserver* is a server, in that it meets both definitions: Dedicated infrastructures (definition #2) running [a server software](../#set-up-your-own-homeserver-or-join-an-existing-homeserver) (definition #1). Furthermore, these homeservers, while operated independently of each other and not under the control of a single entity, communicate (transmitting messages and such) with each other using an agreed-upon protocol, thereby keeping the Matrix platform alive. Platforms that use such structure, such as Matrix, [fediverse](https://fediverse.party/en/fediverse) and email, are called federated platforms.

## Why not Discord?

I'm sure you can find a lot of valid criticisms of Discord, like [here](https://cadence.moe/blog/2020-06-06-why-you-shouldnt-trust-discord) or [here](https://austinhuang.me/discord-issues). Give them a read if you have time.

In the scope of this guide, the key reasons to move from Discord to Matrix are:

* **Lack of privacy for private communications**, as private conversations are not only unencrypted, but also actively scanned (scope of which depends on your settings, but some happen even when you disable all the filtering-related toggles). [People reported](https://www.reddit.com/r/discordapp/comments/t5v3of/viruses_now_get_turned_into_recipe_links_funny/) their messages were substituted with cooking recipes when they tried to send something that is considered a virus by Discord.
* **Excessive tracking**, such as the [science endpoint](https://luna.gitlab.io/discord-unofficial-docs/docs/science) and the process logger (for activity status)[^9].
* **Hostile stance against unofficial clients or client modifications**, thus preventing users from opting out of certain annoyances or tracking in a compliant way (even though users *tend not to* get banned for doing so).
* **Arbitrary phone number requirements**. Some users that are deemed suspicious and users that join certain "servers" are required to verify their phone number.
* Discord has made **decisions against the users' best interests**, with the most recent ones being:
  * Biased consultations and unilateral proposal of [cryptocurrency integrations](https://www.reddit.com/r/discordapp/comments/qpmhs5/discord_developers_please_do_not_support_nfts/) (which was only dropped after massive backlash); and
  * Deprecating access to read text messages in "servers" with certain exceptions[^11], effectively equating to mandatory rollout of application commands based interaction flow, as well as KYC requirements, for running bots in more than 100 "servers" (which were *not* dropped despite [backlash](https://gist.github.com/Rapptz/4a2f62751b9600a31a0d3c78100287f1)).
* **Closed source**, thus cannot be independently inspected.
* **Lack of control for private data and no guarantee on reliability**, as Discord is centralized, not federated. See [here](../matrix-vs-al/#centralized-platforms).
* **Paywalling richer expression abilities**.[^10] A user with Nitro unlocks certain additional features, mainly related to what can be included in a message, and twice as more guild cap, and twice as long message length limit.
* **Not intended for serious use**. A developer experience staff at Discord explicitly said, "We are just a casual chatting app." Marketing campaigns of Discord, such as inclusion of gaming related figures, and use of funny memes, seem to agree with that stance.
* **Uses AI.com products to police the platform**.
 
[Matrix addresses all of the above](../#why-matrix).

### Special Note

Matrix uses free software for its server and client softwares.

* Those who are using or are planning to use Discord's "Student Hub" feature should urge your institution's IT department or your student union to set up a Matrix homeserver, which allows greater flexibility for communication, while ensuring your privacy and agency are respected. [Germans are already using it.](https://doc.matrix.tu-dresden.de/en/why/)
* Open source communities should be aware that [using Discord is antithetical and discriminatory](https://drewdevault.com/2021/12/28/Dont-use-Discord-for-FOSS.html).

## Terminologies

### Channel & DMs vs. Room

In Discord, a place that allows sending text messages is called a channel (if belongs to a "server") or a DM.

In Matrix, a place that allows sending text messages is called a room.

### "Server" vs. Space

In Discord, text channels that are not DMs (including group DMs) must be associated with a "server." Thus a "server" can be understood as a collection of channels that share certain settings.

In Matrix, rooms *can* be included in a Space. A Space can be used in similar fashion to a Discord "server" (controlled by the admins of the constituent rooms) or a "server" folder (controlled by anyone). A Space may also include another Space. Rooms do not share settings with Spaces, although rooms can require Space membership for joining.

## Feature comparison

Note that Matrix does not (and cannot, due to its decentralized nature) paywall features.

| Feature | Discord | Matrix |
|---|---|---|
| **Registration** | Requires email. Discord may demand your phone number if it detects "suspicious activity." | Depending on homeserver (especially if you're running your own), **email may be optional**, and phone number is usually optional. There is no *automatically enforced* human check after registration. |
| Price | Free, with certain features paywalled. | Free for [most homeservers](../../servers) (but please consider donating to them). Hosting a private homeserver may also incur cost (could be [free](https://matrix.org/docs/guides/free-small-matrix-server)). Note that paying (not donation) only affects where your data is hosted and (to a much lesser degree) server performance; it has no effect on features. |
| **Username** | Users are identified by Twitter-like unique usernames (bots by display name (maximum 32 characters) + discriminator (4 randomly-assigned digits)) to fellow users, and user IDs (Around 19 digits) for programming purposes. Users are allowed to pick an additional Steam-like non-unique, Discord-wide displayname. | Users are identified by their email-like ID called MXID (eg. `@alice:example.com`), composed of a username (must be ASCII characters, upper case letters are not allowed) and the server name (not exceeding 255 characters when combined, including the introducing at symbol and the colon separating the parts). A display name can be optionally added (up to ~65200 bytes)[^6]. |
| Avatar | Static, maximum 8 MB. Cannot be zoomed unless using a bot or manually entering the URL to higher definition images, in which case the returned avatar has a maximum definition of 1024x1024. | **See "Attachments" for limits.** Can be zoomed (at least in Element/SchildiChat), in which case the avatar will be shown in the uploaded definition. Animated avatars are **supported**. |
| Profile description and background | **Supported**. | Not supported currently, will be supported using profile rooms. |
| Ability to read messages while offline | Official web and desktop clients artificially block viewing anything at all when it loses the real-time connection. No such limitation in official mobile clients. | Messages in client cache can be read without restriction. |
| Profile status | **Supported**. | Not supported. |
| Nicknames[^1] | Supported. Maximum 32 characters. | **Supported** (`/myroomnick`). Up to ~65200 bytes. |
| Specific avatars[^1] | Requires Nitro. | [**Supported**](../features/#attachments) (`/myroomavatar`). See "Attachments" for limits. |
| 2FA | Email, WebAuthn or SMS/TOTP. | Not required for login, but required (QR code, emoji verification, or Security Key) for viewing past encrypted messages. |
| **Text messages** | Maximum 2000 characters. Supports Markdown (with some modifications). | **Up to ~65200 bytes (up to ~21270 bytes if a formatted message with plain text fallback sent).[^6] [Supports Markdown and HTML.](../features/#text)** |
| Attachments | Maximum 50 MB (maximum 500 MB for users with Nitro tier 2, and also for all users in a "server" with boost tier 3). Discord Inc. has implemented hotlinking protection using expiring signatures. | Size limit depending on the server. **Maximum 50~100 MB** (for most homeservers; customizable if you run your own homeserver. However, users from the servers with smaller attachment limits will not be able to receive large attachments, as each homeserver receives a copy of the attachment). Attachments sent to end-to-end encrypted rooms are also sent encrypted (unless forwarded from an unencrypted room, in which case only the identifier will be encrypted). Other than that, no hotlinking protection. |
| Custom emotes in messages | Free users can only use static emotes defined within the "server". Using emojis from outside the "server" and using animated emojis are limited to Nitro users only. | It is possible to insert user-defined static emotes in messages, see [here](../features/#attachments). No support for animated emotes. |
| Reactions | Only emotes (Unicode or custom ones). Use of custom emotes subject to the same limit above. | Unicode emotes and [text](../features/#reactions). Support for custom emotes reactions are inconsistent across clients, but this may change in the future. |
| Stickers | Only stickers defined within the "server". | **Unlimited with setup.** See [here](../features/#stickers). |
| Public read receipts | Not supported. | **Supported.** |
| Notifications and notification settings | Mostly sender-controlled except for a small receiver-control of blocking the sender, server-side. | In plaintext events, receiver-controlled, server-side, including pattern matching. In end to end encrypted events, receiver-controlled, client-side in the receiving device. Note that for Android users, Matrix supports [UnifiedPush](https://unifiedpush.org). [Some amount of sender control](https://github.com/matrix-org/matrix-spec-proposals/blob/main/proposals/3952-intentional-mentions.md) planned. |
| **Direct messages** | Not encrypted. | **Encrypted by default**, including VoIP. |
| Starting a DM | Depending on privacy settings, initiating a DM requires the two users to have established "friendship" or have certain mutual "servers." Users are given the choice to accept, remove, or report a DM (since late 2021). | Initiating a DM solely requires the recipient to accept the request[^2]. Users can leave DMs anytime they wish. |
| **Group chats** | A group chat channel is associated with a "server." You can only join 100 "servers," 200 with Nitro. Additionally, there are group chats not associated with servers, called group DMs, with far more limited features than servers can. | A room is standalone, but can be optionally included and associated with a Space, which is just a room linking to other rooms. You can join **unlimited** amount of rooms (in theory). |
| VoIP in groups | Supported. End to end encrypted VoIP support using MLS implemented, albeit with a huge security issue: [the session is silently downgraded if there is a non-E2EE-capable client](https://github.com/discord/discord-api-docs/issues/6574). | Supported. The room plays the role of signalling, audiovisual data is sadly routed through a separate WebRTC channel. End to end encryption supported. |
| Organizing chats | "Servers" can be organized into folders, but each "server" can only belong to 1 folder. Channels in a "server" can only be organized by the "server" owner and moderators with "manage channels" permission, in a many to one fashion, and cannot be moved to another "server" once created. | Rooms can be included within an unlimited amount of Spaces. Spaces may also include other Spaces (similar to Discord's channel categories). |
| Group chat privacy | Denying "View Channel History" permission prevents users from reading messages prior to their most recent login. However the "server" owners cannot enjoy that privacy, as "server" owners cannot deny their own permissions due to how Discord's permission system works. | You may deny new members from reading messages prior to them being invited / joining. You may also allow or deny guest access (such as [Matrix Static](http://view.matrix.org/)) from reading messages. You may also enable encryption[^3]. |
| Server-side deletion guarantees | Messages that are removed from Discord are garbage collected from discord.com databases within less than 2 days.[^8]  Guild messages from deleted users are mapped to the unified ghost user, including mentions to them. Direct messages stay unless explicitly closed by the counterparty. | As Matrix follows an event chain model, there is no true deletion. The closest thing available is redaction, which instructs the users and servers to blank the content but not the metadata of the event. Redactions are best-effort[^12]. |
| Publicity | Although Discord offers its own "server" discovery feature, the requirements are somewhat arbitrary, so third-party services are often used. Only "server" owners can apply to Discord's own "server" discovery directory. Additionally, there is an experimental feature that allows users to list "server"s in a private directory listing, but this is currently only available to user with certain university e-mail addresses. Third-party directory services may differ. | Each homeserver has a room directory which anyone in that homeserver may publish to. The third-party [MatrixRooms.info](https://matrixrooms.info/) allows searching room directories of various public homeservers on the web. |
| Invite | Through generating invite links or using an OAuth-based integration. | Through directly inviting users, or through shareable [addresses](../features/#promotion). |
| Permissions in group chats | Single-owner, up to 255 roles. How long did it take for you to learn role hierarchy?[^7] A "server" can only be shut down by its owner, and that affects everyone. Members cannot demote their own permissions. Roles of a member are reset when a member leaves hence do not survive rejoin. | Up to 2^54 [power levels](https://spec.matrix.org/v1.9/client-server-api/#mroompower_levels) (-2^53 to 2^53-1, however I highly doubt you will *ever* reach that limit). A user acquires a permission if their power level is equal to or higher than the power level required for the specific permission. Rooms are not owned by any user or server, hence cannot usually be forcibly shut down without coordination. Members can demote their own permissions. Power levels of members survive leave and rejoin. |
| Pre-moderation capabilities | Partly mandatory, partly opt-in. Keyword-based pattern matching, automated community rules enforcement using natural language processing (partially powered by AI.com products), spam and scam link matching, user nickname, custom status and biography sanitisation, virus file detection. Called AutoMod in the product. | No standard method exists. Can only be enforced by the homeserver of the original message. |
| Size limits of group chats | 10 in group DMs, several tiers in "servers" ranging from 125 thousands to 1.5 million, subject to manual transition across those tiers.[^14] | No artificial limits, albeit current implementations do not perform well with rooms having more than a few tens of thousands of members and a few dozens of homeservers. |
| Bans | Ban history and list of active bans are only visible to "server" moderators. Users that are online at the time of ban action get a public ban event from the websocket gateway. One can also always see their own ban when they attempt to join a "server", but not the ban reason. | Bans are public to all members, along with the reasons. Note that if you ban a user from a room (directly, not by using Mjölnir), regardless of whether they have been a member of that room, the user will be notified. |
| Disabled and deleted account handling | Disabling an account is reversible until 2 years after disabling. Accounts that do not log in for 2 years get automatically deleted every 45 days.  Messages sent to a "server" from deleted accounts stay unless explicitly removed by somebody else. User name and user settings from deleted accounts are removed. Discord-formatted mentions to deleted users made using user IDs throw "this user is no longer accessible to you" error. Deleted users are coalesced to a single ghost user, with the user ID 456226577798135808. "Servers" owned by accounts shut down before November 2022 may stay. "Servers" owned by a manually deleted accounts have always been automatically shut down, so do any "servers" deleted after November 2022. User metadata of users deleted after March 2024 are suppressed server-side, and mention pills mentioning such users will show "unknown user" while displaying and "this user is not accessible to you" when clicked on it on the official client. Self-deleted users can undelete themselves until 14 days after they initiate the deletion. Suspended accounts can have their ban appealed within 2 weeks of initiation of suspension, and their data is retained for up to 6 months after the suspension started. | Disabling an account is usually irreversible. Users can cause their messages to be forgotten while disabling their account: in that case, their messages are not sent to further users and servers. Rooms created by disabled accounts stay. |
| **Running a bot** | Running a bot in more than 100 "servers" requires a proof of identity, similar in manner to one encountered in international borders. Selfbotting is forbidden, but this is inconsistently enforced. | You can run bots on any user accounts[^4] [^5]. Selfbotting is permitted (but be nice). |
| **Apps to access platform** | By ToS, you are only allowed to use the official Discord app (including its PTB and Canary variants). This is not enforced consistently: [some modifications](https://github.com/Discord-Client-Encyclopedia-Management/Discord3rdparties?tab=readme-ov-file#mods) and [some third party clients](https://github.com/Discord-Client-Encyclopedia-Management/Discord3rdparties?tab=readme-ov-file#third-party-reimplementations) are generally tolerated, while others may be forbidden. Third party clients that do not touch certain user profile related features tend to be not caught. | Element is the main app, but [**you're welcomed to use whatever you wish**](../#what-app-should-i-use). You can even make an app yourself[^5]! |
| **Network access** | **IPv4 only**. Users and bot developers have raised this issue repeatedly, and staff stated this is not urgent at all, despite the fact that IPv4 addresses have been exhausted worldwide: "We of course care of the future of the platform however ipv4<->ipv6 connectivity is not really going away any time soon with the availability of nat64 - and there are much more important things to work on." [One of the authors of this guide went even further, and filed a ticket on this issue](https://github.com/discord/discord-api-docs/issues/6695)| Most if not all homeservers participating in the public federation have IPv4 connectivity, but **IPv6 connectivity varies from homeserver to homeserver.** The [homeserver list](https://servers.joinmatrix.org) allows you to filter by IPv6 support. |


## Helpful Tips

* There is a [public bridge](https://t2bot.io/discord) that allows you to connect a Discord channel with a Matrix room. There is [another bridge that allows looking at your Discord direct messages from Matrix side](https://github.com/matrix-discord/matrix-appservice-discord), but that one requires self-hosting and more extensive setup than the public t2bot bridge.  (Although, backlinking Matrix data to Discord will reduce its privacy, so please take ethical concerns into account when using them.) 
* Your user colour is chosen by a hash function (varies by app) that takes in your MXID.

## Footnotes

[^1]: For Discord "servers" and for Matrix rooms.

[^2]: Note that Matrix has no concept of "friends" or "contacts" per se, although the DM list can serve the same purpose. However, user-based contact ignoring exists on Matrix, using two different methods. The former method prevents any and all messages from reaching the recipient, and the latter method using policy rooms hides them client-side by interpreting an ignore list. The latter method is currently only available in Element as a labs feature.

[^3]: Enabling encryption is irreversible for security reasons. Note that it is pointless to enable encryption in a public room, with one exception: the case you want to have a persistent cryptographic trail of who read the messages. Furthermore, enabling encryption means users will not see messages before their invitation (if applicable) or their entry.

[^4]: Matrix has no distinction between user and bot accounts (nor is there any dependency between the two). Unless specifically exempted by the homeserver (not needed in most cases), bots have the same ratelimit as other users. In Element and SchildiChat, the user token of an account is available by accessing "User Settings" then "Help & About." When running an autonomous bot, please be courteous and indicate to others (in username or display name) that the account is a bot. Bots that want to control other user accounts need to create an application service, which needs to be approved by an administrator of the homeserver that the bot is using.

[^5]: If your app/bot is good, then [matrix.org would love to hear from you (with the potential possibility of featuring you on their blog)!](https://matrix.to/#/#thisweekinmatrix:matrix.org)

[^6]: Limited by Matrix event size limits. The current event size limit is specified to be 65536 bytes. Formatted message size limit assuming the formatted body takes approximately twice as much as plain text body.

[^7]: May be more accurately described as ban hierarchy, as the order of roles only affect role changes, nick overrides, kicks and bans. Discord's permission system is otherwise "explicit allow wins".

[^8]: Somebody actually tried to report a message after deleting it and they got "no such message in our database" from T&S. Also backed by [Stanislav Vishnevskiy's blog post on infrastructure of Discord](https://blog.discord.com/how-discord-stores-billions-of-messages-7fa6ec7ee4c7#.fdhp3rxlo). However, deletions are basically a free-for-all matter: users (including bots) may decide to keep or repost deleted messages, and there is nothing stopping this.

[^9]: Process detection only exists in the desktop client. Somebody reverse engineered this process detection. Unlike Steam's similar process detection, this detection only sends the successfully detected games, not the list of every process running. Can be opted out by disabling the game activity detection. Science endpoint is said to drop the data server-side when the relevant toggles are disabled, however this claim cannot be verified. Hence assumed as "cannot be opted out". Note, that many third-party mods and clients do allow you to opt out of such but, as addressed prior, the ToS is against using them.

[^10]: Paywalling features related to customisation and expressivity is Discord's core business model, stated repeatedly by themselves and also verified by various third party sources. See [here](https://seoaves.com/how-does-discord-make-money-the-discord-business-model/) and [here](https://moneymodels.org/business-models/how-does-discord-make-money/).

[^11]: The exception is messages that @-mention the bot user can still be seen without the message content event. As many bot developers said, this is still a band-aid and not a useful solution. Direct messages are not affected by message content intent. 

[^12]: Most Matrix servers are known to keep the pre-redaction content of the event for a week, while immediately sending the redaction instruction to their fellow users. Again, redactions are basically a free-for-all matter.

[^13]: More accurately speaking, guilds are mapped to the guild servers in a many-to-one fashion. This can easily be confirmed by "server" outages, which happen when the guild process in the respective server restarts or the guild is being migrated to another server. However, the end users still lack any control on choosing a particular guilds server instance to host a guild.

[^14]: Discord "servers" have an initial limit of 125000 members. "Server" owners can request this limit to be increased by filing a support ticket, in which case Discord engineering team looks at the activity of the guild and manually migrates it to a guilds server instance with a larger member limit. Known tiers are: 125k, 250k (beyond this tier, brand verification required), 500k, 1M, 1.5M.
