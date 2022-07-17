export SYSTEMC_HOME=/home/uraimizuki/systemc
export LD_LIBRARY_PATH=$SYSTEMC_HOME/lib-linux64
g++ test.cpp -I/home/uraimizuki/systemc/include -L/home/uraimizuki/systemc/lib-linux64 -o test.out -lsystemc

