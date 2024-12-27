NAME ?= LineageOS-Kernel
DEVICE := Vince
LINUX_VERSION := 4.9
DATE := $(shell date "+%d%m%Y-%I%M")

SZIP := LINEAGEOS-KERNEL-VINCE-4.9-STABLE-$(DATE).zip
BZIP := $(NAME)-$(DEVICE)-$(LINUX_VERSION)-BETA-$(DATE).zip
TZIP := $(NAME)-$(DEVICE)-$(LINUX_VERSION)-TEST-$(DATE).zip

EXCLUDE := Makefile *.git* *.jar* *.zip* README.md *placeholder

stable: $(SZIP)
beta: $(BZIP)
test: $(TZIP)

$(SZIP):
	@echo "Creating ZIP: $(SZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."
	
$(BZIP):
	@echo "Creating ZIP: $(BZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."
	
$(TZIP):
	@echo "Creating ZIP: $(TZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."		

clean:
	@rm -vf *.zip*
	@rm -vf Image.gz-dtb
	@echo "Done."
