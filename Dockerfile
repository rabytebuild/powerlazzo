# Use the official Kali Linux base image
FROM kalilinux/kali-rolling

# Set the container's working directory to / (root)
WORKDIR /

# Update the package list and install necessary packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    novnc \
    novnc-server \
    x11vnc \
    xvfb \
    fluxbox \
    && rm -rf /var/lib/apt/lists/*

# Expose port 80 for NoVNC
EXPOSE 80

# Start the NoVNC server on port 80
CMD ["x11vnc", "-forever", "-usepw", "-create", "-shared", "-display", ":0", "-bg", "-nopw", "-listen", "0.0.0.0", "-xkb"]
