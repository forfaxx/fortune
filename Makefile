# ─── Makefile for "fortune" databases ───

# Detect platform and set install path for fortunes
UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Darwin)
    BREW_PREFIX := $(shell which brew > /dev/null 2>&1 && brew --prefix fortune)
    ifeq ($(BREW_PREFIX),)
        $(error Homebrew not found — please install fortune via brew)
    endif
    FORTUNE_DIR := $(BREW_PREFIX)/share/games/fortunes
else
    FORTUNE_DIR := /usr/share/games/fortunes
endif

# List extensionless source files (ignores Makefile, README.md, .dat)
FORTUNES := $(filter-out Makefile README.md,$(filter-out %.dat,$(wildcard *)))
DATAFILES := $(addsuffix .dat,$(FORTUNES))

# Default target: build all .dat files
all: $(DATAFILES)

# Rule to generate .dat from source using strfile
%.dat: %
	@echo "📜 Compiling $< → $@"
	@strfile $< $@

# Install target with automatic platform detection
install: all
	@echo "📦 Installing fortunes to: $(FORTUNE_DIR)"
	@mkdir -p "$(FORTUNE_DIR)"
	@for f in $(FORTUNES); do \
	  install -m 644 "$$f" "$(FORTUNE_DIR)/$$f"; \
	  install -m 644 "$$f.dat" "$(FORTUNE_DIR)/$$f.dat"; \
	done
	@echo "✅ Done. Fortunes installed to $(FORTUNE_DIR)"

# Clean up compiled .dat files
clean:
	@echo "🧹 Cleaning up..."
	@rm -f $(DATAFILES)

