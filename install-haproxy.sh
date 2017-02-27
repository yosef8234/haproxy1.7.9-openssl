# Compile and install HAProxy
rm -rf /tmp/haproxy-current
git clone http://git.haproxy.org/git/haproxy-1.7.git /tmp/haproxy-current
cd /tmp/haproxy-current
make \
    TARGET=linux2628 USE_LINUX_TPROXY=1 USE_ZLIB=1 USE_REGPARM=1 USE_PCRE=1 USE_PCRE_JIT=1 \
    USE_OPENSSL=1 SSL_INC=/usr/include SSL_LIB=/usr/lib ADDLIB=-ldl \
    CFLAGS="-O2 -g -fno-strict-aliasing -DTCP_USER_TIMEOUT=18"
make install
cp /tmp/haproxy-current/examples/haproxy.init /etc/init.d/haproxy
systemctl daemon-reload
systemctl stop haproxy && cp /usr/local/sbin/haproxy /usr/sbin/ && systemctl start haproxy
