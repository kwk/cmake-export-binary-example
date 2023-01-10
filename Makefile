.PHONY: subproject-a
subproject-a:
	rm -rf build/subproject-a install/subproject-a
	mkdir -pv build/subproject-a
	cd build/subproject-a \
	&& cmake \
		../../subproject-a \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=../../install/subproject-a \
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
		-DCMAKE_PREFIX_PATH=../install/subproject-a/cmake \
		-DCMAKE_INSTALL_PREFIX=../install/subproject-b \
	&& make

.PHONY: superproject
superproject:
	rm -rf build/superproject install/superproject
	mkdir -pv build/superproject
	cd build/superproject \
	&& cmake \
		../../superproject \
		-DCMAKE_BUILD_TYPE=Release \
	&& make

.PHONY: clean
clean:
	rm -rf build install