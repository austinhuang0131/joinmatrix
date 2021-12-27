---
title: Guide
layout: page-two-col
nav: true
parent: guide
permalink: guide/
---

## The "Join Matrix!" Guide: Basics

Welcome! This website aims to be a beginner-friendly guide to Matrix (sometimes [mistakenly known](#is-it-matrix-or-element) as Element). Matrix is an open federated communication protocol that strives to be a viable alternative to various centralized proprietary platforms. But those are very big words, and unfortunately, it does confuse people sometimes, so this guide aims to introduce you to the chatting aspect of it in somewhat simpler terms. We'll start by the "why" and then the "how." This part is for people who have never used Matrix before, so if you're looking for more advanced material, check out the sidebar.

## Why Matrix?

Matrix is the long-awaited middleground between one-to-one messaging platforms (Facebook Messenger, WhatsApp, iMessages, SMS...) and social/collaborative messaging platforms (Discord, Slack, Telegram...): It offers an appropriate degree of privacy while allowing you to socialize/collaborate with others. Generally, the merits that make Matrix stand out from others can be boiled down to two categories:

* **Freedom.** You get to choose how you use the platform and how your data is treated.
  * Conversations can be end-to-end encrypted[^1]. This is enabled by default for direct and group messages[^2].
  * Automatic collection of data is minimized: No address book syncing[^3], no "are you human?" checks beyond registration, phone numbers are optional, even email addresses are optional (on select homeservers)!
  * You can host your own server, or you can join [an existing public homeserver](../servers) that suits you. Either way, your access to the Matrix federation is the same[^4]!
  * [Bridges](./features/#all-about-bridges) allow you to chat with users on other platforms, minimizing the social cost of moving to Matrix!
  * Since Matrix is an open protocol, it is extensible and can be used for purposes beyond just chatting. For example: [help desk](https://www.safesupport.chat/), [social media](https://minestrix.henri2h.fr/), real-time collaboration...
* **Trust.** You get to actually trust the software you use.
  * Matrix is an open protocol, and most of its [apps](#what-app-should-i-use) and servers[^5] [^6] are both open source, which you may contribute to!
  * Matrix is federated, just like email: Unlike conventional platforms which are centralized (controlled by one entity), no one specific entity can control the entirety of the Matrix federation, where homeservers, operated independently from each other, communicate with each other using an agreed-upon protocol.
    * Furthermore, while individual homeservers may experience outage, the entire federation *cannot* go offline.
  * You are welcomed to improve Matrix by creating new apps around it, or by [reviewing or submitting](https://spec.matrix.org/unstable/proposals/) proposals. You can shape your platform towards a better direction!
  * Matrix is backed by the public sector, most notably by the Germans ([healthcare](https://matrix.org/blog/2021/07/21/germanys-national-healthcare-system-adopts-matrix), [army](https://element.io/case-studies/bundeswehr), [universities](https://doc.matrix.tu-dresden.de/en/why/)) as well as [the French](https://element.io/case-studies/tchap).

And of course, Matrix has the features that every modern messaging platform has: Cross-platform, real-time, sleek interface, etc. But that's not the point. Matrix shows that it is **possible** to have a decent chat platform that actually **respects you**.

## Get Started

Ready to try Matrix? Here we go:

### Is it Matrix or Element?

* Matrix is the protocol, developed by the UK-registered non-profit [The Matrix.org Foundation C.I.C.](https://matrix.org/foundation/). It can also refer to the entire Matrix federation that contains all the users and rooms.
* Element (previously known as Riot.im) is the flagship app of Matrix, developed by the UK-registered for-profit [New Vector Ltd](https://element.io/about). It can also refer to commercial services that the company offers, such as [Element Matrix Services](https://element.io/matrix-services).

[As touched upon later](#what-app-should-i-use), Element is just one of the apps that accesses Matrix. It is therefore correct to refer to the platform as just "Matrix." Though, nobody is stopping you from calling it *[The Matrix](https://en.wikipedia.org/wiki/The_Matrix)*.

### Set up own homeserver, or join an existing homeserver?

<div class="flash">
  The "default" Matrix homeserver is <code>matrix.org</code>, which is used by 35% of all Matrix users <a href="https://matrix.org/blog/2020/01/02/on-privacy-versus-freedom">as estimated in 2020</a>. Although it is okay to use it (and you can try out Matrix quickly with it), it is highly encouraged to choose a different homeserver (including running your own) for long-term usage, as it serves the spirit of decentralization promoted by the Matrix protocol, and also because <code>matrix.org</code> is occasionally overloaded (though performance has improved in recent times) and behind Cloudflare (which is a security risk).
</div>
<br>
If you have hosting, and have the technical skills required to host an internet-facing program, then you can try setting up your own homeserver[^6]. The dominant homeserver implementation is [Synapse](https://github.com/matrix-org/synapse/). See [installation instructions](https://matrix.org/docs/guides/installing-synapse). It may be possible to run a homeserver for free [with Oracle Cloud](https://matrix.org/docs/guides/free-small-matrix-server).

However, hosting is still undesirable for many. In that case, you can...

* Join an existing homeserver by picking one from [our public homeserver list](../servers), or
* Reaching out to a friend that hosts a homeserver, or
* Purchase [managed homeserver hosting](https://matrix.org/hosting/).

### Register an account

<div class="flash">
  This part does not cover cases where a homeserver uses their own authentication tools. In such cases, please consult your homeserver's instructions.
</div>
<br>
For simplicity, the guide is prepared in such a way that recommends registration on a PC browser, even though many servers allow you to do so from native PC/mobile apps. Regardless, once registered, you can use the account everywhere!

1. If you're using our homeserver list which has provided you with a link to the homeserver's in-house Element client, then you may use that. Otherwise, use the official [Element Web client](https://app.element.io) to register.
2. Click "Create Account".
3. On the top of the registration dialog, verify that you are registering on the correct server. If necessary, click "edit" and enter the appropriate domain (consult your public/private/managed homeserver's instructions, or the "Registration method" column of the [homeserver list](../servers)). Once verified, **note the domain down.** You will need it to login[^7].
4. Fill out the required information.
5. If you did not enter an email address, then you're in. Otherwise, verify your email, after which you will be prompted to [login](#log-into-an-existing-account).

Users are uniquely identified by their MXID. Your MXID is your username plus your server name (not necessarily domain). For example, `@austin:tchncs.de` is my MXID, where `austin` is my username and `tchncs.de` is the name of the server I'm on. **You cannot change it later!** Furthermore, if you deactivate the account, no one else can have this MXID again! You can, however, change the display name, as well as your avatar.

Remember to [set up key backup](#set-up-key-backup)!

### Log into an existing account

For most apps:

1. Enter the login dialog, if necessary.
2. Verify that you are logging onto the correct server. This is usually shown on top of the dialog. If necessary, click "edit" and enter the appropriate domain (see Step 3 of registration).
3. Enter your login details.

### Set up key backup

<div class="flash flash-warn">
  It is <b>strongly recommended</b> to do this step to prevent accidentally losing all of your encrypted messages.
</div>
<br>

When you log into a new device, you will be prompted to verify it using your existing device (by scanning a QR code or by comparing emojis). Your new device will then retrieve the room keys from your existing device, thereby enabling it to read your encrypted messages. This prevents anyone else - including your homeserver operator - to read encrypted content[^1].

However, a Security Key is required to access encrypted messages if:

* You have logged out of *all* your sessions prior to this login, or
* You are unable to verify interactively from another session.

You can set up a Security Key with the following steps:

1. On your first login, a bubble on the top-left will ask you to "set up secure backup". Click "Continue". If that is not the case, click your avatar, then "Settings" -> "Security & Privacy" -> "Secure Backup" -> click "Set up".
2. "Generate a Security Key" is enough.
3. Put the generated security key in a safe place.

## Get Familiar

### What app should I use?

There exists [many different apps](https://matrix.org/clients/) that can access Matrix. Because Matrix is an open protocol, you can even implement Matrix in your own app, if you got the skills. But for most people, here are some recommendations:

#### Browser

* [Element](https://app.element.io): The flagship app.
  * [Element development version](https://develop.element.io): Element with lab features enabled, but potentially unstable.
  * [SchildiChat](https://app.schildi.chat/): Element with lab features enabled, plus an optional speech bubble layout.
* [Cinny](https://cinny.in/): Matrix in Slack style.
* [Hydrogen](https://hydrogen.element.io/): Fast and adaptable to mobile browsers, at the cost of missing some optional features.

#### PC and Mobile

* [Element](https://element.io): The flagship app.
  * [SchildiChat](https://schildi.chat/): Element with lab features enabled, plus an optional speech bubble layout. Recommended to be used on PC for the full feature set.
* [FluffyChat](https://fluffychat.im/): "Cute" Matrix. Recommended to be used on Android for performance.

For those living on the edge: [Commune](https://commune.chat/), [Nheko](https://github.com/Nheko-Reborn/nheko), [Spectral](https://spectral.im), and [Syphon](https://syphon.org/).
<br>
<div class="flash">
  For PC users, if you want a better experience when using Element or SchildiChat, place <a href="../assets/config.json">this config file</a> in your <a href="https://github.com/vector-im/element-desktop#user-specified-configjson">configuration folder</a>, where <code>$NAME</code> is either "Element" or "SchildiChat". The config file enables the "Labs" tab in settings, enables custom theme, preloads <a href="https://github.com/aaronraimist/element-themes">a few custom themes</a>, uses <a href="https://dimension.t2bot.io/">Dimension</a> instead of Scalar for integration manager, and preloads a few homeservers for room directory searches.
</div>

### What rooms can I join?

Each Matrix homeserver has a public room directory, which is accessible to the users of that homeserver or, if enabled, users of other homeservers as well.

* On PC, for Element and SchildiChat, click the "Explore Rooms" button below your username on the top-left.
* On phone, for Element and SchildiChat, click the "Explore Rooms" floating button on the bottom-right.
* For FluffyChat, click the search button.

In any case mentioned above, you can enter the room address to directly join a room, or you can enter keywords to search for rooms[^8]. However, the directory may be unintuitive to use as it orders rooms by member count[^9]. The author of this guide recommends joining [this Space](https://matrix.to/#/#offtopic-space:envs.net) (`#offtopic-space:envs.net`), which contains a list of active off-topic or no-topic discussion rooms.

#### Hold on, what's a Space?

Discord users may be familiar with this format, but Spaces are not exactly the same as a Discord "server". A Space[^10] is a list that can include other rooms and Spaces. It can be used to organize your own rooms, or for a community to organize all their rooms. Joining a Space does not imply joining all of its rooms (however, rooms can choose to require users to join a Space first), nor does leaving a Space imply leaving all of its rooms (by default).

On Element and SchildiChat, Spaces show up on the left of your room list. Selecting one will filter your room list to DMs with members of the Space and joined rooms within the Space. To see rooms that you have not yet joined, click the Explore button (see above).

## Go Deeper

* [More Features of Matrix](./features): An introduction to more of Matrix's features!
* [Public homeserver list](../servers)
* Comparison with other platforms:
  * Discord
  * Telegram
* Questions & Answers

## Footnotes

[^1]: Only text contents and file attachments of messages are encrypted. Currently, Matrix does not prevent metadata leakage, mainly due to its federated nature. This will change, however, when Matrix starts rolling out [Pinecone](https://archive.fosdem.org/2021/schedule/event/matrix_pinecones/), allowing p2p connections. Currently, it *can* be mitigated if all participants of an E2EE conversation are running their own homeserver (so to eliminate third parties).

[^2]: Exception: Some bots do not support end-to-end encrypted messaging. Furthermore, when creating an empty private room, you will be prompted (but not by default) to enable encryption.

[^3]: Element allows you to opt into (not enabled by default as of late 2021) using an "identity server" - think of it as a big online address book. This allows users to share their email addresses and username, which can be looked up manually by other users. However, here "address book" means that Matrix will not store the one locally on your phone; homeservers *can* see who you are talking to, as such information are not encrypted. There is [a proposal](https://github.com/matrix-org/matrix-doc/pull/3414) to address this. See also footnote 1.

[^4]: Note that public rooms may block certain servers - just like banning individual users - due to prevalence of unacceptable content (spam, hate speech, etc.). If you're not running your own homeserver, don't join homeservers that are known to harbour such content. This does not apply to homeservers listed on [our public list](../servers) as they are vetted against any presence of bad reputation. In any case, behave yourselves, remember the human.

[^5]: This covers all the ones that an average user sees.

[^6]: [Synapse](https://github.com/matrix-org/synapse/) is the only stable homeserver implementation as of now. If you are living on the edge, you can try out [Dendrite](https://github.com/matrix-org/dendrite/) and [Conduit](https://conduit.rs/), both of which aim to support p2p eventually (see footnote 1).

[^7]: In most cases, it is equivalent to the server part of your MXID. The exceptions are where homeservers did not set up `.well-known` autodiscovery properly...

[^8]: Title and description.

[^9]: Which is not a reasonable gauge of activity. First, accounts can be inactive. Second, if a room uses [bridges](./features/#all-about-bridges), then these accounts are counted as well, even if their activity is mostly not from Matrix (you can still interact with them, however).

[^10]: Which, to be exact, is a special type of rooms. But that's too technical, so this guide will treat Space as its own thing, although similar to rooms.
