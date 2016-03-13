# Compile and install OpenSSL
wget -O /tmp/openssl.tgz https://www.openssl.org/source/openssl-1.0.2-latest.tar.gz
tar -zxf /tmp/openssl.tgz -C /tmp
cd /tmp/openssl-*
./config --prefix=/usr --openssldir=/etc/ssl --libdir=lib no-shared zlib-dynamic
make
make install_sw