Send a Bearer Token
===================

Requests authenticated using a Bearer token run as the TACC.cloud identity of
the user that issued the token. This is usually your account (or a role account
if you have appropriate credentials).

Usage Example
-------------

.. code-block:: shell

    curl -XPOST -H "Authorization: Bearer 969d11396c43b0b810387e4da840cb37" \
        --data '{"uuid": "1073f4ff-c2b9-5190-bd9a-e6a406d9796a", \
        "token": "0dc73dc3ff39b49a",\
        "name": "finish"}' \
        https://<tenantUrl>/actors/v2/<actorId>/messages
