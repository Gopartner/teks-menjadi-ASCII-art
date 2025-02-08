#!/bin/bash

# Fungsi untuk menampilkan menu
show_menu() {
    echo "=============================="
    echo "  ASCII Art Generator"
    echo "=============================="
    echo "1. Ponsel (Small)"
    echo "2. Tablet (Medium)"
    echo "3. Desktop (Large)"
    echo "4. Keluar"
    echo "=============================="
}

# Fungsi untuk menghasilkan ASCII art
generate_ascii_art() {
    local text="$1"
    local size="$2"

    case $size in
        "small")
            figlet -f small "$text"
            ;;
        "medium")
            figlet -f standard "$text"
            ;;
        "large")
            figlet -f big "$text"
            ;;
        *)
            echo "Ukuran tidak valid."
            ;;
    esac
}

# Loop utama
while true; do
    show_menu
    read -p "Pilih ukuran output (1-4): " choice

    case $choice in
        1)
            read -p "Masukkan teks: " input_text
            generate_ascii_art "$input_text" "small"
            ;;
        2)
            read -p "Masukkan teks: " input_text
            generate_ascii_art "$input_text" "medium"
            ;;
        3)
            read -p "Masukkan teks: " input_text
            generate_ascii_art "$input_text" "large"
            ;;
        4)
            echo "Keluar dari program."
            exit 0
            ;;
        *)
            echo "Pilihan tidak valid. Silakan coba lagi."
            ;;
    esac

    echo ""
done
