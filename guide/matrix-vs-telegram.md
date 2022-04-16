---
title: Matrix vs. Telegram
layout: page-two-col
nav: false
parent: guide
permalink: guide/matrix-vs-telegram/
description: It's time to ditch Telegram. Join Matrix, the federated chat platform that actually respects you.
---

## Matrix vs. Telegram

Thank you for considering Matrix. We will start with why you should move from Telegram to Matrix, followed by comparisons of specific feature and some helpful tips.

## Why not Telegram?

In the scope of this guide, the key reasons to move from Telegram to Matrix are:

* **Lack of privacy for private communications** since the default option is Cloud chat, which is not end-to-end encrypted. Secure chat also comes with significant feature limitations, such as no portability across devices.
* **Ads**, even if it's just for popular channels. Third-party clients are also not allowed to opt them out, albeit nobody knows how Telegram will enforce that restriction.
* **Phone number requirement.**
* Despite Telegram claiming to have minimal intervention on legal content, it nevertheless made **controversial decisions**, such as [shutting down Russian political bots](https://en.wikipedia.org/wiki/Telegram_(software)#2021_shutdown_of_Russian_political_bots). (Matrix, on the other hand, is decentralized, which makes censorship technically difficult.)
* **Telegram servers are closed source**. (Says to defend against state censorship...?)
* **Lack of control for private data and no guarantee on reliability**, as Telegram is centralized, not federated. See [here](../matrix-vs-al/#centralized-platforms).

Despite recent studies, Telegram's use of its own MTProto protocol remains a debated subject, which will be left up to you.

## Feature comparison

| Feature | Telegram | Matrix |
| ------- | -------- | ------ |
| **Registration** | Requires phone number. | **Phone number is usually optional.** Depending on homeserver, **email is commonly required**. There is usually no human check after registration. |
| **Username** | Users are identified by phone number or username (if set up, 5\~32 alphanumeric characters) to fellow users, and user IDs (around 9\~10 digits) for programming purposes. A display name can be added (no limit). | Users are identified by their MXID (eg. `@alice:example.com`), composed of the username (must be ASCII characters, upper case letters are not allowed) and the server name (not exceeding 255 characters when combined, including the introducing at symbol and the colon separating the parts). A display name can be optionally added (up to ~65200 bytes)[^2]. |
| Avatar | Static or animated; limit unknown. Can be zoomed; the returned avatar has a maximum definition of 640x640. | **See "Attachments" for limits.** Can be zoomed (at least in Element/SchildiChat), in which case the avatar will be shown in the uploaded definition. Animated avatars are supported and will be rendered (at least in Element/SchildiChat). |
| Profile description | **Supported**. | Will be supported using profile rooms. Not supported currently. |
| Room-specific nicknames | Not supported, though group admins can talk on behalf of the whole group. | **Supported** (`/myroomnick`). Up to ~65200 bytes. [^2] |
| Room-specific avatars | Not supported. | [**Supported**](../features/#attachments) (`/myroomavatar`). See "Attachments" for limits. |
| 2FA | One-time token sent to another session. | Not required for login, but required (QR code, emoji verification, or Security Key) for viewing past encrypted messages. |
| **Text messages** | Maximum 4096 characters. Supports Markdown. | **Up to ~65200 bytes (up to ~21270 bytes if a formatted message with plain text fallback sent).[^2] [Supports Markdown and HTML.](../features/#text)** |
| Attachments | **Maximum 2 GB.** | Maximum 50~100 MB (for most homeservers; customizable if you run your own homeserver). |
| Reactions | Very limited. Must be enabled by group admins in groups. | All unicode emotes and [text](../features/#reactions). |
| Stickers | Up to 200 packs of 120 static or 50 animated each. | **Unlimited (static or animated) with setup.** See [here](../features/#stickers). |
| Public read receipts | Supported ambiguously. | **Supported.** |
| **Direct messages** | Not encrypted unless explicitly opted into secret chat, which cannot be carried across devices. VoIP is encrypted. | **Encrypted by default**, including VoIP. |
| **Group chats** | You can join up to 500 groups and channels. | You can join an **unlimited** amount of rooms. |
| VoIP in groups | Supported. | Limited Support via integration with Jitsi. Expected to be replaced by a better solution during 2022. |
| Organizing chats | You can pin or archive groups (similar to favourite and low priority on Element/SchildiChat). | Rooms can be included within an unlimited amount of Spaces. Spaces may also include other Spaces. |
| Group chat privacy | You may deny new members from reading more than 100 messages prior to them joining. | You may deny new members from reading messages prior to them being invited / joining. You may also allow or deny guest access (such as [Matrix Static](http://view.matrix.org/)) from reading messages. You may also enable encryption[^1]. |
| Publicity | Any group or channel set to public can be listed in search results, but how they are shown is arbitrary, as global search is not always visible to users. | Each homeserver has a room directory which anyone in that homeserver may publish to. |
| Invite | Through directly inviting users, or through generating invite links. | Through directly inviting users, or through shareable [addresses](../features/#promotion). |
| Group chat permissions | Permissions of each administrator are set manually. All admins are equal (except owner). Permissions of a member do not survive leave and rejoin. | 2^54 power levels (I think it's -2^53 to 2^53-1, however I highly doubt you will *ever* reach that limit). A user acquires a permission if their power level is equal to or higher than the power level required for the specific permission. Power levels of members survive leave and rejoin. |
| Size limits of group chats | Up to 100k members in groups, unlimited in one-to-many channels. | No artificial limits, albeit current implementations do not perform well with rooms having more than a few tens of thousands of members and a few dozens of homeservers. | 
| Disabled and deleted account handling | Disabling an account is reversible until one year after disabling. Accounts that do not login for a year get automatically deleted. Messages from deleted accounts survive for one more year from deletion. | Disabling an account is usually irreversible. Messages from disabled accounts are not sent to further users and servers. Rooms created by disabled accounts stay. |
| Ads | Popular channels now carry ads that you cannot opt out. | It is technically possible for a homeserver to insert ads, but **there are no known occurrences**. |
| **Network access** | **IPv4 supported, [IPv6 broken](https://flameeyes.blog/2017/08/06/ipv6-horror-story-telegram/)**.  | ***Most if not all homeservers participating in the public federation have IPv4 connectivity but IPv6 connectivity varies from homeserver to homeserver.**. |


## Helpful Tips

There is a [bridge](https://t2bot.io/telegram) that allows you to connect a Telegram group with a Matrix room.

## Footnotes

[^1]: Enabling encryption is irreversible for security reasons. Note that it is pointless to enable encryption in a public room, with one exception: the case you want to have a persistent cryptographic trail of who read the messages. Furthermore, enabling encryption means users will not see messages before their invitation (if applicable) or their entry.

[^2]: Limited by Matrix event size limits. The current event size limit is specified to be 65536 bytes. Formatted message size limit assuming the formatted body takes approximately twice as much as plain text body.
