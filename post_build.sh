WEB_ROOT="build/web"
INDEX_PATH="${WEB_ROOT}/index.html"
JS_PATH="${WEB_ROOT}/flutter.js"
VERSION_PATH="${WEB_ROOT}/version.json"

# Compose app version by adding current time
VERSION_JSON=$(cat $VERSION_PATH)
VERSION_NAME=$(echo $VERSION_JSON | jq -r '.version')
RANDOM_NUMBER=$(date +%Y%m%d%H%M%S)
VERSION_STR="${VERSION_NAME}r${RANDOM_NUMBER}"

# Update flutter.js by specifying app version on the main.dart.js import
JS_CONTENT=$(cat $JS_PATH)
JS_UPDATED="${JS_CONTENT//main.dart.js/main.dart.js?v=$VERSION_STR}"
echo "$JS_UPDATED" > $JS_PATH

# Update index.html by specifying app version on the flutter.js import
INDEX_CONTENT=$(cat $INDEX_PATH)
INDEX_UPDATED="${INDEX_CONTENT//flutter.js/flutter.js?v=$VERSION_STR}"
echo "$INDEX_UPDATED" > $INDEX_PATH