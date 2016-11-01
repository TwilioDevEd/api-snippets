#!/bin/bash

languages=""

if [ -n "$SNIPPET_LANGUAGE" ]; then
  echo "Installing dependencies for: ${SNIPPET_LANGUAGE//:/,}"
  languages=$SNIPPET_LANGUAGE
fi

if [[ $languages == *"python"* ]] || [[ $languages == *"node"* ]] || [[ $languages == *"ruby"* ]] || [[ $languages == *"curl"* ]] || [[ $languages == *"php"* ]]; then
  cd twilio-api-faker
  sudo gradle run </dev/null &>/dev/null &
  cd ..
  sleep 25
fi

