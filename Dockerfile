FROM debian:latest

ENV OUTDIR="/pico"
ENV JNUM=4
ENV GITHUB_PREFIX="https://github.com/raspberrypi/"
ENV GITHUB_SUFFIX=".git"
ENV SDK_BRANCH="master"

COPY ./1_create_out_dir.sh .
RUN ./1_create_out_dir.sh

COPY ./2_install_deps.sh .
RUN ./2_install_deps.sh

COPY ./3_clone_repos.sh .
RUN ./3_clone_repos.sh

COPY ./4_build_examples.sh .
RUN ./4_build_examples.sh

ENV LIBUSB_INCLUDE_DIR="/usr/include/libusb-1.0"
COPY ./5_build_probe_tool.sh .
RUN ./5_build_probe_tool.sh

COPY ./6_build_openocd.sh .
RUN ./6_build_openocd.sh
