
head -c 32 /dev/urandom | sha256sum | awk '{print $1}' | head -c 4