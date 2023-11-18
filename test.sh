#!/bin/bash

while true; do
    # 启动第一个视频流
    ffmpeg -re -i /root/fireplace.mov -c:v libx264 -s 1920x1080 -preset veryfast -b:v 8000k -maxrate 8000k -bufsize 16000k -pix_fmt yuv420p -c:a aac -b:a 192k -ac 2 -ar 44100 -f flv rtmp://a.rtmp.youtube.com/live2/mhhy-7xje-sy0h-902c-fg5f &
    pid1=$!

    sleep 16  # 等待16秒，模拟视频时长

    # 结束第一个视频流
    kill $pid1
    wait $pid1 2>/dev/null

    # 启动第二个视频流
    ffmpeg -re -i /root/fireplace.mov -c:v libx264 -s 1920x1080 -preset veryfast -b:v 8000k -maxrate 8000k -bufsize 16000k -pix_fmt yuv420p -c:a aac -b:a 192k -ac 2 -ar 44100 -f flv rtmp://a.rtmp.youtube.com/live2/mhhy-7xje-sy0h-902c-fg5f &
    pid2=$!

    sleep 16  # 等待16秒，模拟视频时长

    # 结束第二个视频流
    kill $pid2
    wait $pid2 2>/dev/null
done
