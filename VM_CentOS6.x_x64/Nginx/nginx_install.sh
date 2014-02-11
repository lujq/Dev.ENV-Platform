# Note
#     1、初始化环境变量、日志等
# Program    
#     1、编译安装PCRE - Support Rewrite Mod with Regular Expression
#	  2、编译安装Nginx
# Version
#      v1.0     LuJianqQing     Create     20110928
#	   v1.1		LJQ				Mod		   20130303
#				Update PCRE	v8.12 to v8.32
#				Update Nginx v1.0.5 to v1.2.7

#Install PCRE
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.32.tar.gz
tar zxvf pcre-8.32.tar.gz
cd pcre-8.32/
./configure 
make
make install
cd ../

# For X64
ln -s /usr/local/lib/libpcre.so.1 /lib64

#Install NginX
wget http://nginx.org/download/nginx-1.2.7.tar.gz
tar zxvf nginx-1.2.7.tar.gz
cd nginx-1.2.7/
mkdir -p /opt/webserver/nginx
./configure --user=www --group=www --prefix=/opt/webserver/nginx --with-http_stub_status_module --with-http_ssl_module
make
make install
cd ../

# Config Dir.Nginx log
# Note: Firstly Create www www(user group) 
nginx_log=/opt/logs/nginx/
mkdir -p $nginx_log
chmod +w $nginx_log
groupadd www
useradd -g www www
chown -R www:www $nginx_log
