#!/usr/bin/env bash

set -e

function tellApplicable() {
    echo "true"
}

function tellVersion() {
    echo 5
}

function run() {
        date >> /tmp/x.sh.run.log
        echo "Args: $*" >> /tmp/x.sh.run.log
        printf "Stdin: " >> /tmp/x.sh.run.log
        #cat <&0 >> /tmp/x.sh.run.log
        echo '{ "tool_notes" : [
                   { "type" : "type during run",
                     "message" : "run message",
                     "file" : "a.c",
                     "line" : 3,
                     "noteId" : "noteid"
                   }
                ]
              , "warnings" : [
                  { "display_message" : "display warning during run"
                  , "detailed_message" : "detailed warning during run"
                  }
                ] 
              }'
}


function tellName() {
        printf "V5Test"
}

case "$3" in
    run)
        run
        ;;
    applicable)
        tellApplicable
        ;;
    name)
        tellName
        ;;
    *)
        tellVersion
        ;;
esac
