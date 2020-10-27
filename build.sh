#!/usr/bin/env bash

export IRG_WORKING_DIR="/working/temp"
export IRG_OUTPUT_DIR="$(pwd)/output"
export IRG_CS_USER_URL="https://content.bibletranslationtools.org/WycliffeAssociates"
export IRG_CS_USER_NONENG_URL="https://content.bibletranslationtools.org/WA-Catalog"
export TN_ADDITIONAL_PARMS="--lang ml --book gen exo"
export IN_CONTAINER=1 # The this is used, it can be any value other than nothing to indicate container environment
docker-compose build --no-cache
# docker-compose build
docker-compose up
