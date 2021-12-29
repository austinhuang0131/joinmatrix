---
title: Questions & Answers
layout: page-two-col
nav: false
parent: guide
permalink: guide/qna/
---

## Questions and Answers

Miscellaneous clarifications and explanations.

## Other Matrix Guides

The following guides contain configurations that are specific to a homeserver, but most of the guidances apply across the Matrix federation:

* [matrix-help.envs.net](https://matrix-help.envs.net/)
* [Matrix at TU Dresden](https://doc.matrix.tu-dresden.de/en/)

## About This Guide

This guide is written by [Austin Huang](https://austinhuang.me) with the help of many people, whose feedback is greatly appreciated.

The `joinmatrix.org` domain is owned by [Jonah Aragon](https://www.jonaharagon.com/) on behalf of [Privacy Guides](https://www.privacyguides.org/), whose contribution is also greatly appreciated.

All contents of this guide are licensed under [Creative Commons Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/). Please link back to this website.

The logo is a derivative work of:

* [Matrix icon](https://commons.wikimedia.org/wiki/File:Matrix_icon.svg).
* [Green Stylish Arrow](https://commons.wikimedia.org/wiki/File:Green_Stylish_Arrow.svg). Copyright 2015 Vitor Mazuco. CC BY-SA 4.0.

This site is hosted on GitHub pages and thus [GitHub Privacy Statement](https://docs.github.com/en/github/site-policy/github-privacy-statement) applies.

This site uses analytics from [GoatCounter](https://goatcounter.com). It's [open source](https://github.com/zgoat/goatcounter). Here are [public stats for this website](https://joinmatrix.goatcounter.com) (The authors can see no more info than what you can see there) and [their privacy policy](https://www.goatcounter.com/privacy). You can disable this by blocking `gc.zgo.at` through your adblocker.

## Questions about Matrix

Check out [the official matrix.org FAQ](https://matrix.org/faq) as well!

### For average users, is Matrix trustworthy?

The tech? Yes, most of the components of Matrix are open source. The only exception that this guide is aware of is the Scalar integration manager, which Element and SchildiChat use as default. However, this guide [provides](../#pc-and-mobile) methods to use the open source [Dimension](https://github.com/turt2live/matrix-dimension) integration manager instead.

The operators? Note that you have the freedom to pick [your homeserver](../../servers). Do you trust big corporations, or small guys that are actually enthusiastic about privacy? Do your research.

The only thing that may negatively affect trust is Matrix's use of a central identity server `vector.im` (`matrix.org` is just an alias of it), which handles contact discovery through email. However, as of late 2021 it can only be enabled on an opt-in basis. Furthermore, you can start a DM based on their MXID, so email is not required.

### How is Matrix funded?

* The Matrix.org Foundation C.I.C., who develops the protocol and runs the matrix.org homeserver, is funded by [donations](https://matrix.org/faq/#who-and-how) (including from New Vector).
* New Vector Ltd, who develops Element and offers commercial services related to Matrix, is funded by [investors](https://element.io/blog/tag/investment/).
* Homeservers are independently funded. Some solicit donations. Others operate homeservers as part of a business.

#### What about Israeli intelligence?

If, somehow, that you even *believed* this conspiracy theory, then consider:

* It is [true](https://matrix.org/faq/#who-and-how) that Matrix was created by a bunch of employees in Amdocs, but just because Amdocs have allegedly done certain things doesn't mean these employees have done the same things? Since when are we defining people by where they work? Also, Tor is partially funded by the U.S. government, but why is nobody saying the same thing about Tor?
* Data (including metadata) is only provided to homeservers that are in a room. So if a user on homeserver A is talking to a user on homeserver B, any data will only be present on homeservers A and B, not any other homeserver (unless someone else from a different homeserver is invited into the room). Furthermore, [XMPP has the same issue](https://infosec-handbook.eu/articles/xmpp-aitm/). And as always, if you're concerned about where your data will end up, you (and your friends) can always [spin up your own homeserver](../#set-up-your-own-homeserver-or-join-an-existing-homeserver)!
* Matrix is well-funded because people believed in an open communication protocol. And their funding has paid off: We now have a well-built open communication protocol.

#### What about cryptocurrency funding?

People [did ask for this](https://www.reddit.com/r/discordapp/comments/qq4qx3/is_there_a_discord_replacement_that_doesnt/hjy61jo/?context=3) during the [Discord NFT incident](../matrix-vs-discord/#why-not-discord). Now, it is true that Matrix is sponsored by a few cryptocurrency-related companies, but consider:

* Open source projects are under no obligation to cater to their sponsors, so these sponsors usually just get a shoutout, that's it. Remember, donations are not commercial funding.
* Furthermore, [Matrix is well-funded commercially](https://www.matrix.org/blog/2019/10/10/new-vector-raises-8-5-m-to-accelerate-matrix-riot-modular) and need not to cater to cryptobros.
* Furthermore, because the Matrix platform is decentralized, and because the components of Matrix are open source,
  * Pushing crypto onto a client (like Element) will directly result in a fork undoing such changes,
  * Pushing crypto onto the homeserver software (like Synapse) will not only result in a fork undoing such changes, but also the effective fragmentation of the federation (since a portion of the homeservers will now use the non-crypto fork which may or may not be compatible with the one that has crypto), which is self-destructive.

Thus, even with funding, it will be very difficult for Matrix to even attempt trying to integrate something the community does not want.

Also, if you insist that you refuse to use any platform that has ever been involved with cryptocurrencies, then there will be very, very few platforms that you can use. Think about it.
