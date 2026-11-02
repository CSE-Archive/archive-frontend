# CSE Archive frontend — serves the built Flutter web app with nginx.
#
# The Flutter build itself stays outside the image on purpose: it needs an
# era-pinned SDK (see .github/workflows/deploy.yaml) and API_BASE_URL baked
# into assets at build time. Build the app first, then build the image:
#
#   flutter build web --web-renderer canvaskit --release --no-tree-shake-icons
#   ./post_build.sh
#   docker build -t csearchive-frontend .
FROM nginx:1.27-alpine

COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY build/web /usr/share/nginx/html
