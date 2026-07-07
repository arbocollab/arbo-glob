# Individual Purge for Development
purge-dev:
	@echo "🧹 Purging Dev Assets..."
	curl -X PURGE -H "Accept-Encoding: *" https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@dev/.env.json
	curl -X PURGE -H "Accept-Encoding: *" https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@dev/dist/tessr.css
	curl -X PURGE -H "Accept-Encoding: *" https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@dev/dist/tessr.scss
	curl -X PURGE -H "Accept-Encoding: *" https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@dev/dist/tessr.styl
	curl -X PURGE -H "Accept-Encoding: *" https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@dev/dist/app-loader-global-style.css

# Individual Purge for Production
purge-live:
	@echo "🚀 Purging Live Assets..."
	curl -X PURGE -H "Accept-Encoding: *" https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@live/.env.json
	curl -X PURGE -H "Accept-Encoding: *" https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@live/dist/tessr.css
	curl -X PURGE -H "Accept-Encoding: *" https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@live/dist/tessr.scss
	curl -X PURGE -H "Accept-Encoding: *" https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@live/dist/tessr.styl
	curl -X PURGE -H "Accept-Encoding: *" https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@live/dist/app-loader-global-style.css

# Purge Everything at Once
purge-all: purge-dev purge-live
	@echo "\n✨ All CDN caches cleared."
