.PHONY: all
all: project-a project-b

.PHONY: project-a
project-a:
	rm -rf build/project-a install/project-a
	mkdir -pv build/project-a
	cd build/project-a \
	&& cmake \
		../../project-a \
		-DCMAKE_INSTALL_PREFIX=../../install/project-a \
	&& make \
	&& make install

.PHONY: project-b
project-b:
	rm -rf build/project-b install/project-b
	mkdir -pv build/project-b
	cd build/project-b \
	&& cmake \
		../../project-b \
		-DCMAKE_PREFIX_PATH=../install/project-a/cmake \
		-DCMAKE_INSTALL_PREFIX=../install/project-b \
	&& make