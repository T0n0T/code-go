TARGET         =uart
DEST_DIR      ?=_install
CC            ?= arm-linux-gnueabihf-gcc

build:
	@$(CC) -o $(TARGET) tty_test.c -lpthread

hold:
	@echo "uart hold[skip]"

install:
	@mkdir -p $(DEST_DIR)
	@cp $(TARGET) $(DEST_DIR)

uninstall:
	@rm -fr $(DEST_DIR)/$(TARGET)

distclean: uninstall
	@rm -fr $(TARGET)
	@rm -fr _install
