#!/bin/bash

git config --global user.email "dan@getitdunnrun.com"
git config --global user.name "getitdunnbot"

bundle exec middleman deploy
