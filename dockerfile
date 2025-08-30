FROM archlinux:latest

# Fix package database and keyring issues
RUN pacman -Sy --noconfirm archlinux-keyring gnupg \
    && pacman-key --init \
    && pacman-key --populate archlinux \
    && pacman -Syy --noconfirm \
    && pacman -Scc --noconfirm

# Install system dependencies with error handling
RUN pacman -Sy --noconfirm \
    neovim \
    git \
    make \
    unzip \
    gcc \
    ripgrep \
    fd \
    xclip \
    npm \
    go \
    lua \
    python \
    python-pip \
    ttf-nerd-fonts-symbols-mono \
    lazygit \
    || (echo "Package installation failed, trying alternative approach..." && \
        pacman -Sy --noconfirm --overwrite="*" \
        archlinux-keyring \
        gnupg \
        neovim \
        git \
        make \
        unzip \
        gcc \
        ripgrep \
        fd \
        xclip \
        npm \
        go \
        python \
        python-pip \
        ttf-nerd-fonts-symbols-mono \
        lazygit)

# Clean package cache
RUN pacman -Scc --noconfirm

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ENV PYTHONUNBUFFERED=1
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN uv venv /opt/venv

# Create basic Neovim config structure with lazy
RUN mkdir -p /root/.config/nvim/lua

# Copy the init.lua file to the correct location
COPY init.lua /root/.config/nvim/init.lua
COPY .stylua.toml /root/.config/nvim/.stylua.toml

COPY core /root/.config/nvim/lua/core
COPY keymap /root/.config/nvim/lua/keymap
COPY languages /root/.config/nvim/lua/languages
COPY plugins /root/.config/nvim/lua/plugins
COPY opts /root/.config/nvim/lua/opts

WORKDIR /workspace

# Default command
CMD ["/usr/bin/bash"]
