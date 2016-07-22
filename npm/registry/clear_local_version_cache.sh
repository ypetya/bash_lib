function npm.registry.clear_local_version_cache() {
	unset DEV_DEPLOY_VERSIONS UAT_DEPLOY_VERSIONS PROD_DEPLOY_VERSIONS
}
