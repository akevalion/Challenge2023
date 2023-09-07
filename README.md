# Challenge2023
Just fun for [challenge2023](https://gist.github.com/victor-soliz-coderoad-com/ce3bc411f5873fa9b46956826ae13826)

# Install
In pharo12 use: 
```st
Metacello new
    baseline: 'Challenge2023';
    repository: 'github://akevalion/Challenge';
    load.
```

# To run and create the image

This code should work for MacOS and some linux distributions.

1. First prepare pharo in your environment.
2. Clone this repository.
3. From your terminal enter to your local copy and execute:
   ```sh
    $ ./install.sh
   ```
4. Then to create an image run
   ```sh
     $ ./run.sh
   ```
5. You will get a file in the root folder with a random name with extension .ppm
6. Each time you run it will produce a different image
