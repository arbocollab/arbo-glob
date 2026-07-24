# Individual Purge for Development
purge-dev:
	@echo "🧹 Purging Dev Assets..."
	curl -H "Accept-Encoding: *" https://purge.jsdelivr.net/gh/arbocollab/arbo-glob@dev/.env.json
	curl -H "Accept-Encoding: *" https://purge.jsdelivr.net/gh/arbocollab/arbo-glob@dev/dist/tessr.css
	curl -H "Accept-Encoding: *" https://purge.jsdelivr.net/gh/arbocollab/arbo-glob@dev/dist/tessr.scss
	curl -H "Accept-Encoding: *" https://purge.jsdelivr.net/gh/arbocollab/arbo-glob@dev/dist/tessr.styl
	curl -H "Accept-Encoding: *" https://purge.jsdelivr.net/gh/arbocollab/arbo-glob@dev/dist/app-loader-global-style.css
	curl -H "Accept-Encoding: *" https://purge.jsdelivr.net/gh/arbocollab/arbo-glob@dev/dist/notificationFirebaseConstant.js

# Individual Purge for Production
purge-live:
	@echo "🚀 Purging Live Assets..."
	curl -H "Accept-Encoding: *" https://purge.jsdelivr.net/gh/arbocollab/arbo-glob@live/.env.json
	curl -H "Accept-Encoding: *" https://purge.jsdelivr.net/gh/arbocollab/arbo-glob@live/dist/tessr.css
	curl -H "Accept-Encoding: *" https://purge.jsdelivr.net/gh/arbocollab/arbo-glob@live/dist/tessr.scss
	curl -H "Accept-Encoding: *" https://purge.jsdelivr.net/gh/arbocollab/arbo-glob@live/dist/tessr.styl
	curl -H "Accept-Encoding: *" https://purge.jsdelivr.net/gh/arbocollab/arbo-glob@live/dist/app-loader-global-style.css
	curl -H "Accept-Encoding: *" https://purge.jsdelivr.net/gh/arbocollab/arbo-glob@live/dist/notificationFirebaseConstant.js

# Purge Everything at Once
purge-all: purge-dev purge-live
	@echo "\n✨ All CDN caches cleared."