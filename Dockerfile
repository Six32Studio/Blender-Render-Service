FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y \
    blender \
    && rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app

CMD ["blender", "-b", "scene.blend", "-o", "//render_", "-F", "PNG", "-x", "1", "-f", "1"]

