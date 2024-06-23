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

<div class="flash flash-warn">
  As homeserver federation is a variable factor in key exchange, homeserver performance and networking does matter in preventing those issues. If you consistently encounter decryption issues, you may want to check whether your homeserver is working correctly. Specifically, if you are on matrix.org, it is recommended to <a href="https://servers.joinmatrix.org">move to a different homeserver</a> due to reliability issues.
</div>

<div class="flash">
  Everyone should make sure that <b>all</b> of their active sessions are verified, and that there is <b>at least one active session</b> that you normally use at all times!
</div>

A detailed explanation is available on [neko.dev](https://blog.neko.dev/posts/unable-to-decrypt-matrix.html).

### For recipients

Note that the instructions are relative to Element, but in principle similar steps can be taken for other clients.

1. if key backup is enabled for your account, go to Room Settings => Security & Privacy => Restore from Backup on the device that cannot read the message. If the option does not exist on your client, or if key backup is not enabled on your account yet (please [enable it](https://joinmatrix.org/guide/#encryption) now!), continue.
2. If at least one of your devices can read the messages:

    1. Open the device that can read the messages ("device A" thereafter) and navigate to the room that those messages are in.
    2. Open the device that cannot read the messages ("device B" thereafter) and navigate to the same room.
    3. The message keys should start coming in a few moments.

3. If the above doesn't work:

    1. Navigate to Settings => Security & Privacy on both devices.
    2. On device A, click "Export E2E room keys". Follow the instructions.
    3. Move the resulting key file to device B.
    4. On device B, click "Import E2E room keys". Follow the instructions.

Note that if you logged out of every device when you received the message, the message cannot be recovered. (Dehydrated devices will eventually fix this issue, but it will not recover anything that is already lost.)

### For senders

If others cannot decrypt your message, try:

* If you do not know what it does, disable the room-specific setting "Never send encrypted messages to unverified sessions in this room from this session" (in Room Settings => Security & Privacy), as well as the default setting "Never send encrypted messages to unverified sessions from this session" (in User Settings => Security & Privacy).
* On PC Element (or Nheko), open the recipient's profile and show their active sessions (for Element, under "Security"). Check if the session that your recipient is using is there. (Alternatively, on Element, check if a red warning indicating unverified or deleted/unknown devices appears next to your recipient's message.) If not, please verify whether your homeserver and clients are working correctly. Some experimental client features (especially [Sliding Sync](https://github.com/element-hq/element-web/issues/27580)) may interfere with decryption.
* If you're selfhosting, check your network setup!

To prevent future issues, try:

* Entering `/discardsession` (on Element; `/rotate-megolm-session` on Nheko) in the room. Usually this happens automatically, but client (especially [if your network is not stable](https://mastodon.catgirl.cloud/@sophie/112643481203081172)) and homeserver hiccups could cause issues.
