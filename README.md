To build:

    docker build -rm -t docker-jekyll .
    
To run:

    docker run -p 4000:4000 -v $PWD:/home/jekyll -i -t docker-jekyll

