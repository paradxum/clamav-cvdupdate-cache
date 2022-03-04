# clamav-cvdupdate-cache
This image simply runs cvdupdate and publishs the cvd files as a root website on port 80

This is great if you are running a cluster, or multiple machines and want to use #2 from https://www.clamav.net/documents/private-local-mirrors

To configure clients to use it, in freshclam.conf set:
PrivateMirror http://**this pod/host name**:**exposed port**
ScriptedUpdates no

## Sample docker line
docker run --port 8085:80 -d ericschultz/clamav-cvdupdate-cache:latest

## Persistance
So you COULD add a volume for /var/lib/clamav so that the initial download does not have to happen every time.
But... I've never seen that as being a big deal.
