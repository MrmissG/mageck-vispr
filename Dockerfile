FROM python:3.6
LABEL maintainer "Martin Marcher <martin@marcher.name>"

RUN curl --silent --location -o /Miniconda3-latest-Linux-x86_64.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash /Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3 && \
    rm -f /Miniconda3-latest-Linux-x86_64.sh && \
    /opt/miniconda3/bin/conda config --add channels conda-forge && \
    /opt/miniconda3/bin/conda config --add channels defaults && \
    /opt/miniconda3/bin/conda config --add channels r && \
    /opt/miniconda3/bin/conda config --add channels bioconda && \
    /opt/miniconda3/bin/conda install --yes --quiet mageck-vispr=0.5.3 && \
    /opt/miniconda3/bin/conda clean --yes --all && \
    echo All Done

ENTRYPOINT ["/opt/miniconda3/bin/vispr"]
