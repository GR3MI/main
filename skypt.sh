#!/bin/bash

while [ $# -gt 0 ]; do
  case "$1" in
    --date)
      echo $(date +%Y-%m-%d)
      ;;
    --logs)
      if [[ $2 =~ ^[0-9]+$ ]]; then
        for i in $(seq 1 $2); do
          filename="log$i.txt"
          echo "Creating $filename"
          echo "Filename: $filename" > $filename
          echo "Created by: $0" >> $filename
          echo "Created on: $(date +%Y-%m-%d)" >> $filename
        done
      else
        for i in {1..100}; do
          filename="log$i.txt"
          echo "Creating $filename"
          echo "Filename: $filename" > $filename
          echo "Created by: $0" >> $filename
          echo "Created on: $(date +%Y-%m-%d)" >> $filename
        done
      fi
      shift 2
      ;;
    --help)
      echo "Usage: skrypt.sh [OPTIONS]"
      echo "Options:"
      echo "  --date      Display the current date"
      echo "  --logs      Create log files"
      echo "  --help      Display this help message"
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done
