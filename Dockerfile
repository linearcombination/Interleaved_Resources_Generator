# FROM python:2.7-slim-stretch
FROM analyticdelta/python2.7-slim-stretch-with-texlive:v1.0

COPY depends /installs
COPY ["icon-tn.png", "/working/"]

# Install packages
# RUN apt-get update && apt-get install -y \
#         curl \
#         fonts-noto \
#         fontconfig \
#         git \
#         lmodern \
#         texlive-fonts-recommended \
#         texlive-xetex \
#     # Install pip requirements with specific versions
#     && pip install -r /installs/requirements.txt \
#     # get the necessary tools
#     # Install specific Pandoc version
#     && dpkg -i /installs/pandoc-1.15.0.6-1-amd64.deb \
#     # Install specific fonts
#     && mkdir -p ~/.local/share/fonts/Raleway \
#     && unzip /installs/Raleway.zip -d ~/.local/share/fonts/Raleway \
#     && fc-cache -f -v \
#     #Clean up
#     && rm -r /installs \
#     && rm -rf /var/lib/apt/lists/* \
#     && mkdir /working/tn-temp \
#     # && git clone "https://github.com/WycliffeAssociates/tools.git" /tools \
#     # && git clone "https://github.com/linearcombination/tools.git" /tools \
#     && git clone "~/src/WA/github.com/linearcombination/tools.git" /tools
    # Install pip requirements with specific versions
RUN pip install -r /installs/requirements.txt \
    # get the necessary tools
    # Install specific Pandoc version
    && dpkg -i /installs/pandoc-1.15.0.6-1-amd64.deb \
    # Install specific fonts
    && mkdir -p ~/.local/share/fonts/Raleway \
    && unzip /installs/Raleway.zip -d ~/.local/share/fonts/Raleway \
    && fc-cache -f -v \
    #Clean up
    && rm -r /installs \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /working/tn-temp \
    # && git clone "https://github.com/WycliffeAssociates/tools.git" /tools \
    && git clone "https://github.com/linearcombination/tools.git" -b develop --single-branch /tools


# Copy entrypoint last as it's more likely to change
COPY ["entrypoint.sh", "/root/entrypoint.sh"]
RUN chmod +x /root/entrypoint.sh

# For development without having to push all changes we want to try.
# tools is sylinked from ~/src/WA/github.com/linearcombination/tools
# into .
# COPY tools /tools

# Launch entrypoint.sh
ENTRYPOINT /root/entrypoint.sh
