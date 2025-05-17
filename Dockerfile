# Base image for Blender
FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget curl git ca-certificates && \
    apt-get clean

# Install Blender
RUN wget https://download.blender.org/release/Blender3.3/blender-3.3.1-linux-x64.tar.xz && \
    tar -xf blender-3.3.1-linux-x64.tar.xz -C /opt/ && \
    ln -s /opt/blender-3.3.1-linux-x64/blender /usr/local/bin/blender

# Set working directory
WORKDIR /workspace

# Default command
CMD ["blender", "--background"]
