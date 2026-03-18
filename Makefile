# Individual Purge for Development
purge-dev:
	@echo "🧹 Purging Dev Assets..."
	curl -X PURGE https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@dev/.env.json
	curl -X PURGE https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@dev/dist/tessr.css
	curl -X PURGE https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@dev/dist/tessr.styl
	curl -X PURGE https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@dev/dist/tessr.scss

# Individual Purge for Production
purge-live:
	@echo "🚀 Purging Live Assets..."
	curl -X PURGE https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@live/.env.json
	curl -X PURGE https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@live/dist/tessr.css
	curl -X PURGE https://cdn.jsdelivr.net/gh/arbocollab/arbo-glob@live/dist/tessr.styl

# Purge Everything at Once
purge-all: purge-dev purge-live
	@echo "\n✨ All CDN caches cleared."