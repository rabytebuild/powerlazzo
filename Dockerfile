# Use the base image provided by Kasmweb
FROM kasmweb/kali-rolling-desktop:1.14.0

# Set environment variables
ENV VNC_PW=password

# Expose the required port
EXPOSE 6901

# Start the container with the specified options
CMD ["--shm-size=512m", "-p", "6901:6901", "-e", "VNC_PW=password"]
