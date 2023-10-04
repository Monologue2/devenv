#!/bin/bash

# 학교 -> 집으로 접속 중
# 집 -> 학교는 방화벽으로 인해 접속 불가

# ssh -R 집Port:학교Address:학교Port 집User@집서버
ssh -f -N -T -p 10000 -R 10150:localhost:80 shogle@shogle.site