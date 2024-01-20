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

The `joinmatrix.org` domain is donated by [Jonah Aragon](https://www.jonaharagon.com/), whose contribution is also greatly appreciated.

All contents of this guide are licensed under [Creative Commons Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/). Please link back to this website.

The logo is a derivative work of:

* [Matrix icon](https://commons.wikimedia.org/wiki/File:Matrix_icon.svg).
* [Green Stylish Arrow](https://commons.wikimedia.org/wiki/File:Green_Stylish_Arrow.svg). Copyright 2015 Vitor Mazuco. CC BY-SA 4.0.

### Privacy

This site is hosted on GitHub pages and thus [GitHub Privacy Statement](https://docs.github.com/en/github/site-policy/github-privacy-statement) applies.

This site uses analytics from [GoatCounter](https://goatcounter.com). It's [open source](https://github.com/zgoat/goatcounter). Here are [public stats for this website](https://joinmatrix.goatcounter.com) (The authors can see no more info than what you can see there) and [their privacy policy](https://www.goatcounter.com/privacy). You can disable this by blocking `gc.zgo.at` through your adblocker.

No cookies.

### Translations

You can translate this guide to your own language. However, to be endorsed by this website, the translations are subject to the following conditions:

1. Remember the human. Do *whatever* you think is best for the advocacy of Matrix usage in your cultural context. This means that you have flexibility over how exactly to translate the texts.
2. The [homeserver list](../../servers) is off-limits. You may, however, incorporate relevant information (such as how to read the list) in the guide. You may also suggest (but not endorse) homeservers according to your cultural context.
3. You are under no obligation to use any specific theme or any static site generator at all - All I ask is please make sure the translations form a standalone website that is good-looking.
4. You are responsible for hosting that allows a custom subdomain (GitHub/GitLab/Gitea pages is fine).

After you've done that, please [create an issue](https://github.com/austinhuang0131/joinmatrix/issues) to get your CNAME (language code `.joinmatrix.org`).

## Questions about Matrix

Check out [the official matrix.org FAQ](https://matrix.org/faq) as well!

### For average users, is Matrix trustworthy?

The tech? Yes, most of the components of Matrix are open source. The only exception that this guide is aware of is the Scalar integration manager, which Element and SchildiChat use as default. (The open source [Dimension](https://github.com/turt2live/matrix-dimension) integration manager has been abandoned.)

The operators? Note that you have the freedom to pick [your homeserver](../../servers). Do you trust big corporations, or small guys that are actually enthusiastic about privacy? Do your research.

The only thing that may negatively affect trust is Matrix's use of a central identity server `vector.im` (`matrix.org` is just an alias of it), which handles contact discovery through email. However, as of late 2021 it can only be enabled on an opt-in basis. Furthermore, you can start a DM based on their MXID, so email is not required.

### How is Matrix funded?

* The Matrix.org Foundation C.I.C., who develops the protocol and runs the matrix.org homeserver, is funded ["through a combination of community support, corporate sponsorship, and grant funding"](https://matrix.org/docs/legacy/faq/#how-is-matrix-org-funded).
* New Vector Ltd, who develops Element and offers commercial services related to Matrix, is funded by [investors](https://element.io/blog/tag/funding/).
* Homeservers are independently funded. Some solicit donations. Others operate homeservers as part of a business.
