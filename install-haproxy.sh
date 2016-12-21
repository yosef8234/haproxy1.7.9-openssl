# Compile and install HAProxy
wget -O /tmp/haproxy.tgz http://www.haproxy.org/download/1.7/src/haproxy-1.7.1.tar.gz
tar -zxvf /tmp/haproxy.tgz -C /tmp
cd /tmp/haproxy-*
make \
    TARGET=linux2628 USE_LINUX_TPROXY=1 USE_ZLIB=1 USE_REGPARM=1 USE_PCRE=1 USE_PCRE_JIT=1 \
    USE_OPENSSL=1 SSL_INC=/usr/include SSL_LIB=/usr/lib ADDLIB=-ldl \
    CFLAGS="-O2 -g -fno-strict-aliasing -DTCP_USER_TIMEOUT=18"
make install