# Distributions Plugin

This plugin provides methods to calculate critical values for Fisher's F and Student's t distributions.

## Requirements

### Web

To use this plugin with Flutter for web, add the following script to your `web/index.html`:
```html
<script src="https://cdn.jsdelivr.net/npm/jstat@latest/dist/jstat.min.js"></script>
```

### Windows

To use this plugin with Flutter for Windows, you need to download the Boost library. After downloading, set the path to the Boost root in your `windows/CMakeLists.txt`:
```txt
set(BOOST_ROOT "path/to/boost")
```
Replace "path/to/boost" with the actual path to your Boost library.

## Usage

The plugin provides two methods: `inv` and `student`. You can call these methods from your Flutter code to calculate the critical values for Fisher's F and Student's t distributions respectively.

For more details, refer to the code in `windows/distributions_plugin.cpp`.