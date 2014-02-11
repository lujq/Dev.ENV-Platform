#!/bin/bash  
# [Description]
#     1、编译安装PHP 5.4.x所需的支持库
#
# [Variables]
#	[Init]
#   1、初始化支持库源码目录	-	$installdir
#	2、确定源码包名 $libname = libiconv-1.14/libmcrypt-2.5.8/mhash-0.9.9.9/mcrypt-2.6.8
#
#		
# [Version]
#   v1.0    LuJianQing     	Create     	20110823
#	v1.1	LuJianQing		Update		20130224
#	[Changelog]
#		a) Support PHP 5.4.x
#		b) Writing a new annotation

#初始化安装目录
installdir=/opt/source

#安装 libiconv-Unicode 字符转换
cd $installdir
libname=libiconv-1.14
rm -rf $libname

echo $libname Installation Start...
tar zxvf $libname.tar.gz
cd $libname/
./configure --prefix=/usr/local
make
make install
cd ../
echo $libname Installation Done...

#安装PHP 加密扩展
cd $installdir
libname=libmcrypt-2.5.8
rm -rf $libname

echo $libname Installation Start...
tar zxvf $libname.tar.gz 
cd $libname/
./configure
make
make install
/sbin/ldconfig
cd libltdl/
./configure --enable-ltdl-install
make
make install
cd ../../
echo $libname Installation Done...

#安装PHP Hash算法扩展
cd $installdir
libname=mhash-0.9.9.9
rm -rf $libname

echo $libname Installation Start...
tar zxvf $libname.tar.gz
cd $libname/
./configure
make
make install
cd ../
echo $libname Installation Done...

# x64 软连接
# x86 去掉64
ln -s /usr/local/lib/libmcrypt.la /usr/lib64/libmcrypt.la
ln -s /usr/local/lib/libmcrypt.so /usr/lib64/libmcrypt.so
ln -s /usr/local/lib/libmcrypt.so.4 /usr/lib64/libmcrypt.so.4
ln -s /usr/local/lib/libmcrypt.so.4.4.8 /usr/lib64/libmcrypt.so.4.4.8
ln -s /usr/local/lib/libmhash.a /usr/lib64/libmhash.a
ln -s /usr/local/lib/libmhash.la /usr/lib64/libmhash.la
ln -s /usr/local/lib/libmhash.so /usr/lib64/libmhash.so
ln -s /usr/local/lib/libmhash.so.2 /usr/lib64/libmhash.so.2
ln -s /usr/local/lib/libmhash.so.2.0.1 /usr/lib64/libmhash.so.2.0.1
ln -s /usr/local/bin/libmcrypt-config /usr/bin/libmcrypt-config
ln -s /usr/local/lib/libiconv.so.2 /usr/lib64/ 

#安装PHP 加密扩展
cd $installdir
libname=mcrypt-2.6.8
rm -rf $libname

echo $libname Installation Start...
tar zxvf $libname.tar.gz
cd $libname/
/sbin/ldconfig
./configure
make
make install
cd ../
echo $libname Installation Done...