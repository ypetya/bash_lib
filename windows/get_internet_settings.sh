#!/bin/bash

function windows.get_internet_settings() {
  reg query "HKEY_CURRENT_USER\
\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
}
