function git.push() {

	git push | tee >( sed -n s/remote:\s+//p )
}
