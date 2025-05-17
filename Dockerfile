# Base image with CUDA for GPU
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

# Install essential dependencies
RUN apt-get update && \
    apt-get install -y wget tar xz-utils libx11-6 libxi6 libgl1 libxrender1 libsm6 libxcursor1 && \
    rm -rf /var/lib/apt/lists/*

# Download and install Blender (latest stable version)
RUN wget https://download.blender.org/release/Blender3.3/blender-3.3.1-linux-x64.tar.xz -O /blender.tar.xz && \
    tar -xf /blender.tar.xz -C /opt/ && \
    rm /blender.tar.xz && \
    ln -s /opt/blender-3.3.1-linux-x64/blender /usr/local/bin/blender

# Set the working directory
WORKDIR /workspace

# Copy your script into the container
COPY replace_faces.py /workspace/replace_faces.py

# Set the entrypoint for GPU-accelerated Blender
CMD ["blender", "--background", "--python", "/workspace/replace_faces.py", "--engine", "CYCLES"]

