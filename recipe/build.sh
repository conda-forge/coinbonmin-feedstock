# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./Osi
cp $BUILD_PREFIX/share/gnuconfig/config.* ./ThirdParty/HSL
cp $BUILD_PREFIX/share/gnuconfig/config.* ./ThirdParty/ASL
cp $BUILD_PREFIX/share/gnuconfig/config.* ./ThirdParty/Mumps
cp $BUILD_PREFIX/share/gnuconfig/config.* ./ThirdParty/Blas
cp $BUILD_PREFIX/share/gnuconfig/config.* ./Bonmin
cp $BUILD_PREFIX/share/gnuconfig/config.* ./Cgl
cp $BUILD_PREFIX/share/gnuconfig/config.* ./Ipopt
cp $BUILD_PREFIX/share/gnuconfig/config.* ./Cbc
cp $BUILD_PREFIX/share/gnuconfig/config.* ./Clp
cp $BUILD_PREFIX/share/gnuconfig/config.* ./ThirdParty/Lapack
cp $BUILD_PREFIX/share/gnuconfig/config.* ./BuildTools
cp $BUILD_PREFIX/share/gnuconfig/config.* ./Data/Sample
cp $BUILD_PREFIX/share/gnuconfig/config.* .
cp $BUILD_PREFIX/share/gnuconfig/config.* ./ThirdParty/Metis
cp $BUILD_PREFIX/share/gnuconfig/config.* ./ThirdParty/FilterSQP
cp $BUILD_PREFIX/share/gnuconfig/config.* ./CoinUtils

set -e

LIBS="-lCoinUtils -lOsi -lCgl -lCbc -lipopt -lasl" COIN_SKIP_PROJECTS="Sample" ./configure --prefix="${PREFIX}" \
  --with-coinutils-lib="-lCoinUtils" \
  --with-coinutils-incdir="${PREFIX}/include/coin/" \
  --with-osi-lib="-lOsi" \
  --with-osi-incdir="${PREFIX}/include/coin/" \
  --with-clp-lib="-lClp" \
  --with-clp-incdir="${PREFIX}/include/coin/" \
  --with-cgl-lib="-lCgl" \
  --with-cgl-incdir="${PREFIX}/include/coin/" \
  --with-cbc-lib="-lCbc" \
  --with-cbc-incdir="${PREFIX}/include/coin/" \
  --with-ipopt-lib="-lipopt" \
  --with-ipopt-incdir="${PREFIX}/include/coin/" \
  --with-asl-incdir="${PREFIX}/include/asl" \
  --with-asl-lib="-lipoptamplinterface -lasl" \
  || { cat config.log; exit 1; }
make -j ${CPU_COUNT}
make install
