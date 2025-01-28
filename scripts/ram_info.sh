free -m | awk '/Mem:/ {printf " %.1fG/%.1fG", $3/1024, $2/1024}'
