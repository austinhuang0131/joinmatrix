---
title: Matrix vs. Discord
layout: page-two-col
nav: false
parent: guide
permalink: guide/matrix-vs-discord/
---

## Matrix vs. Discord

Welcome!

Matrix has long been a alternative to Discord, but many people still don't get the why. We will start with why you should move from Discord to Matrix, followed by comparisons of specific feature and some helpful tips. But before we do that, let's start with...

## A Discussion on the Proper Definition of "Server"

Recall the computing [definition](https://en.wiktionary.org/wiki/server#Noun) of the word "server":

> 1. A program that provides services to other programs or devices, either in the same computer or over a computer network.
>
> 2. A computer dedicated to running such programs.

The definitions can hold true for a server for a multiplayer game (eg. Minecraft), a server reserved for a group of people for communication (eg. Mumble & TeamSpeak), and a server where Discord bots are being operated from. In each case, the server software (such as the Minecraft server jar file) meets definition #1, whereas the server infrastructure (eg. VPS) meets definition #2.

But that's not the case for a Discord "server": It's just some data, together with data of other "servers," resting on Discord's computational servers. A Discord "server" is not a program on its own, nor has any infrastructure been dedicated to any specific "server," thus violating both definitions. Presumably to attract gamers who often utilizes the correct "server" concept, Discord attempts to equate it to a chat group, muddying the waters for the definition of this technical term. (Hence Discord refers to "servers" as *guilds* in API documentations.)

### What about Matrix?

In Matrix, a *homeserver* is a server, in that it meets both definitions: Dedicated infrastructures (definition #2) running [a server software](../#set-up-own-homeserver-or-join-an-existing-homeserver) (definition #1). Furthermore, these homeservers, while operated independently of each other and not under control of a sole entity, communicate (transmitting messages and such) with each other using an agreed-upon protocol, thereby keeping the Matrix platform alive. Platforms using such structure is called a federated platform.

### "Federated"? Why should that matter?

Because...

* [You can set up your own homeserver, or join an existing server.](../#set-up-own-homeserver-or-join-an-existing-homeserver) You have control over where your private data goes, without jeopardizing access to the platform.
* A platform cannot make unilateral decisions on its own: It must reach community consensus.

## Why not Discord?

I'm sure you can find a lot of valid criticisms of Discord, like [here](https://cadence.moe/blog/2020-06-06-why-you-shouldnt-trust-discord) or [here](https://austinhuang.me/discord-issues). Give them a read if you have time.

In the scope of this guide, the key reasons to move away from Discord are:

* **Lack of privacy for private communications**, as private conversations are not only unencrypted, but also actively scanned (just check your settings).
* Discord has made **decisions against the users' best interests**, with the most recent ones being
  * Biased consultations and unilateral proposal of [cryptocurrency integrations](https://www.reddit.com/r/discordapp/comments/qpmhs5/discord_developers_please_do_not_support_nfts/) (which were only dropped after massive backlash), and
  * Mandatory rollout of slash commands, as well as KYC requirements, for running bots (which were *not* dropped despite [backlash](https://gist.github.com/Rapptz/4a2f62751b9600a31a0d3c78100287f1)).
* **Excessive tracking that cannot be opted-out**, such as the [science endpoint](https://luna.gitlab.io/discord-unofficial-docs/science.html) and the process logger (for activity status).
* **Hostile stance against unofficial clients or client modifications**, thus preventing users from opting out of certain annoyances or tracking.

[Matrix addresses all of the above](../#why-matrix).

## Feature comparison

...

## Helpful Tips

* There is a [bridge](https://t2bot.io/discord) that allows you to connect a Discord channel with a Matrix room. (Although, backlinking Matrix data to Discord will reduce its privacy, so please take ethical concerns into account when using it.)
* ...