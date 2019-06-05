# image
FROM mint19-amd64

# copy files
COPY maclookup.sh /tmp/maclookup.sh

# set working directory
WORKDIR /tmp

# opening ports 
EXPOSE 80
EXPOSE 443

# execute script command
CMD sh /tmp/maclookup.sh


