---
title: Matrix vs. Discord
layout: page-two-col
nav: false
parent: guide
permalink: guide/matrix-vs-discord/
description: It's time to ditch Discord. Imagine a place where users are actually respected. Join Matrix, the federated chat platform that does exactly that.
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

But that's not the case for a Discord "server": it's just some data, together with data of other "servers," resting on Discord's computational servers. A Discord "server" is not a program on its own, nor has any computational infrastructure been dedicated to any specific "server," thus violating both definitions. Presumably to attract gamers who often utilizes the correct "server" concept, Discord attempts to equate it to a chat group, muddying the waters for the definition of this technical term. (Hence Discord refers to "servers" as *guilds* in API documentations.)

### What about Matrix?

In Matrix, a *homeserver* is a server, in that it meets both definitions: Dedicated infrastructures (definition #2) running [a server software](../#set-up-your-own-homeserver-or-join-an-existing-homeserver) (definition #1). Furthermore, these homeservers, while operated independently of each other and not under the control of a single entity, communicate (transmitting messages and such) with each other using an agreed-upon protocol, thereby keeping the Matrix platform alive. Platforms that use such structure, such as Matrix, [fediverse](https://fediverse.party/en/fediverse) and email, are called federated platforms.

## Why not Discord?

I'm sure you can find a lot of valid criticisms of Discord, like [here](https://cadence.moe/blog/2020-06-06-why-you-shouldnt-trust-discord) or [here](https://austinhuang.me/discord-issues). Give them a read if you have time.

In the scope of this guide, the key reasons to move from Discord to Matrix are:

* **Lack of privacy for private communications**, as private conversations are not only unencrypted, but also actively scanned (see your settings).
* **Excessive tracking that cannot be opted-out**, such as the [science endpoint](https://luna.gitlab.io/discord-unofficial-docs/science.html) and the process logger (for activity status).
* **Hostile stance against unofficial clients or client modifications**, thus preventing users from opting out of certain annoyances or tracking.
* **Arbitrary phone number requirements**.
* Discord has made **decisions against the users' best interests**, with the most recent ones being:
  * Biased consultations and unilateral proposal of [cryptocurrency integrations](https://www.reddit.com/r/discordapp/comments/qpmhs5/discord_developers_please_do_not_support_nfts/) (which were only dropped after massive backlash); and
  * Mandatory rollout of slash commands, as well as KYC requirements, for running bots (which were *not* dropped despite [backlash](https://gist.github.com/Rapptz/4a2f62751b9600a31a0d3c78100287f1)).
* **Closed source**, thus cannot be independently inspected.
* **Lack of control for private data and no guarantee on reliability**, as Discord is centralized, not federated. See [here](../matrix-vs-al/#centralized-platforms).

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

Note that Matrix does not (and cannot, due to its decentralized nature) paywall features. Thus any exception in Discord features that require Nitro or Nitro Classic subscription is not considered.

| Feature | Discord | Matrix |
| ------- | ------- | ------ |
| **Registration** | Requires email. Discord may demand your phone number if it detects "suspicious activity." | Depending on homeserver, **email may not be required**. Phone number is usually optional. There is usually no human check after registration. |
| Price | Free, with certain features paywalled. | Free for [most homeservers](../../servers) (but please consider donating to them). Hosting a private homeserver may also incur cost (could be [free](https://matrix.org/docs/guides/free-small-matrix-server)). Note that paying (not donation) only affects where your data is hosted and (to a much lesser degree) server performance; it has no effect on features. |
| **Username** | Users are identified by display name (maximum 32 characters) + discriminator (4 randomly-assigned digits) to fellow users, and user IDs (Around 18 digits) for programming purposes. | Users are identified by their MXID (eg. `@alice:example.com`), composed of the username (must be ASCII characters, up to 255 characters) and the server name. A display name can be optionally added (up to ~65200 bytes)[^7]. |
| Avatar | Static, maximum 8 MB. Cannot be zoomed unless using a bot, in which case the returned avatar has a maximum definition of 1024x1024. | **See "Attachments" for limits.** Can be zoomed (at least in Element/SchildiChat), in which case the avatar will be shown in the uploaded definition. Animated avatars are **supported**. |
| Profile description and background | **Supported**. | Not supported. |
| Profile status | **Supported**. | Effectively not supported[^1]. |
| Nicknames[^2] | Supported. Maximum 32 characters. | **Supported** (`/myroomnick`). No limit. |
| Specific avatars[^2] | Requires Nitro. | [**Supported**](../features/#attachments) (`/myroomavatar`). See "Attachments" for limits. |
| 2FA | Email or SMS/TOTP. | Not required for login, but required (QR code, emoji verification, or Security Key) for viewing past encrypted messages. |
| **Text messages** | Maximum 2000 characters. Supports Markdown (with some modifications). | **Up to ~65200 bytes (up to ~40770 bytes if a formatted message with plain text fallback sent).[^7] [Supports Markdown and HTML.](../features/#text)** |
| Attachments | Maximum 8 MB (maximum 100 MB for users with Nitro, and also for all users in a "server" with boost tier 3). | **Maximum 50~100 MB** (for most homeservers; customizable if you run your own homeserver). |
| Custom emotes in messages | Free users can only use static emotes defined within the "server." | It is possible to insert user-defined static emotes in messages, see [here](../features/#attachments). No support for animated emotes. |
| Reactions | Only emotes (Unicode or custom ones) | Unicode emotes and [text](../features/#reactions). |
| Stickers | Only stickers defined within the "server". | **Unlimited with setup.** See [here](../features/#stickers). |
| Public read receipts | Not supported. | **Supported.** |
| **Direct messages** | Not encrypted. | **Encrypted by default**, including VoIP. |
| Starting a DM | Depending on privacy settings, initiating a DM requires the two users to have established "friendship" or have certain mutual "servers." Users are given the choice to accept, remove, or report a DM (since late 2021). | Initiating a DM solely requires the recipient to accept the request[^3]. Users can leave DMs anytime they wish. |
| **Group chats** | A channel is associated with a "server." You can only join 100 "servers." | A room is standalone, but can be optionally included and associated with a Space, which is just a room linking to other rooms. You can join **unlimited** amount of rooms. |
| VoIP in groups | Supported. | Not supported until early 2022. |
| Organizing chats | "Servers" can be organized into folders, but each "server" can only belong to 1 folder. Channels can only be organized by the "server" owner. | Rooms can be included within an unlimited amount of Spaces. Spaces may also include other Spaces (similar to Discord's channel categories). |
| Group chat privacy | Denying "View Channel History" permission prevents users from reading messages prior to their most recent login. However the "server" owners cannot enjoy that privacy, due to how Discord's permission system works. | You may deny new members from reading messages prior to them being invited / joining. You may also allow or deny guest access (such as [Matrix Static](http://view.matrix.org/)) from reading messages. You may also enable encryption[^4]. |
| Server-side deletion guarantees | Messages that are removed from Discord are garbage collected from discord.com databases within less than 2 days. | As Matrix follows an event chain model, there is no true deletion. The closest thing available is redaction, which instructs the users and servers to blank the content but not the metadata of the event. Redactions are best-effort. |
| Publicity | Although Discord offers its own server discovery feature, the requirements are somewhat arbitrary, so third-party services are often used. | Each homeserver has a room directory which anyone may publish to. |
| Invite | Through generating invite links. | Through directly inviting users, or through shareable [addresses](../features/#promotion). |
| Permissions | 255 roles. How long did it take for you to learn role hierarchy? | 2^54 power levels (I think it's -2^53 to 2^53-1, however I highly doubt you will *ever* reach that limit), with minimal permissions. A user acquires a permission if their power level is equal to or higher than the power level required for the specific permission. |
| **Running a bot** | Running a bot in more than 100 "servers" requires proof of identity. Selfbotting is forbidden. | You can run bots on any user accounts[^5] [^6]. Selfbotting is permitted (but be nice). |
| **Apps to access platform** | You are only allowed to use the official Discord app (including its PTB and Canary variants). Client modifications are forbidden but effectively tolerated. Third-party clients are forbidden but some are also tolerated. | Element is the main app, but [**you're welcomed to use whatever you wish**](../#what-app-should-i-use). You can even make an app yourself[^6]! |

## Helpful Tips

* There is a [bridge](https://t2bot.io/discord) that allows you to connect a Discord channel with a Matrix room. (Although, backlinking Matrix data to Discord will reduce its privacy, so please take ethical concerns into account when using it.)
* Your user colour is chosen by a hash function (varies by app) that takes in your MXID.

## Footnotes

[^1]: Element and SchildiChat has status available as a lab feature, but it is only visible to those who you have a DM with. Statuses are not encrypted.

[^2]: For Discord "servers" and for Matrix rooms.

[^3]: Note that Matrix has no concept of "friends" or "contacts", although the DM list can serve the same purpose. However, user-based contact ignoring exists on Matrix, using two different methods. The former method prevents any and all messages from reaching the recipient, and the latter method hides them client-side by interpreting an ignore list.

[^4]: Enabling encryption is irreversible for security reasons. Note that it is pointless to enable encryption in a public room. Furthermore, enabling encryption means users will not see messages before their invitation (if applicable) or their entry.

[^5]: Matrix has no distinction between user and bot accounts (nor is there any dependency between the two). Unless specifically exempted by the homeserver (not needed in most cases), bots have the same ratelimit as other users. In Element and SchildiChat, the user token of an account is available by accessing "User Settings" then "Help & About." When running an autonomous bot, please be courteous and indicate to others (in username or display name) that the account is a bot. Bots that want to control other user accounts need to create an application service, which needs to be approved by an administrator of the homeserver that the bot is using.

[^6]: If your app/bot is good, then [matrix.org would love to hear from you (with the potential possibility of featuring you on their blog)!](https://matrix.to/#/#thisweekinmatrix:matrix.org)

[^7]: Limited by Matrix event size limits. The current event size limit is specified to be 65536 bytes. Formatted message size limit assuming the formatted body takes approximately twice as much as plain text body.
