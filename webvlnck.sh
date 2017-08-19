#!/bin/bash

# directory in the web root which is writable by the web server user.
# 
# Detect vulnerability of MediaWiki : 
#
# About: https://www.mediawiki.org/wiki/Manual:Security#Upload_security


By default, file extensions .png, .gif, .jpg, and .jpeg are white listed ($wgFileExtensions).
Various executable and script extensions are explicitly blacklisted ($wgFileBlacklist) even if you allow users to override the whitelist ($wgStrictFileExtensions).
