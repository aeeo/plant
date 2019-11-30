# plant人脸识别考勤系统

端口：9080

**首次运行注意事项：**
1. 修改application.properties下的
```
    config.arcface-sdk.sdk-lib-path
    spring.datasource.druid.url
    spring.datasource.druid.username
    spring.datasource.druid.password
```
2. 访问url
```
    localhost:9080/login
```