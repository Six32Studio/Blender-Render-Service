# Base image with CUDA for GPU support
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

# Install necessary dependencies
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

# Copy the Python script for rendering (replace_faces.py)
COPY replace_faces.py /app/replace_faces.py

# Ensure NVIDIA runtime is used for Docker
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,video,utility

# Set default command to run Blender with CUDA
CMD ["blender", "--background", "--python", "/app/replace_faces.py", "--engine", "CYCLES", "-- --device", "CUDA"]

