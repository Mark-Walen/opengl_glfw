cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DGLFW_USE_DLL=ON -DGLFW_LIB=lib-mingw-w64 -DCMAKE_C_COMPILER:FILEPATH=D:\env\mingw64\bin\gcc.exe -DCMAKE_CXX_COMPILER:FILEPATH=D:\env\mingw64\bin\g++.exe -S./first_app -B./build -G "MinGW Makefiles

cd .\build\
mingw32-make