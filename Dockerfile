# Build the Docker image using official Kali Linux repositories
FROM kalilinux/kali-rolling
# Set the container's working directory to / (root)
WORKDIR /
# Download and install the necessary packages for NoVNC
RUN apt-get update && apt-get install -y novnc-client novnc-server
# Start the NoVNC server on port 80
CMD ["/usr/bin/nano-server", "--port=80"]
