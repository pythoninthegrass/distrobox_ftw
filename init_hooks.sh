#!/usr/bin/env bash

# vscode
rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | tee /etc/yum.repos.d/vscode.repo > /dev/null

# install packages
dnf check-update
dnf install --setopt=install_weak_deps=False -y \
	ansible \
	ansible-lint \
	bzip2-devel \
	ccache \
	code \
	curl \
	'dnf-command(config-manager)' \
	gcc \
    gcc-c++ \
	git \
	htop \
    kernel-devel \
	libffi-devel \
	libsqlite3x-devel \
    make \
	openssh-server \
	openssl-devel \
	readline-devel \
	xz-devel

# gh cli
dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
dnf install -y gh --repo gh-cli

# ccache
cp /usr/bin/ccache /usr/local/bin/ccache
ln -s ccache /usr/local/bin/gcc
ln -s ccache /usr/local/bin/g++
ccache -M 10G

# TODO: use ansible to setup asdf, docker, etc

# Enable services
systemctl enable sshd.service
