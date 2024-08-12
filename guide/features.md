---
title: More Features of Matrix
layout: page-two-col
nav: false
parent: guide
permalink: guide/features/
description: A guide that details various features of Matrix, the federated chat platform that actually respects you.
order: 1
---

## More Features of Matrix

Now that you have aced the [basics](..), let's talk about the intricate details of various features of Matrix. The guide assumes that you have done some preliminary discovery of features and that you are here for specifics that may not be too intuitive.

## All about chatting

<div class="flash flash-warn">
  <strong>IMPORTANT!</strong> You cannot change your Matrix user name. Choose it wisely.
</div>


### Messages

<div class="flash flash-warn"><ul>
  <li>If a message has been edited, <b>all</b> of its edits, <b>plus</b> the original message, must be deleted to fully remove its content!</li>
  <li>Due to a spec defect, initial revision of a message can only be removed if the message is removed altogether. Subsequent revisions can be removed on their own.</li>
  <li>If a message has been replied to, <b>all</b> of its replies, <b>plus</b> the original message, must be deleted to fully remove its content!</li>
  <li>Note that anyone who could read the message may still record its content before deletion. (For unencrypted messages, this includes the homeserver operators.) This applies to virtually <i>any</i> instant messaging platforms in existence, so you still need to be careful of what you say.</li>
  <li>If a user annoys you, you can ignore them. <a href="https://github.com/vector-im/element-web/issues/12394">Careful not to ignore yourself!</a></li>
</ul></div>

#### Text

Without prefixing a message with `/html`, Matrix supports basic markdown, as in everything in the [CommonMark spec](https://commonmark.org/help/). The changes are:

* For embedding images, the link must be an [MXC URI](#attachments), not an HTTP/S URL. This is required by Matrix specification to prevent remote homeservers from creating IP trackers to track users of multiple homeservers.
* Language syntax highlighting in code blocks is supported - simply specify the language on the same line after the first three backticks.

Aside from the above:

* For strikethrough, Element and SchildiChat use `<del>text</del>` (without `/html`), while FluffyChat uses `~~text~~`.
* For underline, Element and SchildiChat use `<u>text</u>` (also without `/html`), while FluffyChat uses `__text__`.
  * Note that the above differences only exist in composing a message, and both clients render existing messages in the same way.
* For spoilers...
  * On Element and SchildiChat, you must prefix the message with `/html`, and then insert one of the following lines of code at the position you desire, so it will hide the `spoiler content` and, optionally, show the `reason` alongside it. Note that if you want the entire message to be a spoiler and without inserting a reason, you can just prefix a message with `/spoiler` without writing HTML.
  ```html
  <span data-mx-spoiler="reason">spoiler content</span> # with reason
  <span data-mx-spoiler>spoiler content</span> # without
  ```
  * On FluffyChat, you can achieve the same using `||reason|spoiler content||`.
* Tables are only supported on HTML (see below).

And, about slash commands on Element and SchildiChat on PC related to text messages:

* Matrix also supports [these HTML tags](https://spec.matrix.org/v1.1/client-server-api/#mroommessage-msgtypes) if you prefix a message with `/html`.
* Prefixing your message with one of the following commands will trigger the corresponding visual effect for all Element/SchildiChat users on PC who are currently focused on the room: `/confetti`, `/fireworks`, `/rainfall`, `/snowfall` and `/spaceinvaders`. The effect will only be triggered once for these users only.
* Prefixing your message with `/me` will cause your message to start with `*` followed by your display name[^1].
* Prefixing your message with `/rainbow` will make the text appear in rainbow colours.
  * The two commands above can be combined using `/rainbowme`.
* Prefixing your message with `/shrug`, `/tableflip`, `/unflip` and `/lenny` will place the corresponding ASCII emote at the **beginning** of the message content. (This differs from Discord, where the emote is placed at the end.)

#### Attachments

You can upload files onto messages. The size limit varies by the homeserver you're on, but most homeservers have it between 50 and 100 MB. There are no restrictions for file types, allowing some apps to offer the ability to record and send voice messages.

All files you upload onto Matrix are assigned an [MXC URI](https://spec.matrix.org/v1.1/client-server-api/#matrix-content-mxc-uris), which you can use for referencing to the corresponding file. The MXC URI can be retrieved with the following steps:

1. Find the message.
2. On Element and SchildiChat on PC, hover over the message and click the three dots. On FluffyChat, long press the message and click the three dots on the top.
3. "View Source."
4. Under the `content` JSON object, locate the `url` attribute. The URI the starts with `mxc://` is the MXC URI.

If the attachment is an image, the URI allows you to do the following, at least on Element and SchildiChat:

* Change your avatar for the current room using `/myroomavatar mxc://...`
* Embed the image on text messages by inserting `![alt text](mxc://...)` (You can also use `<img>` tags under `/html`)

![Embedding an image](../../assets/images/embed.png)

The attachment can be accessed on the internet by replacing the `mxc://` prefix with `https://$SERVER/_matrix/media/r0/download/`, where `$SERVER` is the domain of *any* homeserver (it does not need to be in the room).

<div class="flash flash-warn">
  The attachments themselves can only be deleted by the homeserver operator, and until then, they are visible to the public. This means, especially, that deleting a message will <b>NOT</b> delete its attachments! (However, attachments uploaded in an encrypted room are visible to the public in the encrypted form, where only its intended recipients have the keys to decrypt it.)
</div>
<div class="flash">
  It is possible to use "custom emojis/emotes" in text messages by embedding the emote: simply adjust the image, upload it in an unencrypted room, get its MXC URI, and place the embedding code in messages. Furthermore, FluffyChat allows you to assign a <code>:shortcode:</code> to custom emotes so that they can be entered like normal emotes: Go to user settings, then "Conversations", then emoji settings. Note that embed GIFs will not animate.
</div>

#### Custom Emotes & Stickers

Note that emotes/stickers sent from any app are visible to most clients.

Integration managers (which Element uses) are minimally used by the community; instead [MSC2545](https://github.com/matrix-org/matrix-spec-proposals/pull/2545) is preferred. Emote rooms are available at the [`#stickers-and-emojis:pixie.town`](https://matrix.to/#/#stickers-and-emojis:pixie.town) space.

Nheko, FluffyChat and Cinny supports sending emotes/stickers and managing emote/sticker packs. SchildiChat supports sending emotes.

See [here](https://1hiking.github.io/posts/2021/09/matrix-stickers/) if you want more details.

### Reactions

You may react to any message with any unicode emoji or any plaintext content[^2]. The latter is available...

* On FluffyChat, by replying to a message and entering the desired text prefixed with `/react` in the composer;
* On SchildiChat, by clicking the reaction picker for a message, entering the desired text in the search box, and then choosing "React with (text)."

### Voice/Video calling

Voice/video calling is currently only supported for private messages (rooms with only 2 participants).

Currently, if you try to start a call in a room with more than 2 participants, a [Jitsi Meet](https://meet.jit.si) (not part of Matrix) [widget](#integrations) will be displayed for all users as a temporary solution. However, work is underway to allow native voice/video calling for groups, which hopefully will be enabled [by early 2022](https://matrix.org/blog/2021/12/22/the-mega-matrix-holiday-special-2021#native-matrix-videovoip-conferencing).

## All about bridges

Matrix prides itself in technical interoperability, i.e. ability to work with other platforms. Therefore, Matrix allows you to connect your chats to another platform.

Note that encryption is **not** supported on most bridges. Furthermore, the following instructions apply across the Matrix federation, but private homeserver providers as well as some public homeservers operate certain bridges for the benefit of their users, in which case please inquire the relevant providers.

<div class="flash flash-warn">
 Some bridges offer the possibility to bridge an account from another platform onto Matrix (known as puppeting). However, it is often against the ToS of the platform to do so (as interoperability is antithetical to centralized "walled garden" approaches) and may result in loss of account. Furthermore, it may damage the encryption mechanisms of the platform, as messages must be decrypted first before re-encryption. Lastly, the bridge operator can see your login credentials (not an issue if you're hosting the bridges yourself). You have been warned.
</div>

### Discord

To bridge a Matrix room with a Discord channel, you can install [matrix-appservice-discord](https://github.com/Half-Shot/matrix-appservice-discord) or [mautrix discord](https://github.com/mautrix/discord) if you're running your own homeserver[^3], or set up one of the free public bridges otherwise:

* [t2bot](https://t2bot.io/discord) (matrix-appservice-discord)
* [frei.chat](https://frei.chat/books/freichat/page/bridges) (mautrix)

Matrix users will show up as webhooks on Discord, and Discord users will show up as standard users on Matrix (but you cannot DM them). There is no puppeting.

### Telegram

To bridge a Matrix room with a Telegram group chat, you can install [mautrix telegram](https://github.com/mautrix/telegram) if you're running your own homeserver, or use one of the free public bridges otherwise:

* [t2bot](https://t2bot.io/telegram) (No puppeting)
* [Catgirl Cloud](https://catgirl.cloud/#matrix)
* [frei.chat](https://frei.chat/books/freichat/page/bridges)
* [tchncs.de](https://tchncs.de/matrix) (Puppeting requires approval)
* [TeDomum](https://tedomum.net/service/matrix/bridges/)
* [SNT](https://syscom.utwente.io/info/matrix/telegram/)
* [yatrix.org](https://yatrix.org/wissen/anleitungen/bruecken/#telegram) (No puppeting)

When a Matrix room is bridged with a Telegram group, Matrix users will be represented by the bridging bot on Telegram, while Telegram users will show up as standard users on Matrix (but you cannot DM them).

When you log into a Telegram account on a bridge, you may use it to control your own account such that you may interact with the entirety of Telegram from Matrix. This is called "puppeting" and is not supported by all bridges.

### Slack

To bridge a Matrix room with a Slack channel, do the following on Element or SchildiChat on PC:

1. In your desired room, click the info button on the top-right.
2. "Add widgets, bridges & bots"
3. Navigate to "Slack bridge" and follow the instructions.

Alternatively, try:

* [frei.chat](https://frei.chat/books/freichat/page/bridges)
* [nope.chat](https://nope.chat/)
* [yatrix.org](https://yatrix.org/wissen/anleitungen/bruecken/#slack)

### IRC

You can join any IRC channel on [these networks](https://matrix-org.github.io/matrix-appservice-irc/latest/bridged_networks) directly from Matrix. Matrix users will show up in their display name, suffixed with `[m]`.

<div class="flash flash-warn">
  You <i>can</i> register the nickname, but your NickServ password would be visible to your homeserver as encryption is not supported for bridges, so do so at your own risk.
</div>

### XMPP

You can join any XMPP MUC on any instance directly from Matrix, using the Bifrost bridge provided by [matrix.org](https://github.com/matrix-org/matrix-bifrost/wiki/Address-syntax) or [aria-net.org](https://archon.im/arianet/matrix-homeserver/services/).

### Other

Matrix supports many other platforms, but such bridges generally require setup. If you want to bridge those platforms, or if you have performance requirements that cannot be met by existing public bridges, you may either:

* [Host the bridges yourself](https://matrix.org/bridges/), if you run your own homeserver
* Use public bridges (which you're encouraged to donate for):
  * [Aria Network](https://archon.im/arianet/matrix-homeserver/services/) (Facebook, Instagram, WhatsApp; only available to accounts on the aria-net.org homeserver)
  * [frei.chat](https://frei.chat/books/freichat/page/bridges) (Facebook, Google Chat, Google Messages, Instagram, KakaoTalk, LinkedIn, Signal, Skype, WhatsApp)
  * [nope.chat](https://nope.chat/) (Facebook, Google Chat, Instagram, LinkedIn, Signal, Twitter, WhatsApp)
  * [tchncs.de](https://tchncs.de/matrix) (Signal, WhatsApp)
  * [TeDomum](https://tedomum.net/service/matrix/bridges/) (Signal, WhatsApp)
  * [yatrix.org](https://yatrix.org/wissen/anleitungen/bruecken/) (Signal, WhatsApp)
* Set up bridges as part of a managed homeserver hosting:
  * [etke.cc](https://etke.cc) (Many platforms)
  * [ungleich](https://ungleich.ch/u/products/hosted-matrix-chat/) (Many platforms)

## All about rooms

Because FluffyChat's room management capabilities are somewhat limited by design, this guide will base this section upon Element and SchildiChat on PC.

### Promotion

If you want to promote a public room, you can publish public addresses and/or place it on your homeserver's [room directory](../#what-rooms-can-i-join).

To publish an address:

1. Go to room settings.
2. In the "General" tab, under "Room Addresses" there is "Local Addresses." As indicated, you can only create addresses on the homeserver you are on[^4].
3. Enter the localpart (the part before `:`) of your desired address and then click "Add".
4. Under "Published Addresses," enter the entire address (with homeserver domain), then click "Add".
5. The "Main Address" is used for room directories and for mentioning the room in other rooms. Select one from the published addresses.
6. If you want to advertise your room in your homeserver's[^4] room directory, enable "Publish this room to the public in (server)'s room directory?"

Steps 1 to 3 can be done by anyone, whereas step 4 by 6 requires the user to have a power level equal to or higher than the required level for "Change main address for the room."

A public address also allows you to [link the room from a webpage](https://matrix.to/).

### Moderation

See [the official guide](https://matrix.org/docs/communities/moderation/) for general information.

The commonly-taken approach is:

1. Host [Draupnir](https://github.com/the-draupnir-project/Draupnir), or request [Draupnir4All](https://docs.draupnir.midnightthoughts.space/).
2. Subscribe to ban lists. To combat spam, it is enough to subscribe to [`#community-moderation-effort-bl:neko.dev`](https://matrix.to/#/#community-moderation-effort-bl:neko.dev), but other lists are also available in the [`#acls:envs.net`](https://matrix.to/#/#acls:envs.net) space.
3. Review the [Moderator's Guide](https://the-draupnir-project.github.io/draupnir-documentation/docs/bot/moderators) for various commands.

<div class="flash flash-warn">
  If you promote a user to the same power level as you, then you will <b>not</b> be able to demote them!
</div>
<div class="flash">
  <b>If you do not have Draupnir/Mjolnir,</b> It is a good idea to copy ACLs of other rooms (especially those of popular public rooms) and use them on your own to strengthen your room's defense to unwanted content. To do so:
  <ol>
    <li>Enter <code>/devtools</code> in the room you want to copy ACL from.</li>
    <li>Click "Explore Room State."</li>
    <li>Click <code>m.room.server_acl</code>.</li>
    <li>Click "Edit."</li>
    <li>Copy the content in the box. (It is futile to try to hit "Send" as you probably don't have the permission to.)</li>
    <li>Repeat steps 1 to 4, this time in the room you want to use the copied ACL in.</li>
    <li>Paste the content in the box and hit "Send."</li>
    <li>Confirm success. A state event will be created in the room, indicating that you have changed the ACL.</li>
    <li>Note that denying a homeserver whose users are already present in a room will not automatically kick the users. If necessary, enter the homeserver domain in the search box of the member list and kick them from your room. They will not be able to join back.</li>
  </ol>
</div>
<div class="flash">
  Hosting Draupnir/Mjolnir without permission to bypass ratelimit on the homeserver may result in reduced performance, but it is still possible.
</div>

### Integrations

Integrations in Matrix include widgets and bots.

Widgets display an interactive HTML page on top of chat messages. This only works on Element and SchildiChat on PC. You can use the `/addwidget` command, or the "Add widgets, bridges & bots" link in the room info sidebar. Note that individual members must opt into displaying the widget, and can choose to dismiss ("unpin") the widget for themselves at any time. Furthermore, anyone with power level above the required level for "Modify Widgets" will be able to dismiss ("unpin") the widget for everyone in the room.

Bots perform automated actions (like sending messages). [maubot](https://github.com/maubot/maubot) is the only well-known self-hostable bot, containing a variety of plugins. [t2bot.io](https://t2bot.io/) as well as some homeservers host certain plugins for public use.

[Bridges](#all-about-bridges) are also bots, but some bridges need to create new accounts to serve as puppets, which should only be operated on a homeserver that you own or otherwise have permission to run such bots on.

## Footnotes

[^1]: Similar to the eponymous command in Minecraft.

[^2]: Unlike Instagram Direct, where doing so will actually overflow the screen (you can try it but it will involve reverse engineering), Matrix apps handle this properly by showing the first few (≈10) characters followed by ellipsis. It seems to be mostly intended to be used by bots, as seen in [This Week in Matrix](https://matrix.to/#/#thisweekinmatrix:matrix.org), but since most bots are no different from other users, humans are welcomed to use it too.

[^3]: If you're running your own bridge, please manually incorporate [this pull request](https://github.com/Half-Shot/matrix-appservice-discord/pull/704) to support parsing Discord replies. (The t2bot bridge incorporates it since December 2021.)

[^4]: If you want addresses or/and publicity on other homeservers, you can create accounts, join the room, and do these steps. But be nice and don't spam. Remember, homeserver operators *can* remove your room from the room directory or even prevent anyone on their homeservers from joining your room.
