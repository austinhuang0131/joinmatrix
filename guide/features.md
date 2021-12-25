---
title: More Features of Matrix
layout: page-two-col
nav: true
parent: guide
permalink: guide/features/
---

## The "Join Matrix!" Guide: More Features of Matrix

Now that you have aced the [basics](..), let's talk about the intricate details of various features of Matrix.

## All about chatting

### Messages

<div class="flash flash-warn"><ul>
  <li>If a message has been edited, <b>all</b> of its edits, <b>plus</b> the original message, must be deleted to fully remove its content!</li>
  <li>If a message has been replied to, <b>all</b> of its replies, <b>plus</b> the original message, must be deleted to fully remove its content!</li>
  <li>Note that anyone that could read the message may still record its content before deletion. (For unencrypted messages, this includes the homeserver operators.) This applies to virtually <i>any</i> instant messaging platforms in existence, so you still need to be careful of what you say.</li>
</ul></div>

#### Text

Without prefixing a message with `/html`, Matrix supports basic markdown, as in everything in the [CommonMark spec](https://commonmark.org/help/). The changes are:

* For embedding images, the link must be an [MXC URI](#attachments).
* Language syntax highlighting in code blocks is supported - simply specify the language on the same line after the first three backticks.

Aside from the above:

* For strikethrough, Element and SchildiChat uses `<del>text</del>` while FluffyChat uses `~~text~~`. Note that the difference only exists in composing a message, and both clients render existing messages in the same way.
* For spoilers...
  * On Element and SchildiChat, you must prefix the message with `/html`, and then insert `<span data-mx-spoiler="reason">spoiler content</span>` at the position you desire, so it will hide the `spoiler content` and show the `reason` alongside it. If you want the entire message to be a spoiler and without inserting a reason, you can also just prefix a message with `/spoiler`.
  * On FluffyChat, you can achieve the same using `||reason|spoiler content||`.
* Tables are only supported on HTML (see below).

And, about slash commands on Element and SchildiChat related to text messages:

* Matrix also supports [these HTML tags](https://spec.matrix.org/v1.1/client-server-api/#mroommessage-msgtypes) if you prefix a message with `/html`.
* Prefixing your message with one of the following commands will trigger the corresponding visual effect for all users who are currently focused on the room: `/confetti`, `/fireworks`, `/rainfall`, `/snowfall` and `/spaceinvaders`. The effect will only be triggered once for these users only.
* Prefixing your message with `/me` will cause your message to start with `*` followed by your display name[^1].
* Prefixing your message with `/rainbow` will make the text appear in rainbow colours.
  * The two commands above can be combined using `/rainbowme`.
* Prefixing your message with `/shrug`, `/tableflip`, `/unflip` and `/lenny` will place the corresponding ASCII emote at the **beginning** of the message content. (This differs from Discord, where the emote is placed in the end.)

#### Attachments

You can upload files onto messages. The size limit varies by the homeserver you're on, but it should be at around 10~20 MB. There are no restrictions for file types, allowing some apps to offer the ability to record and send voice messages.

All files you upload onto Matrix are assigned an [MXC URI](https://spec.matrix.org/v1.1/client-server-api/#matrix-content-mxc-uris), which you can use for referencing to the same image. The MXC URI can be retrieved with the following steps:

1. Find the message.
2. On Element and SchildiChat on PC, hover over the message and click the three dots. On FluffyChat, long press the message and click the three dots on the top.
3. "View Source."
4. Under the `content` JSON object, locate the `url` attribute. The URI the starts with `mxc://` is the MXC URI.

The URI allows you to do the following, at least on Element and SchildiChat:

* Embed the image on text messages by inserting `![alt text](mxc://...)` (You can also use `<img>` tags under `/html`)
* Change your avatar for the current room using `/myroomavatar mxc://...`

The image can be accessed on the internet by replacing the `mxc://` prefix with `https://$SERVER/_matrix/media/r0/download/`, where `$SERVER` is the domain of *any* homeserver (it does not need to be in the room).
<br>
<div class="flash flash-warn">
  The attachments themselves can only be deleted by the homeserver operator. This means, especially, that deleting a message will <b>NOT</b> delete its attachments!
</div>

#### Reactions

You may react any message with any unicode emoji or any plaintext content[^2]. The latter is available...

* On FluffyChat, by replying to a message and entering the desired text prefixed with `/react` in the composer
* On SchildiChat, by clicking the reaction picker for a message, entering the desired text in the search box, and then choose "React with (text)"

## All about rooms

### Bridges

### Moderation

### Permission Levels

## Footnotes

[^1]: Similar to the eponymous command in Minecraft.

[^2]: Unlike Instagram Direct, where doing so will actually overflow the screen (you can try it but it will involve reverse engineering), Matrix apps handle this properly by showing the first few (≈10) characters followed by ellipsis. It seems to be mostly intended to be used by bots, as seen in [This Week in Matrix](https://matrix.to/#/#thisweekinmatrix:matrix.org), but since most bots are no different from other users, humans are welcomed to use it too.
