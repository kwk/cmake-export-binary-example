.PHONY: all
all: clean subproject-a subproject-b subproject-c

.PHONY: subproject-a
subproject-a:
	rm -rf build/subproject-a install/subproject-a
	mkdir -pv build/subproject-a
	cd build/subproject-a \
	&& cmake \
		../../subproject-a \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=$(abspath install/subproject-a) \
	&& make \
	&& make install

.PHONY: subproject-b
subproject-b:
	rm -rf build/subproject-b install/subproject-b
	mkdir -pv build/subproject-b
	cd build/subproject-b \
	&& cmake \
		../../subproject-b \
		-DCMAKE_BUILD_TYPE=Release \
		-DMY_CMAKE_DIR=$(abspath install/subproject-a/cmake) \
	&& make

.PHONY: subproject-c
subproject-c:
	rm -rf build/subproject-c install/subproject-c
	mkdir -pv build/subproject-c
	cd build/subproject-c \
	&& cmake \
		../../subproject-c \
		-DCMAKE_BUILD_TYPE=Debug \
		-DMY_CMAKE_DIR=$(abspath build/subproject-a) \
	&& make

.PHONY: clean
clean:
	rm -rf build install