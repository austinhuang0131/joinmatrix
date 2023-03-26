---
title: Fix decryption errors on Matrix
layout: page-two-col
nav: false
parent: guide
permalink: guide/fix-decryption-error/
description: A simple checklist on what to do when your Matrix client cannot decrypt messages.
---

A detailed explanation is available on [neko.dev](https://blog.neko.dev/posts/unable-to-decrypt-matrix.html). Here is a summary of what you can do (all instructions are relative to Element):

## Basic checks

* Did the sender enable "Never send encrypted messages to unverified sessions in this room from this session" in Room Settings => Security & Privacy? (Turn it off if you don't understand what it does)
* Have you logged out of every device when you received the message? (No can do, though dehydrated devices will eventually fix this issue)
* Can the sender see your current device? (If not, please verify whether your homeserver is working correctly)

## If at least one of your devices can read the messages

1. Open the device that can read the messages ("device A" thereafter) and navigate to the room that those messages are in.
2. Open the device that cannot read the messages ("device B" thereafter) and navigate to the same room.
3. The message keys should start coming in a few moments.

### If the above doesn't work

1. Navigate to Settings => Security & Privacy on both devices.
2. On device A, click "Export E2E room keys". Follow the instructions.
3. Move the resulting key file to device B.
4. On device B, click "Import E2E room keys". Follow the instructions.

## For all other situations

Try the following in no specific order:

* If key backup is enabled for your account, go to Room Settings => Security & Privacy => Restore from Backup.
* While the sender is online, ask them to navigate to the room, then click "resend key requests" on your device.
* Enter `/discardsession` in the room.
