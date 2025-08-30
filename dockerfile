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

# Set up user (non-root for everything else)
RUN useradd -m -s /bin/bash nvimuser \
    && usermod -aG wheel nvimuser

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ENV PYTHONUNBUFFERED=1
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN uv venv /opt/venv

# Create basic Neovim config structure with lazy
RUN mkdir -p ~/.config/nvim/lua

# Copy the init.lua file to the correct location
COPY init.lua /home/nvimuser/.config/nvim/init.lua
COPY .stylua.toml /home/nvimuser/.config/nvim/.stylua.toml

COPY core /home/nvimuser/.config/nvim/lua/core
COPY keymap /home/nvimuser/.config/nvim/lua/keymap
COPY languages /home/nvimuser/.config/nvim/lua/languages
COPY plugins /home/nvimuser/.config/nvim/lua/plugins
COPY opts /home/nvimuser/.config/nvim/lua/opts

# Change the ownership of the home directory
RUN chown -R nvimuser:nvimuser /home/nvimuser

# Switch to user for configuration
USER nvimuser
WORKDIR /home/nvimuser


# Set environment
ENV PATH="/home/nvimuser/.local/bin:$PATH"

# Default command
CMD ["/usr/bin/bash"]
