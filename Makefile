HOST=gobcom
LOCAL=./
REMOTE=/vagrant

upload:
	rsync -Pax $(LOCAL) $(HOST):$(REMOTE)
