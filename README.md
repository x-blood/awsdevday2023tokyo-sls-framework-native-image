# awsdevday2023tokyo-sls-framework-native-image

## Result of K6

```
     data_received..................: 1.2 MB 540 kB/s
     data_sent......................: 168 kB 78 kB/s
     http_req_blocked...............: avg=242.98ms min=171.27ms med=217.82ms max=337.06ms p(90)=305.71ms p(95)=321.93ms
     http_req_connecting............: avg=12.78ms  min=6.01ms   med=11.92ms  max=22.64ms  p(90)=18.44ms  p(95)=19.45ms 
     http_req_duration..............: avg=758.08ms min=626.34ms med=761.11ms max=906.53ms p(90)=812.25ms p(95)=828.63ms
       { expected_response:true }...: avg=758.08ms min=626.34ms med=761.11ms max=906.53ms p(90)=812.25ms p(95)=828.63ms
     http_req_failed................: 0.00%  ✓ 0         ✗ 200  
     http_req_receiving.............: avg=198.58µs min=6µs      med=20µs     max=4.2ms    p(90)=655.29µs p(95)=1.14ms  
     http_req_sending...............: avg=89.13µs  min=26µs     med=47µs     max=2.48ms   p(90)=130.4µs  p(95)=164.49µs
     http_req_tls_handshaking.......: avg=175.7ms  min=106.56ms med=152.14ms max=259.54ms p(90)=235.09ms p(95)=247.94ms
     http_req_waiting...............: avg=757.8ms  min=626.26ms med=760.91ms max=906.44ms p(90)=811.46ms p(95)=828.57ms
     http_reqs......................: 200    92.459725/s
     iteration_duration.............: avg=2.04s    min=1.94s    med=2.04s    max=2.15s    p(90)=2.1s     p(95)=2.1s    
     iterations.....................: 200    92.459725/s
     vus............................: 180    min=180     max=200
     vus_max........................: 200    min=200     max=200
```

## Result of CloudWatch Logs Insights

```
filter @type="REPORT" and ispresent(@initDuration)
| stats count() as coldStarts, avg(@maxMemoryUsed), avg(@duration + @initDuration) as totalDuration_avg, avg(@duration), avg(@initDuration), min(@initDuration), max(@initDuration) by bin(10m)
```
---
| coldStarts | avg(@maxMemoryUsed) | totalDuration_avg | avg(@duration) | avg(@initDuration) | min(@initDuration) | max(@initDuration) |
|------------|---------------------|-------------------|----------------|--------------------|--------------------|--------------------|
| 200        | 79010000            | 413.1846          | 152.6565       | 260.5281           | 252.8              | 272.06             |
---

