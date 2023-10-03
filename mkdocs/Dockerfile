#my dockerfile
#Image to build MKDocs
FROM squidfunk/mkdocs-material

#workdir
WORKDIR /docs
#copy
COPY . /docs

#port
EXPOSE 8000
#cmd
CMD ["serve", "--dev-addr=0.0.0.0:8000"]