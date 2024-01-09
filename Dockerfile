# Use the official Kali Linux base image
FROM kalilinux/kali-rolling

# Set the container's working directory to / (root)
WORKDIR /

# Update the package list and install necessary packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    novnc \
    x11vnc \
    xvfb \
    fluxbox \
    kali-desktop-gnome \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose port 80 for NoVNC
EXPOSE 80

# Set environment variables for VNC password
ENV VNC_PASSWORD=root
ENV VNC_PASSWD_PATH=/etc/x11vnc.pass

# Use 'echo' to set the VNC password
RUN echo "$VNC_PASSWORD" | x11vnc -storepasswd -f $VNC_PASSWD_PATH

# Start the VNC server with password protection and NoVNC on port 80
CMD ["x11vnc", "-forever", "-usepw", "-create", "-shared", "-display", ":0", "-bg", "-nopw", "-listen", "0.0.0.0", "-xkb"]
