---
title: Public Homeservers
layout: page
nav: true
permalink: servers/
description: Support the decentralization of Matrix by getting your account on an alternative homeserver!
---

<script>
document.addEventListener('DOMContentLoaded', (event) => {
  Array.from(document.getElementsByTagName("tr")).slice(1).forEach(r => {
    let c = r.children;
    let i = 2;
    while(i < 4) {
      switch (c[i].textContent) {
        case "No":
          c[i].classList.add("red");
          break;
        case "Yes":
        case "CoC and ToS":
          c[i].classList.add("green");
          break;
        default:
          c[i].classList.add("orange");
      }
      i++;
    }
    if (c[7].textContent == "Error!!")
      c[7].classList.add("red");
    else if (c[7].textContent.indexOf("Dendrite") == -1) {
      c[7].classList.add(parseFloat(c[7].textContent.substring(2)) >= 47.1 ? "green" : "orange");
    }
  })
})
</script>

## List of public Matrix homeservers

This is a list of public Matrix homeservers as compiled by the author of this guide. Support for this list is provided at [`#public_servers:tchncs.de`](https://matrix.to/#/#public_servers:tchncs.de). Remember:

* For long-term usage, choose a homeserver that you trust, [is properly federated](https://federationtester.matrix.org/), has a high version number, has an environment suitable to your use, and is designed to last.
* Any homeserver you choose gets to access all the unencrypted data about your account!
* **It bears reminding** that all participants of public discourse should foster a respectful environment, and that homeserver operators should discourage disruptive behaviour. As such, this list excludes homeservers that are known to harbour bad actors. Refer to [Criteria](#criteria).

**Disclaimer:**

* Inclusion does **NOT** imply any opinion (affiliation, endorsement, etc.) on individual homeservers, nor any guarantee regarding their availability.
* This list is provided "as is." Any dispute regarding your account on one of the homeservers should be resolved between you and the operator(s) of the homeserver.

## List

See [Legends](#legends) for column explanations.

{% capture my_include %}{% include matrix_prod.md %}{% endcapture %}
{{ my_include | markdownify }}

## Why?

Ideally you would host your own homeserver, but not everyone has the means... Anyway, you should use a homeserver other than the default `matrix.org` because...

1. It is overloaded at times, and
2. If everyone continues to register on the same homeserver, then it will become more centralized, thus shifting away from the original goal of Matrix.

This list exists because...

1. It is necessary to let people discover other homeservers available to them,
2. It is necessary to let other homeservers be discovered by those interested,
3. Other existing lists suffer from low quality or abandonment, and
4. Practical aspects (such as rules) are often overlooked.

## Criteria

The absolute criteria are:

* The homeserver is intended for public registration.
  * Generally, inclusion is based on either my interpretation of information about the homeserver, or explicit consent from the homeserver operator(s).
  * Homeservers that grant accounts on approval must have such process accessible to the general public and are only considered on a case-by-case basis.
* The homeserver name must be a second-level domain (so `example.com` is acceptable, but `matrix.example.com` is not).
* The homeserver does not operate through a free TLD, specifically those offered by Freenom (due to risks of takeover by fraudulent entities).
* The homeserver is neither `matrix.org` nor operated by Element Matrix Services (previously known as Modular).
* The homeserver does not have an ongoing Mjolnir server ban (`m.room.rule.server`) on:
  * `#matrix-org-coc-bl:matrix.org`: [matrix.org Code of Conduct](https://matrix.org/legal/code-of-conduct/) ban list. It is used on many popular public rooms.
  * `#matrix-org-hs-tos-bl:matrix.org`: [matrix.org Homeserver Terms of Service](https://matrix.org/legal/terms-and-conditions/) ban list.

Some homeservers are excluded from this list on content grounds.

## Legends

From left to right:

* **Homeserver name**: This is the part that follows your username. For example, my ID is `@austin:tchncs.de`, where `austin` is my username and `tchncs.de` is the display name of the homeserver. See [here](https://spec.matrix.org/v1.1/server-server-api/#resolving-server-names) for a technical explanation.
* **Jurisdiction (and Server location)**: The jurisdiction the homeserver is located within. The server location, if differs from the jurisdiction of the homeserver, is shown in the brackets. Note that generally, homeservers located in Germany are more actively moderated due to [legal and social contexts](https://en.wikipedia.org/wiki/Censorship_in_Germany#Re-unified_Germany_(1990%E2%80%93present)).
* **Rules?**: The existence of written rules/ToS for all users on the homeserver. Note that rules can only be considered if they apply to all activities (not just those in specific rooms) of a user, and if they are published in a webpage (including but not limited to `/_matrix/consent`). An "unclear" or "sort of" (colored yellow) means that the rules' scope or wording is unclear.
* **Privacy Policy?**: The existence of written privacy policy for all users on the homeserver. Generally, most parts of the ["Understand how your data is used" notice](https://matrix-client.matrix.org/_matrix/consent?v=1.0) apply network-wide. Note that a privacy policy can only be considered if it is explicitly applied to the Matrix homeserver, is published in a webpage (including but not limited to `/_matrix/consent`), and is not a copy of the aforementioned notice. An "unclear" or "sort of" (colored yellow) means the privacy policy's scope or wording is unclear.
* **Privacy concerns?**: Any remarks regarding the configuration of the homeserver that *may be* of concern for user privacy.
  * "reCaptcha": Registering on the homeserver requires filling out a Google reCaptcha. This does not apply to logins. Due to reCaptcha configurations, it may be necessary to register on the homeserver's own Element client.
  * "Email": Registering on the homeserver requires an email address.
* **Note**: Miscellaneous remarks. Note that a homeserver's theme/orientation can sometimes be seen from the domain itself, in which case it will not be noted down here.
  * Age restriction: Matrix is 16+. Homeservers that require users to be older are specified.
  * "Accessory": The homeserver is specifically intended for rooms related to the operator (usually a project), however the accounts can be used to access other federated rooms as well.
  * "Residential": The homeserver may be hosting on a residential internet connection.
  * "...-oriented": The homeserver is intended to serve the mentioned purpose.
  * "...-inclined": While the homeserver is not specifically intended to serve any purpose, it is nevertheless used for the mentioned purpose.
* **Registration method**: Exact registration procedure. Those are tested (but not necessarily thoroughly) on [the official Element web client](https://app.element.io) and, in most cases, should work for other clients as well.
  * "In-house Element": You may [register](../guide/#register-an-account) using the Element client hosted on the homeserver, which is linked. This is usually due to reCaptcha domain restriction.
  * "See info page": Refer to the page linked in the "server name" column.
  * A domain: After clicking "Create Account" and "Edit," enter the domain as specified in this column (without `https://`) to [create an account](../guide/#register-an-account) on this homeserver. This discrepancy is usually due to the misconfiguration of `.well-known`.
  * "SSO": The homeserver requires [single sign-on](https://en.wikipedia.org/wiki/Single_sign-on) for authentication. You must create an account through the link prior to creating an account on the Matrix homeserver itself. Usually, the account can be used to access other services offered by the homeserver operator.
* **Version**: The software version of the homeserver, [updated daily by a GitHub Action](https://github.com/austinhuang0131/austinhuang0131.github.io/blob/master/.github/workflows/matrix_ver.yml#L5).
  * Unless indicated otherwise, the homeserver is running Synapse, where version `>=1.47.1` (coloured green) is [recommended](https://matrix.org/blog/2021/11/23/synapse-1-47-1-released) to address a security issue. Homeservers running older versions are coloured yellow.
  * Homeservers that use experimental implementations (ie. ones other than Synapse) are not coloured.
  * "Error!!" (coloured red): The homeserver cannot be reached at the time of checking. This is usually occasional, as frequent downtime are grounds for exclusion from this list.

## Other Matrix homeserver lists

* [asra.gr's list](https://wiki.asra.gr/en:public_servers): A raw dataset of homeservers that allows (but are not necessarily intended for) public registration.
* [German homeservers list](https://fediverse.blog/~/FossMessenger/matrix-server): A list of homeservers hosted in Germany.

---

This list was originally located at [AustinHuang.me](https://austinhuang.me/matrix-homeservers.html).

This list is featured in [This Week in Matrix](https://matrix.org/blog/2021/11/19/this-week-in-matrix-2021-11-19/) on November 19, 2021.