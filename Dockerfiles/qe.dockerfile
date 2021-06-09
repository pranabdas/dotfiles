# Ubuntu for high performance computing
# consult: https://packages.ubuntu.com/search?arch=any&keywords=quantum-espresso
# docker build -t qe -f qe.dockerfile .

FROM ubuntu:focal

RUN mkdir -p /usr/qe && \
    groupadd -r qe && \
    useradd -r -g qe -d /usr/qe -s /sbin/nologin -c "qe user" qe

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update --fix-missing; apt upgrade -yq; \
    apt install -yq --no-install-recommends \
    build-essential \
    ca-certificates \
    libblas3 \
    libc6 \
    libfftw3-dev \
    libgcc-s1 \
    gfortran \
    liblapack-dev \
    libopenmpi-dev \
    libscalapack-openmpi-dev \
    wget \
    tcl \
    tcllib

WORKDIR /usr/qe

RUN wget https://github.com/QEF/q-e/releases/download/qe-6.7.0/qe-6.7-ReleasePack.tgz && \
    tar xzf qe-6.7-ReleasePack.tgz && \
    rm qe-6.7-ReleasePack.tgz && \
    cd qe-6.7 && \
    ./configure && \
    make all && \
    echo 'export PATH="/usr/qe/qe-6.7/bin:$PATH"' >> ~/.bashrc && \
    cd /usr/qe && \
    wget "http://pwtk.ijs.si/download/pwtk-2.0.tar.gz" && \
    tar xzf pwtk-2.0.tar.gz && \
    rm pwtk-2.0.tar.gz && \
    echo 'export PATH="/usr/qe/pwtk-2.0:$PATH"' >> ~/.bashrc

RUN chown -R qe:qe /usr/qe
USER qe
WORKDIR /home

