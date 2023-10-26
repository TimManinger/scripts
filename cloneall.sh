#!/bin/bash

# Define the usage message
usage() {
    echo "Usage: $0 [-s] [-l] [-a]"
    echo "  -s: Option for 's'"
    echo "  -l: Option for 'l'"
    echo "  -a: Option for 'a'"
    exit 1
}

# Parse the command-line options
while getopts "sla" opt; do
    case $opt in
        s)
            s_flag=true
            ;;
        l)
            l_flag=true
            ;;
        a)
            a_flag=true
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            usage
            ;;
    esac
done

# Check if no options were provided
if [ "$#" -eq 0 ]; then
    usage
fi

# Your script logic based on the parsed options
if [ "$s_flag" = true ]; then
    parallel -a small.txt 'git clone {}'
fi

if [ "$l_flag" = true ]; then
    parallel -a large.txt 'git clone {}'
fi

if [ "$a_flag" = true ]; then
    parallel -a small.txt,large.txt 'git clone {}'
fi

