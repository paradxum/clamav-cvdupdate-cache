#!/bin/sh

sleep `cat /sleeptime`

echo Running cvd update
cvd update
