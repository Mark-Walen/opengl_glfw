cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DGLFW_USE_DLL=ON -DGLFW_LIB=lib-mingw-w64 -S./first_app -B./build -G "MinGW Makefiles

cd .\build\
mingw32-make
