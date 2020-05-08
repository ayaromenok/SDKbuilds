sudo su
mv /usr/lib/aarch64-linux-gnu/libGLESv2.so.2.0.0 /usr/lib/aarch64-linux-gnu/libGLESv2.so.2.0.0.org
mv /usr/lib/aarch64-linux-gnu/libGLESv2.so.2 /usr/lib/aarch64-linux-gnu/libGLESv2.so.2.org
mv /usr/lib/aarch64-linux-gnu/libGLESv2.so /usr/lib/aarch64-linux-gnu/libGLESv2.so.org

mv /usr/lib/aarch64-linux-gnu/libEGL.so.1.0.0 /usr/lib/aarch64-linux-gnu/libEGL.so.1.0.0.org
mv /usr/lib/aarch64-linux-gnu/libEGL.so.1 /usr/lib/aarch64-linux-gnu/libEGL.so.1.org
mv /usr/lib/aarch64-linux-gnu/libEGL.so /usr/lib/aarch64-linux-gnu/libEGL.so.org

mv /usr/lib/aarch64-linux-gnu/libgbm.so.1.0.0 /usr/lib/aarch64-linux-gnu/libgbm.so.1.0.0.org
mv /usr/lib/aarch64-linux-gnu/libgbm.so.1 /usr/lib/aarch64-linux-gnu/libgbm.so.1.org
mv /usr/lib/aarch64-linux-gnu/libgbm.so /usr/lib/aarch64-linux-gnu/libgbm.so.org


ln -s /usr/rk3399-libs/lib64/libMali.so /usr/lib/aarch64-linux-gnu/libGLESv2.so
ln -s /usr/rk3399-libs/lib64/libMali.so /usr/lib/aarch64-linux-gnu/libGLESv2.so.2
ln -s /usr/rk3399-libs/lib64/libMali.so /usr/lib/aarch64-linux-gnu/libGLESv2.so.2.0.0
ln -s /usr/rk3399-libs/lib64/libMali.so /usr/lib/aarch64-linux-gnu/libEGL.so.1.0.0
ln -s /usr/rk3399-libs/lib64/libMali.so /usr/lib/aarch64-linux-gnu/libEGL.so.1
ln -s /usr/rk3399-libs/lib64/libMali.so /usr/lib/aarch64-linux-gnu/libEGL.so
ln -s /usr/rk3399-libs/lib64/libMali.so /usr/lib/aarch64-linux-gnu/libgbm.1.0.0
ln -s /usr/rk3399-libs/lib64/libMali.so /usr/lib/aarch64-linux-gnu/libgbm.1
ln -s /usr/rk3399-libs/lib64/libMali.so /usr/lib/aarch64-linux-gnu/libgbm.so.1.0.0
ln -s /usr/rk3399-libs/lib64/libMali.so /usr/lib/aarch64-linux-gnu/libgbm.so.1
ln -s /usr/rk3399-libs/lib64/libMali.so /usr/lib/aarch64-linux-gnu/libgbm.so
