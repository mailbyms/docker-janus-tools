# janus-tools

## 背景
- Jitsi 应用在项目中，需要对每个与会者单独录制视频
- JVB 可以录制成 pcap 文件（Wireshark 格式）。可以修改 JVB 代码，记录每个与会者对应的 SSRC
- pcap 可以用 `pcap2mjr` 转换成 mjr 格式，mjr 可以用 `janus-pp-rec` 转换成 webm 格式。webm 格式在 Chrome 浏览器或者 PotPlayer 可以播放 
- Debian 系统软件仓库自带 `janus-pp-rec` 和 `pcap2mjr` ，在软件包 `janus-tools` 里，见：https://manpages.debian.org/testing/janus-tools/pcap2mjr.1.en.html
- 如果直接在仓库里安装，注意版本，旧版本不带 pcap2mjr 
  ```
  apt-get install janus-tools=0.10.7-1
  ``` 
- Unbuntu 20.04 软件包在 http://archive.ubuntu.com/ubuntu/pool/universe/j/janus/ 下载到本地再安装，会自动安装依赖库
  ```
  apt-get update
  wget  http://archive.ubuntu.com/ubuntu/pool/universe/j/janus/janus-tools_0.10.9-1_amd64.deb
  apt-get install ./janus-tools_0.10.9-1_amd64.deb
  ```

## 使用
```
  pcap2mjr -c vp8 -s 563053759 2587ea8e-tx-2020-11-17T09_26_54.615Z.pcap a.mjr
  janus-pp-rec a.mjr a.webm
```


# 其它
WebRTC 有官方的工具 video_replay 可以播放 pcap 文件