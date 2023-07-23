---
title: List of Public Matrix Homeservers
ntitle: Public Homeservers
layout: page
nav: true
permalink: servers/
description: Support the decentralization of Matrix by getting your account on an alternative homeserver!
---

<script>
document.addEventListener('DOMContentLoaded', (event) => {
  Array.from(document.getElementsByTagName("tr")).forEach(r => {
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
    i = r.children.length - 1;
    if (c[i].textContent == "Error!!")
      c[i].classList.add("red");
    else if (c[i].textContent.indexOf("Dendrite") == -1 && c[i].textContent.match(/\d+\.\d+\.\d/) != null) {
      let v = parseFloat(c[i].textContent.match(/\d+\.\d+\.\d/)[0].substring(2));
      c[i].classList.add(v >= 85.0 ? (v >= 85.0 ? "green" : "blue") : "orange");
    }
  })
})
</script>

## List of Public Matrix Homeservers

This is a list of public Matrix homeservers as compiled by the author of this guide. Remember:

* **Please do not register on multiple homeservers.** Abusing the limited resources that those servers offer will only discourage others from running new public homeservers. If you're testing one's performance, please do so *one at a time*, and clean up (delete the account) if you choose not to use that homeserver.
* For long-term usage, choose a homeserver that you trust, [is properly federated](https://federationtester.matrix.org/), has a high version number, has an environment suitable to your use, and is designed to last.
* Any homeserver you choose gets to access all the unencrypted data about your account!
* **It bears reminding** that all participants of public discourse should foster a respectful environment, and that homeserver operators should discourage disruptive behaviour. As such, this list excludes homeservers that are known to harbour bad actors. Refer to [Criteria](#criteria).
* This list is also available [as a JSON](../servers.json). Clients are welcomed to implement it as long as sufficient credit is given.

**Disclaimer:**

* Inclusion does **NOT** imply any opinion (affiliation, endorsement, etc.) on individual homeservers, nor any guarantee regarding their availability.
* This list is provided "as is." Any dispute regarding your account on one of the homeservers should be resolved between you and the operator(s) of the homeserver.

See [Legends](#legends) for column explanations.

{% capture my_include %}{% include matrix_prod.md %}{% endcapture %}
{{ my_include | markdownify }}

## Why?

Ideally you would host your own homeserver, but not everyone has the means... Anyway, you should use a homeserver other than the default `matrix.org` because...

1. It is overloaded at times, and
2. If everyone continues to register on the same homeserver, then Matrix will become less decentralized as intended.

In some cases you might also want your MXID to show your affiliation with a specific community.

## Criteria

The absolute criteria are:

* The homeserver is intended for public registration.
  * Generally, inclusion is based on either my interpretation of information about the homeserver, or explicit consent from the homeserver operator(s).
  * Homeservers that grant accounts on approval must have such process accessible to the general public.
  * Homeservers may disable registrations temporarily, in which case the list will temporarily exclude them.
* The homeserver name must be a second-level domain (so `example.com` is acceptable, but `matrix.example.com` is not). See [Synapse documentation](https://matrix-org.github.io/synapse/latest/delegate.html).
* The homeserver does not operate through a free TLD, specifically those offered by Freenom (due to risks of takeover by fraudulent entities).
* The domain that the homeserver is on must have at least one meaningful web page (including Element).
* The homeserver is neither `matrix.org` nor operated by Element Matrix Services (previously known as Modular).
* The homeserver does not have an ongoing Mjolnir server ban (`m.room.rule.server`) on:
  * `#matrix-org-coc-bl:matrix.org`: [matrix.org Code of Conduct](https://matrix.org/legal/code-of-conduct/) ban list. It is used on many popular public rooms.
  * `#matrix-org-hs-tos-bl:matrix.org`: [matrix.org Homeserver Terms of Service](https://matrix.org/legal/terms-and-conditions/) ban list.

Some homeservers are excluded from this list on content and/or reputation grounds.

Homeserver owners should implement [MSC1929](https://github.com/matrix-org/matrix-doc/blob/hs/proposal-admin-contact-1/proposals/1929-admin-contact.md) as well as provide rules and/or privacy policies, but they're not required.

## Legends

From left to right:

* **Homeserver name**: This is the part that follows your username. For example, my ID is `@austin:tchncs.de`, where `austin` is my username and `tchncs.de` is the display name of the homeserver. See [here](https://spec.matrix.org/v1.1/server-server-api/#resolving-server-names) for a technical explanation.
* **Jurisdiction (and Server location)**: The jurisdiction the homeserver is located within. The server location, if differs from the jurisdiction of the homeserver, is shown in the brackets. Note that generally, homeservers located in Germany are more actively moderated due to [legal and social contexts](https://en.wikipedia.org/wiki/Censorship_in_Germany#Re-unified_Germany_(1990%E2%80%93present)).
* **Rules?**: The existence of written rules/ToS for all users on the homeserver. Note that rules can only be considered if they apply to all activities (not just those in specific rooms) of a user, and if they are published in a webpage (including but not limited to `/_matrix/consent`). An "unclear" or "sort of" (colored yellow) means that the rules' scope or wording is unclear.
* **Privacy Policy?**: The existence of written privacy policy for all users on the homeserver. Generally, most parts of the ["Understand how your data is used" notice](https://matrix-client.matrix.org/_matrix/consent?v=1.0) apply network-wide. Note that a privacy policy can only be considered if it is explicitly applied to the Matrix homeserver, is published in a webpage (including but not limited to `/_matrix/consent`), and is not a copy of the aforementioned notice. An "unclear" or "sort of" (colored yellow) means the privacy policy's scope or wording is unclear.
* **Note**: Miscellaneous remarks. Note that a homeserver's theme/orientation can sometimes be seen from the domain itself, in which case it will not be noted down here. Anti-features are *italicized*.
  * Age restriction: Matrix is 16+. Homeservers that require users to be older are specified.
  * "Accessory": The homeserver is specifically intended for rooms related to the operator (usually a project), so please be considerate in listing rooms in the public room directory. However, the accounts can be used to access other federated rooms as well.
  * "Residential": The homeserver may be hosting on a residential internet connection.
  * "...-oriented": The homeserver is intended to serve the mentioned purpose.
  * "...-inclined": While the homeserver is not specifically intended to serve any purpose, it is nevertheless used for the mentioned purpose.
* **Registration method**: Exact registration procedure. Those are tested (but not necessarily thoroughly) on [the official Element web client](https://app.element.io) and, in most cases, should work for other clients as well.
  * "In-house Element": You may [register](../guide/#register-an-account) using the Element client hosted on the homeserver, which is linked. This is usually due to reCaptcha domain restriction.
  * "Form": You may register using the linked form.
  * "See info page": Refer to the page linked in the "server name" column.
  * "Manual": After clicking "Create Account" and "Edit," enter the server name (without `https://`) to [create an account](../guide/#register-an-account) on this homeserver.
  * "SSO": The homeserver requires [single sign-on](https://en.wikipedia.org/wiki/Single_sign-on) for authentication. You must create an account through the link prior to creating an account on the Matrix homeserver itself. Usually, the account can be used to access other services offered by the homeserver operator.
* **Version**: The software version of the homeserver, [updated every 6 hours by a GitHub Action](https://github.com/austinhuang0131/joinmatrix/blob/main/.github/workflows/matrix_ver.yml#L4).
  * Unless indicated otherwise, the homeserver is running Synapse.
    * Homeservers running versions prior to `1.85.0` are coloured yellow due to [vulnerabilities](https://github.com/matrix-org/synapse/releases/tag/v1.85.0).
    * Homeservers running a version released approximately more than 3 months ago are coloured blue. Currently the cutoff is `1.85.0`.
  * Homeservers that use Dendrite or have unparseable version strings are not coloured.
  * "Error!!" (coloured red): The homeserver cannot be reached at the time of checking. This is usually occasional, as frequent downtime are grounds for exclusion from this list.

## Other Matrix homeserver lists

* [CHATONS list](https://www.chatons.org/search/by-service?service_type_target_id=All&field_alternatives_aux_services_target_id=All&field_software_target_id=274&field_is_shared_value=All&title=): A list of homeservers hosted in France that adhere to certain ethical standards. Some may require membership.

This list was originally located at AustinHuang.me.
