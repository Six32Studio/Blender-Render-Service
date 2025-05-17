import bpy
import os

# Define paths for input and output videos
input_video = os.getenv("INPUT_VIDEO_PATH", "/workspace/input_video.mp4")
output_video = os.getenv("OUTPUT_VIDEO_PATH", "/output/output_video.mp4")

# Load the input video
bpy.context.scene.sequence_editor_create()
bpy.ops.sequencer.movie_strip_add(filepath=input_video, frame_start=1)

# Set output settings
bpy.context.scene.render.filepath = output_video
bpy.context.scene.render.image_settings.file_format = 'FFMPEG'
bpy.context.scene.render.ffmpeg.format = 'MPEG4'

# Render the video
bpy.ops.render.render(animation=True)
print("Rendering complete. Video saved at:", output_video)
