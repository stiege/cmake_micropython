git submodule update --init --recursive
mkdir build
cd build
cmake ..
make deps # Build gtest
make all -j10 && make test -j10
cmake .. -DCROSSCOMPILING=1
make all -j10