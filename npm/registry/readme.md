Helpers for custom npm registry (instances DEV,QA,PROD)
===============================

These helpers support environment dependent npm registries.

* http_service_call : defines the method how to get package versions for an environment
* fetch_versions : fetches all the artifact versions available for every environment and stores it in local
* get_version : returns artifact version for environments ( if no DEV_DEPLOY_VERSIONS initializes a fetch )

DEV,QA,PROD environment registries are supported