# use cached image on codespaces + py39
# see https://github.com/beproud/codespaces/tree/main/universal-py39
FROM ghcr.io/beproud/codespaces/universal-py39:latest

USER root

# # Setup default python tools in a venv via pipx to avoid conflicts
# ENV PIPX_HOME=/usr/local/py-utils \
#     PIPX_BIN_DIR=/usr/local/py-utils/bin
# ENV PATH=${PATH}:${PIPX_BIN_DIR}
# RUN bash /tmp/library-scripts/python-debian.sh "none" "/usr/local" "${PIPX_HOME}" "${USERNAME}" \ 
#     && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# # Remove library scripts for final image
# RUN rm -rf /tmp/library-scripts

# # [Optional] If your pip requirements rarely change, uncomment this section to add them to the image.
# COPY backend/requirements/constraints.txt /tmp/pip-tmp/requirements.txt
# RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
#     && rm -rf /tmp/pip-tmp

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-here>

USER ${USERNAME}