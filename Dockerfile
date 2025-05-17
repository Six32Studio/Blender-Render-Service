# Base image for Blender
FROM blender:latest

# Set working directory
WORKDIR /workspace

# Create the output directory (persistent storage)
RUN mkdir -p /mnt/output

# Copy Python script into the container
COPY replace_faces.py /workspace/replace_faces.py

# Set default command to run Blender in the background with the script
CMD ["blender", "--background", "--python", "/workspace/replace_faces.py", "--engine", "CYCLES"]

