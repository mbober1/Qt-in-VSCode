project('qt-hello', 'cpp', 'c',
  version : '0.1',
  license: 'APACHE2',
  default_options : ['warning_level=3', 'c_std=c2x', 'cpp_std=c++20'])

qt5 = import('qt5')
qt5_dep = dependency('qt5', modules: ['Core', 'Gui', 'Widgets'])


inc = include_directories('include')
src = ['src/main.cpp', 'src/mainwindow.cpp']

qtprocessed = qt5.preprocess(
  moc_headers: 'include/mainwindow.hpp',
  ui_files: 'ui/mainwindow.ui',
  include_directories: inc)

exe = executable('qt-hello', 
  sources: [src, qtprocessed], 
  include_directories: inc,
  dependencies: qt5_dep,
  install : true)


test('basic', exe)
