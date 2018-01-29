#!/bin/bash

export function post_to_slack () {
  if [ -z "$SLACK_NOTIFICATION" ]; then
    echo "SLACK_NOTIFICATION variable not found."
    exit 1;
  fi
  SLACK_MESSAGE="\`\`\`$1\`\`\`"
  SLACK_URL=https://hooks.slack.com/services/$SLACK_NOTIFICATION

  case "$2" in
    INFO)
      SLACK_ICON=':slack:'
      ;;
    WARNING)
      SLACK_ICON=':warning:'
      ;;
    ERROR)
      SLACK_ICON=':bangbang:'
      ;;
    *)
      SLACK_ICON=':slack:'
      ;;
  esac
 
  curl -X POST --data "payload={\"text\": \"${SLACK_ICON} ${SLACK_MESSAGE}\"}" ${SLACK_URL}
}

echo "==> AWS CodeBuild Extra Slack Function:"
echo "==> --------------------------------------"
echo "==> COMMANDS:"
echo "==>   post_to_slack 'message' 'level'"
echo "==> LEVEL OPTIONS:"
echo "==>   INFO, WARNING, ERROR"
echo "==> REQUIREMENTS:"
echo "==>   SLACK_NOTIFICATION is required to call the function"
echo "==>"



