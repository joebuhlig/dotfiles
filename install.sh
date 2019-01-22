sudo apt update

sudo apt install ruby-full
sudo apt install python
sudo apt install make

wget https://github.com/todotxt/todo.txt-cli/archive/v2.11.0.tar.gz
tar -zvxf v2.11.0.tar.gz
cd todo.txt-cli-2.11.0
make
make install
cd ..
rm -rf todo.txt-cli-2.11.0
rm v2.11.0.tar.gz

gem install ice_cube
gem install optimist
