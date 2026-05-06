.PHONY: all bootstrap install

BOLD := \033[1m
CYAN := \033[36m
RESET := \033[0m

all: bootstrap install

bootstrap:
	@echo "$(CYAN)$(BOLD)==> bootstrap$(RESET)"
	@./scripts/bootstrap.sh
	@echo ""

install:
	@echo "$(CYAN)$(BOLD)==> install$(RESET)"
	@./scripts/install.sh
	@echo ""
