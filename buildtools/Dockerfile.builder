# Setup builder
FROM darkvex/fail-builder:libvips

COPY ./ /photo-stream 

WORKDIR /photo-stream

RUN ruby -v && gem install bundler jekyll &&\
    bundle config --local build.sassc --disable-march-tune-native &&\
    bundle install

ENTRYPOINT bundle exec jekyll build
