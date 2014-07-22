HOST=gobcom
LOCAL=./
REMOTE=/vagrant
SERVICE=gobcom

DRY_RUN=#-n

upload:
	rsync -Paxu $(DRY_RUN) --filter=':- .gitignore' $(LOCAL) $(HOST):$(REMOTE)

update: upload
	ssh $(HOST) "service $(SERVICE) restart"
