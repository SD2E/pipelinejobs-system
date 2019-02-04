=================
Pipelines Manager
=================

This Reactor enables creation and management of Data Catalog **Pipelines**.

Pipelines
---------

Pipelines are defined using document written in the **Pipeline**
`JSON schema <https://schema.catalog.sd2e.org/schemas/pipeline.json>`_. Here is
a brief, slightly silly example:

.. literalinclude:: my_pipeline.json
   :language: python

A Pipeline is a human-readable name and description, a globally-unique string
identifier, and a list of components that defines some number of Abaco Actors,
Agave Apps, Deployed Containers, and Web Services. Additionally, one or more
data "processing levels" are provided as well as the list of file types
accepted and emitted. Of these fields, only ``components`` is used to create a
Pipeline UUID that connects each Pipeline to its compute jobs.

To make this very tangible: In the example above, if *anything*n in ``components``
changes, the result will have to be a new UUID. If the name, file types,
description, or description change, the UUID remains the same.

Messages
--------

All Pipeline management actions are accomplished by sending JSON-formatted
messages to the **Pipelines Manager** Reactor.

Create a New Pipeline
---------------------

A new pipeline can be registered by sending its JSON document to the
**Pipelines Manager** as a message like so:

.. code-block:: console

    $ abaco run -m "$(jq -c . my_pipeline.json)" G1p783PxpalBB

    gOvQRGRVPPOzZ

    # Wait a few seconds

    $ abaco logs G1p783PxpalBB gOvQRGRVPPOzZ

    EGe6NKeo8Oy5 DEBUG Action selected: create
    EGe6NKeo8Oy5 INFO Created pipeline 1064aaf1-459c-5e42-820d-b822aa4b3990 with update token 0df45d5e9e0f31e2

Note the pipeline's UUID (``1064aaf1-459c-5e42-820d-b822aa4b3990``). This is
needed to configure **PipelineJobs** that reference this **Pipeline**. Also
note the update token (``0df45d5e9e0f31e2``). This is needed to update the
Pipeline at a later date.

Update a Pipeline
-----------------

A pipeline's *components* cannot be updated, but its human-readable name and
description can be. To accomplish this, edit the pipeline JSON document with
new or amended values and send it to the **Pipelines Manager** along with
a valid update token.

.. code-block:: console

    $ abaco run -m "$(jq -c . my_pipeline.json)" -q token=0df45d5e9e0f31e2 G1p783PxpalBB

    e5QKEW8L0BeZ4

    # Wait a few seconds

    $ abaco logs G1p783PxpalBB e5QKEW8L0BeZ4

    EkBWRvV1gKG1a DEBUG Action selected: update
    EkBWRvV1gKG1a INFO Updated pipeline 1064aaf1-459c-5e42-820d-b822aa4b3990 with update token 0df45d5e9e0f31e2

.. note: If the pipeline's components have changed, a new UUID will be returned!

Retire a Pipeline
-----------------

A pipeline cannot be deleted, but it can be retired from active service.

*Coming soon...*

.. _JSONSchemas:

JSON Schemas
------------

.. literalinclude:: schemas/create.jsonschema
   :language: json
   :linenos:
   :caption: pipeline_manager_create

.. literalinclude:: schemas/update.jsonschema
   :language: json
   :linenos:
   :caption: pipeline_manager_update

.. literalinclude:: schemas/deletejsonschema
   :language: json
   :linenos:
   :caption: pipeline_manager_delete
