Authentication
^^^^^^^^^^^^^^

All POSTs to PipelineJobs components must be authenticated. There are two
mechanisms by which this can be accomomplished.

  1. Send a valid TACC.cloud Oauth2 Bearer token with the request
  2. Include a special URL parameter called a **nonce** with the HTTP request

.. only::  subproject and html

   Indices
   =======

   * :ref:`genindex`
