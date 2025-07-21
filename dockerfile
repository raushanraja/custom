FROM archlinux:latest

# Fix keyring/signature issues and clean cache before installing packages
RUN pacman -Sy --noconfirm archlinux-keyring gnupg \
    && pacman-key --init \
    && pacman-key --populate archlinux \
    && pacman -Scc --noconfirm \
    && pacman -Syu --noconfirm \
    neovim git make unzip gcc ripgrep fd xclip npm go ttf-nerd-fonts-symbols-mono lazygit

# Set up user (non-root for everything else)
RUN useradd -m nvimuser

# Clone kickstart-modular.nvim config as nvimuser
USER nvimuser
WORKDIR /home/nvimuser
RUN git clone https://github.com/dam9000/kickstart-modular.nvim ~/.config/nvim

# Remove the default kickstart-modular.nvim config
RUN rm -rf ~/.config/nvim/lua/custom

# Replace the custom directory with your own custom config
RUN git clone https://github.com/raushanraja/custom ~/.config/nvim/lua/custom
RUN cd ~/.config/nvim/lua/custom \
    && git checkout buffer

# Switch back to root to copy and set permissions for apply.sh
USER root
COPY apply.sh /home/nvimuser/.config/nvim/apply.sh
RUN chown nvimuser:nvimuser /home/nvimuser/.config/nvim/apply.sh \
    && chmod +x /home/nvimuser/.config/nvim/apply.sh

# Back to nvimuser for running apply.sh and entrypoint
USER nvimuser
WORKDIR /home/nvimuser
RUN cd /home/nvimuser/.config/nvim && ./apply.sh

ENTRYPOINT ["/usr/bin/bash"]
