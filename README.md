# Challenge2023
Just for fun.
This project tries to solve this problem [challenge2023](https://gist.github.com/victor-soliz-coderoad-com/ce3bc411f5873fa9b46956826ae13826)

# Install
In pharo12 use: 
```st
Metacello new
    baseline: 'Challenge2023';
    repository: 'github://akevalion/Challenge2023';
    load.
```

# To run and create the image

This code should work for MacOS and some linux distributions.

1. Clone this repository.
2. From your terminal enter to your local copy and execute:
   ```sh
    $ ./install.sh
   ```
3. Then to create an image run
   ```sh
     $ ./run.sh
   ```
4. You will get a file in the root folder with a random name with extension .ppm
<img width="496" alt="image" src="https://github.com/akevalion/Challenge2023/assets/10532890/16fc8ee7-2827-4c9a-beaf-bb66030cd58a">

5. Each time you run it will produce a different image
