# tN Tools

Usage:

    export IRG_OUTPUT_DIR="$(pwd)/output"
    export IRG_CS_USER_URL="https://content.bibletranslationtools.org/WycliffeAssociates"
    export IRG_CS_USER_NONENG_URL="https://content.bibletranslationtools.org/WA-Catalog"
    # export TN_ADDITIONAL_PARMS="--lang lpx --book tit"
    # export TN_ADDITIONAL_PARMS="--lang lpx --book luk"
    export TN_ADDITIONAL_PARMS="--lang ml --book gen exo"
    docker-compose build --no-cache
    # docker-compose build
    docker-compose up
