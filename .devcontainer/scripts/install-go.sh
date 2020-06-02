#!/bin/bash
################################################################################
##  File:  install-go.sh
##  Desc:  Installs go
################################################################################

GOLANG_VERSION=1.14.3
goRelArch="linux-amd64"

apt-get update && apt-get install -y --no-install-recommends g++ gcc libc6-dev make pkg-config 
url="https://golang.org/dl/go${GOLANG_VERSION}.${goRelArch}.tar.gz"
wget -O go.tgz "$url"
tar -C /usr/local -xzf go.tgz
rm go.tgz
export PATH="/usr/local/go/bin:$PATH"
go version

mkdir -p /tmp/gotools
cd /tmp/gotools
GOPATH=/tmp/gotools GO111MODULE=on go get -v golang.org/x/tools/gopls@latest 2>&1
GOPATH=/tmp/gotools GO111MODULE=on go get -v \
        honnef.co/go/tools/...@latest \
        golang.org/x/tools/cmd/gorename@latest \
        golang.org/x/tools/cmd/goimports@latest \
        golang.org/x/tools/cmd/guru@latest \
        golang.org/x/lint/golint@latest \
        github.com/mdempsky/gocode@latest \
        github.com/cweill/gotests/...@latest \
        github.com/haya14busa/goplay/cmd/goplay@latest \
        github.com/sqs/goreturns@latest \
        github.com/josharian/impl@latest \
        github.com/davidrjenni/reftools/cmd/fillstruct@latest \
        github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest  \
        github.com/ramya-rao-a/go-outline@latest  \
        github.com/acroca/go-symbols@latest  \
        github.com/godoctor/godoctor@latest  \
        github.com/rogpeppe/godef@latest  \
        github.com/zmb3/gogetdoc@latest \
        github.com/fatih/gomodifytags@latest  \
        github.com/mgechev/revive@latest  \
        github.com/go-delve/delve/cmd/dlv@latest 2>&1

# Build Go tools w/o module support
GOPATH=/tmp/gotools go get -v github.com/alecthomas/gometalinter 2>&1

#
# Build gocode-gomod
GOPATH=/tmp/gotools go get -x -d github.com/stamblerre/gocode 2>&1
GOPATH=/tmp/gotools go build -o gocode-gomod github.com/stamblerre/gocode

#
# Install Go tools
mv /tmp/gotools/bin/* /usr/local/bin/
mv gocode-gomod /usr/local/bin/
#
# Install golangci-lint
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/local/bin 2>&1
#
