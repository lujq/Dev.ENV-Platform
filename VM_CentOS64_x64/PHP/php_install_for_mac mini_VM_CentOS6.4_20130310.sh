# Note
#     1、初始化环境变量、日志等
# Program    
#     1、编译安装PHP 5.4.4
# Version
#      v1.0     LuJianQing     	Create     20120712
#	   v1.0.1	LuJianQing		Update	   20130310
#				Update 编译参数

#初始化安装目录
installdir=/opt/source
mkdir -p $installdir

#安装 PHP
#wget http://www.php.net/get/php-5.4.12.tar.gz/from/hk2.php.net/mirror
cd $installdir
libname=php-5.4.12
rm -rf $libname

echo $libname Installation Start...
tar zxvf $libname.tar.gz
cd $libname/

# For CentOS_x64
cp -frp /usr/lib64/libldap* /usr/lib/
ln -s /usr/local/webserver/mysql/lib/libmysqlclient.so.18  /usr/lib64/

# 编译增加MySQL支持 
./configure --prefix=/opt/webserver/php --with-config-file-path=/opt/webserver/php/etc --with-mysql=/usr/local/webserver/mysql --with-mysqli=/usr/local/webserver/mysql/bin/mysql_config --with-pdo-mysql --with-iconv-dir=/usr/local --with-recode=shared --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr --enable-xml --disable-rpath --enable-bcmath --enable-shmop --enable-sysvsem --with-curl --with-curlwrappers --enable-mbregex --enable-fpm --with-fpm-user=www --with-fpm-group=www --enable-mbstring --with-mcrypt --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-ldap --with-ldap-sasl --with-xmlrpc --with-pear --enable-zip --enable-soap --disable-ipv6 

# For Production Env.
#--disable-debug

make -j 2 ZEND_EXTRA_LIBS=-liconv
#make -j 2
make install
cd ../
echo $libname Installation Done...

# Make Test if necessary
#make test

#将php-fpm设置为服务启动,
#cd $installdir/$libname
#cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
#chmod 775 /etc/init.d/php-fpm

#/sbin/chkconfig --add php-fpm
#/sbin/chkconfig php-fpm on
#/etc/init.d/php-fpm start
