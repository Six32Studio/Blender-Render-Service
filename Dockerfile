# Base image with CUDA for GPU support
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

# Install Blender
RUN apt-get update && \
    apt-get install -y wget curl git ca-certificates && \
    apt-get clean

# Download and install Blender (latest stable version)
RUN wget https://download.blender.org/release/Blender3.3/blender-3.3.1-linux-x64.tar.xz -O /blender.tar.xz && \
    tar -xf /blender.tar.xz -C /opt/ && \
    rm /blender.tar.xz && \
    ln -s /opt/blender-3.3.1-linux-x64/blender /usr/local/bin/blender

# Set working directory
WORKDIR /app

# Ensure NVIDIA runtime is used for Docker
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,video,utility

# Copy entrypoint script
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Set default command to entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]

