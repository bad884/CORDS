all:
	g++ errfs.cc util.cc -o errfs `pkg-config fuse --cflags --libs` -std=c++11 -D_FILE_OFFSET_BITS=64
clean :
	rm -f errfs; rm -f *.o
