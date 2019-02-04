Authorization Tokens
====================

Update and delete actions for Pipelines and PipelineJobs are authorized via an
additional token scoped to the Pipelines system. There are two types:

* Document update token
* Administrative action token

A document update token authorizes management of **one specific**
Pipeline or Job. The token for a given document is returned after each update
or management action and allows future actions to be taken at any time in the
future. An administrative action token authorizes **any action** for
**any Pipeline or Job**. They are obtained via an external process, and only by
persons who possessing the **Administrator Token API Key**. Because they are
powerful, administrative action tokens expire after 30 seconds.

Sending a Token
---------------

A token must be sent with the requested action or event. It can be included in
the request message as field  (``"token": "<token>"``) or included as a URL
parameter ``token=<token>``.
