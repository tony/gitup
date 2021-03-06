all: build

mkdir_build:
	rm -rf build
	mkdir -p build

build: mkdir_build
	cd build; cmake ..
	make -C build

build_ninja: mkdir_build
	cd build; cmake -GNinja ..
	ninja -C build

debug: mkdir_build
	cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
	make -C build

debug_ninja: mkdir_build
	cd build; cmake -GNinja -DCMAKE_BUILD_TYPE=Debug ..
	ninja -C build

format:
	clang-format -style=Chromium src/* -i || clang-format37 -style=Chromium src/* -i

run:
	./build/gitup


.PHONY: mkdir_build
