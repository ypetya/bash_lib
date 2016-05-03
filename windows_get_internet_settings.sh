#!/bin/bash

function windows_get_internet_settings() {
  reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
}
