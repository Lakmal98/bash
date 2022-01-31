# check whether the internet is accessible
access=0
tools=0
# if curl is installed, and return 1 if internet is accessible
if [ -x /usr/bin/curl ]; then
    curl -s -o /dev/null http://www.google.com
    if [ $? -eq 0 ]; then
        access=$((access + 1))
    fi
    curl -s -o /dev/null http://www.amazon.com
    if [ $? -eq 0 ]; then
        access=$((access + 1))
    fi
    tools=$((tools + 1))
# if curl is not installed, and return 1 if internet is accessible using wget
elif [ -x /usr/bin/wget ]; then
    wget -q --spider http://www.google.com
    if [ $? -eq 0 ]; then
        access=$((access + 1))
    fi
    wget -q --spider http://www.amazon.com
    if [ $? -eq 0 ]; then
        access=$((access + 1))
    fi
    tools=$((tools + 1))
fi

if [ $access -gt 0 ]; then
    # internet is accessible
    echo "1"
else
    # No internet access
    echo "0"
fi

# tools not installed
if [ $tools -eq 0 ]; then
    echo "2"
fi
