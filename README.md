# Firefox-Docker
Firefox Browser Docker

# To Build
docker build -t firefox:{Version You Want} {Path of the Docker File} --no-cache

# To Run
docker run --rm \
    --name={Container Name} \
    --env PULSE_SERVER=unix:/tmp/pulseaudio.socket \
    --env PULSE_COOKIE=/tmp/pulseaudio.cookie \
    --volume /tmp/pulseaudio.socket:/tmp/pulseaudio.socket \
    --volume /tmp/pulseaudio.client.conf:/etc/pulse/client.conf \
    -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
    --network=host \
    firefox:{Version You Want} firefox

Replace {Container Name} with the name you want to mark the container as

# Notes
Firefox runs as a non-root user

To set gui connection on host: xhost +

I don't own any of the install packages