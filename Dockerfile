FROM golang:1.8

ENV latest=1
ENV registry="http://localhost:5000"
ENV repo=".*"      
ENV repos=5
ENV tag=".*"
ENV year=1

WORKDIR /go/src/app
ADD https://raw.githubusercontent.com/fraunhoferfokus/deckschrubber/master/main.go main.go
ADD https://raw.githubusercontent.com/fraunhoferfokus/deckschrubber/master/types.go types.go

RUN go get -d -v ./...
RUN go install -v ./...

CMD ["app","-latest ${latest}","-dry","-registy ${registry}","-repos ${repos}","-tag ${tag}","-year ${year}"]
