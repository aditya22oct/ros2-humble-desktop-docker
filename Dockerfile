FROM ubuntu:jammy

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# 1. Set up locales
RUN apt-get update && \
    apt-get install -y locales curl gnupg2 software-properties-common && \
    locale-gen en_US en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# 2. Enable the universe repository
RUN add-apt-repository universe

# 3. Add ROS 2 APT source via official .deb method
RUN export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | \
    grep -F "tag_name" | awk -F\" '{print $4}') && \
    curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.jammy_all.deb" && \
    apt-get install -y /tmp/ros2-apt-source.deb

# 4. Install ROS 2 Desktop
RUN apt-get update && \
    apt-get install -y ros-humble-desktop && \
    rm -rf /var/lib/apt/lists/*

# 5. Source ROS environment
SHELL ["/bin/bash", "-c"]
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# Default command
CMD ["bash"]
