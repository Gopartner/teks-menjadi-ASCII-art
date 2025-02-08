# Makefile untuk menginstal figlet dan menjalankan ascii_art.sh

.PHONY: all install run

# Target default
all: install run

# Target untuk menginstal figlet
install:
	@if command -v figlet &> /dev/null; then \
		echo "figlet sudah terinstal. Lewati instalasi." > /dev/null; \
	else \
		@echo "Mendeteksi sistem operasi..." | tee -a install.log; \
		if [ -f /etc/debian_version ]; then \
			echo "Sistem operasi terdeteksi: Debian/Ubuntu" | tee -a install.log; \
			echo "Menginstal figlet..." | tee -a install.log; \
			sudo apt-get install -y figlet > /dev/null 2>&1; \
		elif [ -f /data/data/com.termux/files/usr/bin/bash ]; then \
			echo "Sistem operasi terdeteksi: Termux" | tee -a install.log; \
			echo "Menginstal figlet..." | tee -a install.log; \
			pkg install -y figlet > /dev/null 2>&1; \
		else \
			echo "Sistem operasi tidak didukung. Harap instal figlet secara manual." | tee -a install.log; \
			exit 1; \
		fi; \
	fi

# Target untuk memberikan izin eksekusi dan menjalankan ascii_art.sh
run:
	@if [ -x ascii_art.sh ]; then \
		echo "..." | tee -a install.log; \
	else \
		@echo "..." | tee -a install.log; \
		chmod +x ascii_art.sh > /dev/null 2>&1; \
	fi
	@echo "..." | tee -a install.log
	./ascii_art.sh
