# Server Scripts

These are useful bash scripts for setting up websites using nginx. This is not the only way to setup websites. This is how I setup websites.

NOTE: While anyone is welcome to use these, and while they should work fine, I take absolutely no responsibilty for anything which may go awry while using them.

Most of the files here are for individual tasks, but there are four scripts which you may find useful:

## `provision-static-site.sh`

This script configures a static site in nginx - it will just look for files in some directory. It creates a certificate, makes the relevant directory, and creates a placeholder index.html.

It requires nginx and letsencrypt. You give it a domain name and, optionally, a location for the website directories folder (default is $HOME).


## `provision-spa-site.sh`

Exactly the same as the static site provisioning script, except nginx will serve index.html if it gets an unfamiliar URL, rather than returning 404. This is the required behaviour for single page application frameworks like react.

## `provision-django-site.sh`

This script configures a django site in nginx - incoming requests are passed to gunicorn apart from /static/ and /uploads/ URLs.

No database stuff is done.

It requires nginx, letsencrypt, python, and uses systemd. You give it a domain name, a python executable name and, optionally, a location for the website directories folder (default is $HOME).

## `delete-site.sh`

Deletes a website on the server - SSL certificates, nginx conf files, source files - everything pertaining to this website (apart from database stuff) will be deleted.

Use with caution, and again - I accept no responsibility for anything unexpected that might happen. I have used this script many times since writing it and it always goes fine, but you never know...
