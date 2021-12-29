---
title: Comparison to other platforms
layout: page-two-col
nav: false
parent: guide
permalink: guide/matrix-vs-al/
description: It's time to ditch whatever messaging platform you're using. Join Matrix, the federated chat platform that actually respects you.
---

## How does Matrix compare to other platforms?

If the [reasons](../#why-matrix) did not convince you, then this page will show you how your existing platform compares with Matrix. Note that the guide only judges the de/merits of the platform itself, not its population (as network effect is used to keep users in [walled gardens](https://en.wikipedia.org/wiki/Closed_platform)). This comparison is also somewhat general, and improvements are welcomed. However, remember that an advantage that Matrix has is that with adequate setup, you can [bridge](../features/#all-about-bridges) other platforms!

Before we begin, it should be reminded that Matrix is a mix of security and socialization. Recall what we've wrote:

> Matrix is the long-awaited middleground between one-to-one messaging platforms (Facebook Messenger, WhatsApp, iMessages, SMS...) and social/collaborative messaging platforms (Discord, Slack, Telegram...): It offers an appropriate degree of privacy while allowing you to socialize/collaborate with others.

This means that Matrix *on its own*[^1] provides a certain degree of flexibility, allowing you to have more private conversations and open group collaborations at the same time, rather that providing absolute security for everything. If you insist on the latter, this guide suggests you to look elsewhere.

The comparisons for [Discord](../matrix-vs-discord) and [Telegram](../matrix-vs-telegram) are written on separate pages.

### Centralized platforms

Most platforms you see on the market fall into this category.

The most important advantage of Matrix over these platforms is that Matrix is decentralized. This means that:

* There is no one entity controlling the day-to-day operations[^2] of the entire platform.
  * This prevents any entity from making unilateral decisions, particularly those that may hurt users.
  * While incidents (such as outage, acquisitions, and shutdowns) may affect one instance, they do not affect the entire platform, ensuring its longetivity and stability. (For example, incidents like [the Facebook outage on Oct 4, 2021](https://en.wikipedia.org/wiki/2021_Facebook_outage), where a configuration error on one server brought several Facebook-owned platforms to a complete halt, cannot happen to a federated platform.)
* You can either trust one of the several entities (an instance) that holds your data, or hold the data yourself (by running an instance), whereas using centralized platforms requires you to trust the sole owner of the platform, who exclusively receives your private data and can do anything with it in any fashion it wants.

Matrix allows users to encrypt their message contents, whereas:

* Centralized unencrypted platforms (such as Discord, Facebook Messenger, Instagram Direct, Revolt[^3], Slack, Snapchat, Telegram cloud chats[^4], QQ and WeChat) allow unobscured access to messages by the sole owner of each platform.
* Centralized platforms that do not fully disclose details about their encryption algorithm (such as iMessage, [Line](https://citizenlab.ca/2017/08/linesecurity/), Telegram secure chats[^4], Viber[^5] and WhatsApp[^6]) cannot have their security independently verified.

Furthermore,

* Some "secure" platforms (such as Signal and WhatsApp) require you to provide a phone number or email address. Most Matrix homeservers do not require phone numbers. Depending on setup (either selfhost or with certain public homeservers), it may be possible to use Matrix without an email address as well.
* Although Signal receives widespread approval (and is probably the best centralized messaging platform in existence[^7]), its credibility continues to be subjected to ongoing debate: Its US jurisdiction, its dependence on AWS, its hostile stance towards forked clients, its delay in publishing source code, its controversial implementation of the spam detection mechanism... Whereas Matrix is [open](https://matrix.org/blog/2020/01/02/on-privacy-versus-freedom): freedom to choose jurisdiction, freedom from depending on specific third parties, freedom to choose clients, and transparency for everyone.

### Session

Session claims to be decentralized, but since the platform requires an ever-increasing amount[^8] of cryptocurrency stake for each node, running one is unreachable for most people (whereas for Matrix, there exists no such requirement from the platform), so the amount of nodes will eventually reach a finite ceiling, making it only marginally better than Signal.

### Another federated platform: XMPP

XMPP and Matrix are very similar: most of [these](../#why-matrix) also apply to XMPP. The difference is that Matrix is much *much* more intuitive for an ordinary user, whereas XMPP is far from it.

* XMPP is relatively barebone, which may not be able to serve modern communication needs.
* Clients are spread across different platforms and may support different features differently, making no client one-size-fits-all.

Furthermore, XMPP is not encrypted by default, but use of OMEMO is also quite widespread. Still, it has the same [metadata problem](https://infosec-handbook.eu/articles/xmpp-aitm/) [as Matrix](../#fn:1). However, it is true that XMPP servers are lighter than Matrix, since in XMPP, most of the heavy work is done by the clients, whereas in Matrix, the homeservers need to constantly store things.

For reference, the official comment from matrix.org is [here](https://matrix.org/faq/#what-is-the-difference-between-matrix-and-xmpp%3F).

### Peer-to-peer platforms

Platforms like Briar, Cwtch and Jami offer much more security, but at a huge cost in terms of utility due to their peer-to-peer nature, requiring participants to be online to receive messages.

## Footnotes

[^1]: Specifically, using the public Matrix federation. Some Matrix implementations (like the French government's *Tchap*) may have utilized closed federations and extended features for specific purposes, thereby providing more communication security.

[^2]: i.e. Excluding development. But even so, Matrix allows its users to participate in the decision-making process.

[^3]: However, they [plan](https://github.com/orgs/revoltchat/projects/3/views/1?filterQuery=encr) to offer encryption in the undetermined future.

[^4]: Cloud chat is not encrypted in transit and is thus considered unencrypted. Secure chat uses Telegram's own MTProto protocol, comes with serious limitations on features, and is not widely used.

[^5]: Viber claims to use an encryption mechanism that is similar - but not identical - to the Signal protocol.

[^6]: Although Signal [claims](https://signal.org/blog/whatsapp-complete/) that WhatsApp is using the Signal protocol, WhatsApp's closed-source nature prevents independent verification.

[^7]: In terms of both tech and reach (hence excluding Threema).

[^8]: Relative to fiat currencies.
