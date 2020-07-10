FROM python:2.7-slim-stretch

COPY depends /installs
COPY ["icon-tn.png", "/working/"]

# Install packages
RUN apt-get update && apt-get install -y \
        curl \
        fonts-noto \
        fontconfig \
        git \
        lmodern \
        texlive-fonts-recommended \
        texlive-xetex \
    # Install pip requirments with specific versions
    && pip install -r /installs/requirements.txt \
    # get the necessary tools
    && git clone "https://github.com/WycliffeAssociates/tools.git" /tools \
    # Install specific Pandoc version
    && dpkg -i /installs/pandoc-1.15.0.6-1-amd64.deb \
    # Install specific fonts
    && mkdir -p ~/.local/share/fonts/Raleway \
    && unzip /installs/Raleway.zip -d ~/.local/share/fonts/Raleway \
    && fc-cache -f -v \
    #Clean up
    && rm -r /installs \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /working/tn-temp

# Copy entrypoint last as it's more likely to change
COPY ["entrypoint.sh", "/root/entrypoint.sh"]
RUN chmod +x /root/entrypoint.sh

# Launch entrypoint.sh
ENTRYPOINT /root/entrypoint.sh
