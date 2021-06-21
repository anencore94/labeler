FROM golang:1.16-alpine

LABEL "com.github.actions.name"="Enhanced Condition-based Pull Request labeller"
LABEL "com.github.actions.description"="Automatically label pull requests based on rules"
LABEL "com.github.actions.icon"="tag"
LABEL "com.github.actions.color"="green"
LABEL "maintainer"="Jaeyeon Kim <anencore94@gmail.com>"
LABEL "repository"="https://github.com/anencore94/labeler"

RUN apk add --no-cache git

WORKDIR /go/src/app

COPY . .
RUN CGO_ENABLED=0 GO111MODULE=on GO15VENDOREXPERIMENT=1 go build -trimpath -o action ./cmd

ENTRYPOINT ["/go/src/app/action"]
