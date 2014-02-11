#!/bin/bash  
# [Description]
#     1�����밲װPHP 5.4.x�����֧�ֿ�
#
# [Variables]
#	[Init]
#   1����ʼ��֧�ֿ�Դ��Ŀ¼	-	$installdir
#	2��ȷ��Դ����� $libname = libiconv-1.14/libmcrypt-2.5.8/mhash-0.9.9.9/mcrypt-2.6.8
#
#		
# [Version]
#   v1.0    LuJianQing     	Create     	20110823
#	v1.1	LuJianQing		Update		20130224
#	[Changelog]
#		a) Support PHP 5.4.x
#		b) Writing a new annotation

#��ʼ����װĿ¼
installdir=/opt/source

#��װ libiconv-Unicode �ַ�ת��
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

#��װPHP ������չ
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

#��װPHP Hash�㷨��չ
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

# x64 ������
# x86 ȥ��64
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

#��װPHP ������չ
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