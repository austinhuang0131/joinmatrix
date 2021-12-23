---
title: Guide
layout: page-two-col
nav: true
parent: guide
permalink: guide/
---

Welcome! This website aims to be a beginner-friendly guide to Matrix (sometimes mistakenly known as Element). Without further due, let's begin:

## Why Matrix?

Matrix is the long-awaited middleground between one-to-one messaging platforms (Facebook Messenger, WhatsApp, iMessages, SMS...) and social/collaborative messaging platforms (Discord, Slack, Telegram...): It offers an appropriate degree of privacy while allowing you to socialize/collaborate with others. Generally, the merits that make Matrix stand out from others can be boiled down to two categories:

* **Freedom.** You get to choose how you use the platform and how your data is treated.
  * Conversations can be end-to-end encrypted[^1]. This is enabled by default for direct and group messages[^2].
  * Automatic collection of data is minimized: No contact syncing[^3], no "are you human?" checks beyond registration, phone numbers are optional, even email addresses are optional (on select homeservers)!
  * You can host your own server, or you can join [an existing public homeserver](./servers) that suits you. Either way, your access to the Matrix federation is the same[^4]!
  * Bridges allow you to chat with users on other platforms, minimizing the social cost of moving to Matrix!
* **Trust.** You get to actually trust the software you use.
  * Matrix is an open protocol, and most of its clients and servers[^5] are both open source, which you may contribute to!
  * You are welcomed to improve Matrix by creating new clients and/or server implementations, or by [reviewing or submitting](https://spec.matrix.org/unstable/proposals/) proposals. You can shape your platform towards a better direction!
  * Matrix is backed by the public sector, most notably by the Germans ([healthcare](https://matrix.org/blog/2021/07/21/germanys-national-healthcare-system-adopts-matrix), [army](https://element.io/case-studies/bundeswehr), [universities](https://doc.matrix.tu-dresden.de/en/why/)) as well as [the French](https://element.io/case-studies/tchap).

Some other reasons that may be attractive:

* Since Matrix is an open protocol, it is extensible and can be used for purposes beyond just chatting. For example: [help desk](https://www.safesupport.chat/), [social media](https://minestrix.henri2h.fr/), real-time collaboration...
* Matrix is of European origin, which breaks the American hegemony on chat platforms, since the United States is not exactly known for respecting data privacy or best practices.
* Matrix's federated nature makes the platform difficult, if not impossible, for a "big tech" to acquire, or for a regime to censor.

And of course, Matrix has the features that everyone else has: Cross-platform, real-time, etc. But that's not the point. Matrix shows that it is **possible** to have a decent chat platform that actually **respects you**.

## Get Started

Ready to try Matrix? Here we go:

### Set up own homeserver, or join an existing homeserver?

<div class="flash">
  The "default" Matrix homeserver is <code>matrix.org</code>, which is used by 35% of all Matrix users <a href="https://matrix.org/blog/2020/01/02/on-privacy-versus-freedom">as estimated in 2020</a>. Although it is okay to use it (and you can try out Matrix quickly), it is highly encouraged to choose a different homeserver (or run your own) for long-term usage, as it serves the spirit of decentralization promoted by the Matrix protocol, and also because <code>matrix.org</code> is occasionally overloaded (though performance has improved in recent times).
</div>
<br>
If you have hosting, and have the technical skills required to host an internet-facing program, then you can try setting up your own homeserver. The dominant homeserver implementation is [Synapse](https://github.com/matrix-org/synapse/). See [installation instructions](https://matrix.org/docs/guides/installing-synapse).

However, hosting is still unreachable for many. In that case, you can join an existing homeserver by picking one from [our public homeserver list](./servers), or by contacting a friend who hosts one.

### Register an account

<div class="flash">
  This part does not cover cases where a homeserver uses their own authentication tools. In such cases, please consult related information of the homeserver in question.
</div>
<br>
For simplicity, the guide is prepared in such a way that recommends registration on a PC browser, even though many servers allow you to do so from native PC/mobile apps. Regardless, once registered, you can use the account everywhere!

1. If our homeserver list already provided you with a link to the homeserver's in-house Element client, then you may use that. Otherwise, use the official [Element Web client](https://app.element.io) to register.
2. Click "Create Account".
3. On the top of the registration dialog, verify that you are registering on the correct server. If necessary, click "edit" and enter the appropriate domain (see homeserver documentation or the "Registration method" column of the [homeserver list](./servers)). Once it is correctly entered, **note the domain down.** You will need it to login.
4. Fill out the required information.
5. If you did not enter an email address, then you're in. Otherwise, verify your email, after which you will be prompted to login.

Remember to [set up key backup](#set-up-key-backup)

### Log into an existing account

If you're on Element or SchildiChat...

1. Click "Login".
2. On the top of the registration dialog, verify that you are logging onto the correct server. If necessary, click "edit" and enter the appropriate domain (see Step 3 of registration).
3. Enter your login details. The username is the part after the at-mark and before the colon (called "localpart").

If you're on FluffyChat...

1. On the top of the registration dialog, verify that you are logging onto the correct server. If necessary, enter the appropriate domain in the address bar (again, see Step 3 of registration).
2. Enter your login details.

### Set up key backup

A Security Key is required to access encrypted messages if:

* You have previously logged out of *all* your sessions, or
* You are unable to verify interactively (QR code or emoji comparison) from another session.

It is **strongly recommended** to do this step to prevent accidentally losing all your encrypted messages.

1. On your first login, a bubble on the top-left will ask you to "set up secure backup". Click "Continue". If that is not the case, click your avatar, then "Settings" -> "Security & Privacy" -> "Secure Backup" -> click "Set up".
2. "Generate a Security Key" is enough.
3. Put the generated security key in a safe place.

## Footnotes

[^1]: Only text contents and file attachments of messages are encrypted. Currently, Matrix does not prevent metadata leakage, mainly due to its federated nature. This will change, however, when Matrix starts rolling out [Pinecone](https://archive.fosdem.org/2021/schedule/event/matrix_pinecones/), allowing p2p connections. Currently, it *can* be mitigated if all participants of an E2EE conversation are running their own homeserver (so to eliminate third parties).

[^2]: Exception: Some bots do not support end-to-end encrypted messaging.

[^3]: Element allows you to opt into (not enabled by default as of late 2021) using an "identity server" - think of it as a big online address book. This allows users to share their email addresses and username, which can be looked up manually by other users.

[^4]: Note that public rooms may block certain servers - just like banning individual users - due to prevalence of unacceptable content (spam, hate speech, etc.). If you're not running your own homeserver, don't join homeservers that are known to harbour such content. This does not apply to homeservers listed on [our public list](./servers) as they are vetted against any presence of bad reputation. In any case, behave yourselves, remember the human.

[^5]: This covers all the ones that an average user sees.
