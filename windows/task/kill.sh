function windows.task.kill() {
	taskkill.exe //F //PID "{1?param missing - pid}"
}
