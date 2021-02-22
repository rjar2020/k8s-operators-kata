go get github.com/operator-framework/operator-sdk
#Equivalent to cd $GOPATH/src/github.com/operator-framework/operator-sdk
cd /Users/rolandoangelini/.gvm/pkgsets/go1.15.6/global/src/github.com/operator-framework/operator-sdk
make install
#It should print something like 
# operator-sdk version: "v1.4.0-23-gaafa2d52", commit: "aafa2d52304f4b0492986ed25ea0a672afd43ed5", 
# kubernetes version: "v1.19.4", go version: "go1.15.6", GOOS: "darwin", GOARCH: "amd64"
operator-sdk version