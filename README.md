# Qt-in-VSCode
Clear Qt template with devcontainer and VSCode settings. Easy to use enviroment for QT5 development.

### Allow Docker to run GUI apps
`sudo xhost +local:docker`

## Usage
Open with **VSCode**. Install devcontainer addon. Open folder in container!

#### Run task (Ctrl + Shift + B)
- Open designer
- Build project

#### Debuging
Just push F5 in VSCode!

### Compiling with Meson
meson setup --cross-file meson/aarch64.txt build
meson compile -C build

### Compiling with CMake
```
cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=cmake/aarch64.cmake 
cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Debug 
ninja -C build
```

rsync -zvhLr build/qt_test mbober@raspberrypi.lan:~/
ssh -L9091:localhost:9091 mbober@raspberrypi.lan
gdbserver :9091 ~/build/qt_test
