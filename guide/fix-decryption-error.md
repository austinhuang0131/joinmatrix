---
title: Fix decryption error
layout: page-two-col
nav: false
parent: guide
permalink: guide/fix-decryption-error/
description: A simple checklist on what to do when your Matrix client cannot decrypt messages.
order: 7
---

## Fix decryption error

If you're seeing *Unable to decrypt message* or similar errors in a room, here's a list of possible steps you can take to try to remedy the situation. Note that the instructions are relative to Element, but in principle similar steps can be taken for other clients.

A detailed explanation is available on [neko.dev](https://blog.neko.dev/posts/unable-to-decrypt-matrix.html).

<div class="flash">
  Everyone should make sure that <b>all</b> of their active sessions are verified!
</div>

### If at least one of your devices can read the messages

1. Open the device that can read the messages ("device A" thereafter) and navigate to the room that those messages are in.
2. Open the device that cannot read the messages ("device B" thereafter) and navigate to the same room.
3. The message keys should start coming in a few moments.

#### If the above doesn't work

1. Navigate to Settings => Security & Privacy on both devices.
2. On device A, click "Export E2E room keys". Follow the instructions.
3. Move the resulting key file to device B.
4. On device B, click "Import E2E room keys". Follow the instructions.

### If none of your devices can read the messages

If key backup is enabled for your account, go to Room Settings => Security & Privacy => Restore from Backup.

Note that if you logged out of every device when you received the message, the message cannot be recovered. (Dehydrated devices will eventually fix this issue, but it will not recover anything that is already lost.)

### Prevention

If all above methods are exhausted, then the messages are very unlikely to be recovered. There are, however, a few things that you can do to prevent such annoyances from happening again:

* [Enable key backup!](https://joinmatrix.org/guide/#encryption)
* Unless you understand what it does, have the sender disable "Never send encrypted messages to unverified sessions in this room from this session" (in Room Settings => Security & Privacy), as well as "Never send encrypted messages to unverified sessions from this session" (in User Settings => Security & Privacy).
* On PC Element, have the sender open the recipient's profile and show the active sessions under "Security". Check if the recipient's current session is there. If not, please verify whether the homeservers and clients are working correctly. Note that some experimental features on PC Element (especially Rust Crypto) may interfere with encryption.
* Have the sender enter `/discardsession` (on Element; `/rotate-megolm-session` on Nheko) in the room. Usually this happens automatically, but homeserver hiccups could cause issues.
