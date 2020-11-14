# Toggleswatch

<img src="./assets/logo.svg">

Toggleswatch is a light/dark togglable theme for Bootstrap.
* Based on Bootstrap & Bootswatch

# CDN

https://unpkg.com/browse/toggleswatch@4.5.2-3/

```html
<link rel="stylesheet" href="https://unpkg.com/toggleswatch@4.5.2-3/dist/boostrap.min.css" />
```
# Demo

https://jsfiddle.net/jmnote/uyfhcLbs/

# File size comparison

version |boostrap | bootswatch        | toggleswatch
------- | -------- | ----------------- | ------------
4.5.2   | 157K     | 181K              | 221K

# Build

```console
user01@localhost:~/toggleswatch$ grunt
Running "default" task

Running "clean:darkly_boots" (clean) task
>> 45 paths cleaned.

Running "copy:darkly_boots" task



Running "prune:darkly_boots" task
492K	scss/darkly/bootstrap/
456K	scss/darkly/bootstrap/
Done...


Running "sass:flatly" (sass) task

Running "sass:darkly" (sass) task

Running "check:temp_darkly" task
=== check unnecessary properties...
===


Running "sass:dist" (sass) task

Running "concat:dist" (concat) task

Running "cssmin:dist" (cssmin) task
>> Skipping remote @import of "https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;0,700;1,400&display=swap" as no callback given.
>> 1 file created. 233.33 kB → 192.24 kB

Done, without errors.
```

# Copyright and License

Copyright 2020 jmnote

Code released under the MIT License.
